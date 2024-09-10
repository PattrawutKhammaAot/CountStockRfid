import 'dart:async';

import 'dart:io';
import 'dart:math';

import 'package:android_path_provider/android_path_provider.dart';
import 'package:countstock_rfid/screens/scan/model/dropdownModel.dart';
import 'package:countstock_rfid/screens/settings/model/appsettingModel.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:countstock_rfid/app.dart';

import 'package:countstock_rfid/config/appConfig.dart';
import 'package:countstock_rfid/config/appConstants.dart';
import 'package:countstock_rfid/database/database.dart';
import 'package:countstock_rfid/main.dart';
import 'package:countstock_rfid/screens/scan/tableViewScan.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/safe_area_values.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../config/appData.dart';
import '../../nativefunction/nativeFunction.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key, this.onChange, this.receiveValue});
  final ValueChanged<List<GridDataList>>? onChange;
  final List<GridDataList>? receiveValue;

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  GridDataSource? dataSource;
  List<ItemMasterDBData> itemList = [];
  List<dropdownModel> dropdownList = [];
  List<GridDataList> _addTable = [];
  FocusNode focusNode = FocusNode();
  FocusNode fakefocusNode = FocusNode();
  TextEditingController _controller = TextEditingController();
  String selectLocationDropdown = "";
  String locationCode = "";
  String selectSerialDropdown = "";

  bool isLocation = false;
  bool isSerial = false;

  bool isScanning = false;
  bool isHide = true;

  @override
  void initState() {
    SDK_Function.init();

    dataSource = GridDataSource(process: []);
    transactionDB.getValidate();

    AppData.setPopupInfo("page_scan");
    super.initState();
  }

  @override
  void dispose() {
    SDK_Function.scan(false);
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: KeyboardListener(
            focusNode: focusNode,
            autofocus: true,
            onKeyEvent: (e) async {
              if (e is KeyDownEvent) {
                if (e.logicalKey.keyId == customKeyId) {
                  if (isLocation && selectLocationDropdown.isEmpty) {
                    EasyLoading.showError("Please select Location");
                    return;
                  }
                  if (isSerial && selectSerialDropdown.isEmpty) {
                    EasyLoading.showError("Please select Serial Number");
                    return;
                  }
                  await SDK_Function.scan(true);
                  isScanning = true;
                }

                setState(() {});
              } else if (e is KeyUpEvent) {
                if (e.logicalKey.keyId == customKeyId) {
                  await SDK_Function.scan(false);
                  isScanning = false;
                } else {
                  await SDK_Function.scan(false);
                  isScanning = false;
                }
                setState(() {});
              }
            },
            child: Column(
              children: [
                Visibility(
                    visible: isHide,
                    child: Center(
                      child: SizedBox(
                        height: 1,
                        width: 1,
                        child: TextFormField(
                          focusNode: fakefocusNode,
                          controller: _controller,
                        ),
                      ),
                    )),
                SizedBox(
                  height: 0,
                ),
                FutureBuilder(
                    future: transactionDB.getValidate(),
                    builder: (context, snapshot) {
                      if (snapshot.data == null) {
                        return SizedBox.shrink();
                      }
                      if (snapshot.data!.isNotEmpty) {
                        dropdownList = snapshot.data!.cast<dropdownModel>();
                        dropdownList.where((element) {
                          if (element.name == "Location Code") {
                            isLocation = element.is_active;
                          } else if (element.name == "Serial Number") {
                            isSerial = element.is_active;
                          }
                          return true;
                        }).toList();
                        return Expanded(
                          child: ListView.builder(
                            itemCount: dropdownList.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  if (dropdownList[index]
                                      .valueDropdown!
                                      .isEmpty) {
                                    EasyLoading.showError("No Data");
                                  }
                                },
                                child: _dropdown(
                                  prefixIcon: dropdownList[index].is_validate
                                      ? Icon(
                                          Icons.check_circle,
                                          color: Colors.green,
                                        )
                                      : Icon(
                                          Icons.cancel,
                                          color: Colors.red,
                                        ),
                                  hintText: dropdownList[index].name,
                                  items: dropdownList[index]
                                      .valueDropdown!
                                      .map((e) => DropdownMenuItem<String>(
                                            value: e.location_name,
                                            child: Text(e.location_name),
                                          ))
                                      .toList(),
                                  onChanged: (value) {
                                    if (dropdownList[index].name ==
                                        "Location Code") {
                                      locationCode = dropdownList[index]
                                          .valueDropdown!
                                          .where((element) =>
                                              element.location_name == value)
                                          .first
                                          .location_code;
                                      if (kDebugMode) {
                                        print(locationCode);
                                      }
                                      selectLocationDropdown = value!;
                                    } else {
                                      selectSerialDropdown = value!;
                                    }
                                    setState(() {});
                                  },
                                  onSaved: (value) {
                                    if (dropdownList[index].name ==
                                        "Location Code") {
                                      selectLocationDropdown = value!;
                                    } else {
                                      selectSerialDropdown = value!;
                                    }
                                    setState(() {});
                                  },
                                ),
                              );
                            },
                          ),
                        );
                      }
                      return SizedBox.shrink();
                    }),
                _gridData(SDK_Function.setTagScannedListener((epc, dbm) {
                  onEventScan(epc.trim(), dbm).then((value) async {});
                  // _addTable.add(tempRfidItemList(
                  //   rfid_tag: epc,
                  //   rssi: dbm,
                  //   status: "Found",
                  // ));
                  // setState(() {
                  //   zincDataSource =
                  //       ZincDataSource(process: _addTable);
                  // });
                })),
                SizedBox(
                  height: 5,
                ),
                _btnAndDetail(
                  onPressed: () async {
                    onEventScan(_controller.text, "0").then((value) async {});
                    // if (isLocation && selectLocationDropdown.isEmpty) {
                    //   EasyLoading.showError("Please select Location");
                    //   return;
                    // }
                    // if (isSerial && selectSerialDropdown.isEmpty) {
                    //   EasyLoading.showError("Please select Serial Number");
                    //   return;
                    // }
                    // if (!isScanning) {
                    //   await SDK_Function.scan(true);
                    //   isScanning = true;
                    // } else {
                    //   await SDK_Function.scan(false);
                    //   isScanning = false;
                    // }
                    setState(() {});
                  },
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            )));
  }

  Widget _dropdown(
      {String? hintText,
      List<DropdownMenuItem<String>>? items,
      Function(String?)? onChanged,
      Function(String?)? onSaved,
      Widget? prefixIcon}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButtonFormField2<String>(
        isExpanded: true,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          // Add Horizontal padding using menuItemStyleData.padding so it matches
          // the menu padding when button's width is not specified.
          contentPadding: const EdgeInsets.symmetric(vertical: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          // Add more decoration..
        ),
        hint: Text(
          hintText!,
          style: TextStyle(fontSize: 14),
        ),
        items: items,
        onChanged: onChanged,
        onSaved: onSaved,
        buttonStyleData: const ButtonStyleData(
          padding: EdgeInsets.only(right: 8),
        ),
        iconStyleData: const IconStyleData(
          icon: Icon(
            Icons.arrow_drop_down,
            color: Colors.black45,
          ),
          iconSize: 24,
        ),
        dropdownStyleData: DropdownStyleData(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          padding: EdgeInsets.symmetric(horizontal: 16),
        ),
      ),
    );
  }

  Widget _gridData(Future<String>? future) {
    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        return Expanded(
          flex: 2,
          child: SfDataGrid(
            onFilterChanged: (details) {
              print(details.column);
            },
            source: dataSource!,
            headerGridLinesVisibility: GridLinesVisibility.both,
            gridLinesVisibility: GridLinesVisibility.both,
            selectionMode: SelectionMode.multiple,
            allowPullToRefresh: true,
            allowSorting: true,
            allowColumnsResizing: true,
            columnWidthMode: ColumnWidthMode.fill,
            columns: <GridColumn>[
              GridColumn(
                  visible: true,
                  columnName: 'rfid_tag',
                  label: Container(
                    color: Colors.white,
                    child: Center(
                      child: Text(
                        appLocalizations.txt_number_tag,
                      ),
                    ),
                  ),
                  allowSorting: false),
              GridColumn(
                  visible: true,
                  columnName: 'RSSI',
                  label: Container(
                    color: Colors.white,
                    child: Center(
                      child: Text(
                        'Rssi',
                      ),
                    ),
                  ),
                  allowSorting: true),
              GridColumn(
                  visible: true,
                  columnName: 'Status',
                  label: Container(
                    color: Colors.white,
                    child: Center(
                      child: Text(
                        appLocalizations.txt_status,
                      ),
                    ),
                  ),
                  allowSorting: false),
            ],
          ),
        );
      },
    );
  }

  Widget _btnAndDetail({void Function()? onPressed}) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.1,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(
                      1.0,
                      1.0,
                    ),
                    blurRadius: 5.0,
                    spreadRadius: 2.0,
                  ), //BoxShadow
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(0.0, 0.0),
                    blurRadius: 0.0,
                    spreadRadius: 0.0,
                  ),
                ],
                border: Border.all(color: Colors.white, width: 1)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll<Color>(
                            isScanning
                                ? Colors.red
                                : Colors.grey.withOpacity(0.5))),
                    onPressed: onPressed,
                    child: Text(
                        isScanning
                            ? appLocalizations.btn_stop_scan
                            : appLocalizations.btn_start_scan,
                        style: TextStyle(color: Colors.white))),
                Text("${appLocalizations.txt_total}: ${_addTable.length}"),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll<Color>(
                            Colors.orangeAccent)),
                    onPressed: () async {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                title:
                                    Text(appLocalizations.popup_del_title_all),
                                content:
                                    Text(appLocalizations.popup_del_sub_all),
                                actions: [
                                  TextButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  Colors.blue)),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        appLocalizations.btn_cancel,
                                        style: TextStyle(color: Colors.white),
                                      )),
                                  TextButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  Colors.redAccent)),
                                      onPressed: () {
                                        _addTable.clear();
                                        setState(() {
                                          dataSource =
                                              GridDataSource(process: []);
                                        });

                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        appLocalizations.btn_delete,
                                        style: TextStyle(color: Colors.white),
                                      ))
                                ],
                              ));
                    },
                    child: Text(
                      appLocalizations.btn_clear_all,
                      style: TextStyle(color: Colors.white),
                    ))
                // Text(
                //     "${appLocalizations.txt_found}: ${_addTable.where((element) => element.status == "Found").toList().length}"),
                // Text(
                //     "${appLocalizations.txt_not_found}: ${_addTable.where((element) => element.status != "Found").toList().length}"),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future onEventScan(String _controller, String rssi) async {
    if (!_controller.isNotEmpty) {
      final itemReturn = await transactionDB.scanItem(TransactionsDBData(
        key_id: 0,
        count_ItemCode: "i00004".toUpperCase(),
        count_location_code: locationCode,
        serial_number: selectSerialDropdown,
        count_location_name: selectLocationDropdown,
        rssi: "${Random().nextInt(100)}",
      ));

      _addTable.add(itemReturn);
    }
    setState(() {
      dataSource = GridDataSource(process: _addTable);
    });
  }

  Future<void> exportDataToTxt() async {
    try {
      await Permission.manageExternalStorage.request();
      if (await Permission.manageExternalStorage.request().isGranted) {
        var directory = await AndroidPathProvider.downloadsPath;

        var selectDirectory = directory;
        var directoryExists = await Directory(selectDirectory).exists();
        if (!directoryExists) {
          await Directory(selectDirectory).create(recursive: true);
        }

        var now = DateTime.now();
        var formatter = DateFormat('dd_MM_yyyy_HH_mm_ss');
        var formattedDate = formatter.format(now);

        var pathFile = '$selectDirectory/rfid_scanned_$formattedDate.txt';
        var file = File(pathFile);
        var sink = file.openWrite();
        sink.write('tag|Rssi|status\n');
        for (var item in _addTable) {
          sink.write('${item.rfid_tag}|${item.rssi} dBm|${item.status}\n');
        }

        await sink.close();

        EasyLoading.showSuccess(appLocalizations.txt_export_success);
        print(pathFile);
      } else {
        openAppSettings();
      }
      print("object");
    } catch (e, s) {
      print("$e$s");
    }
  }
}
