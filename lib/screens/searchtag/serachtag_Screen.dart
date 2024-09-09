import 'dart:async';
import 'dart:io';

import 'package:android_path_provider/android_path_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:countstock_rfid/app.dart';
import 'package:countstock_rfid/blocs/search/search_bloc.dart';

import 'package:countstock_rfid/config/appData.dart';
import 'package:countstock_rfid/database/database.dart';
import 'package:countstock_rfid/main.dart';
import 'package:countstock_rfid/nativefunction/nativeFunction.dart';

class SearchTagsScreen extends StatefulWidget {
  const SearchTagsScreen({super.key});

  @override
  State<SearchTagsScreen> createState() => _SearchTagsScreenState();
}

class _SearchTagsScreenState extends State<SearchTagsScreen> {
  FocusNode focusNode = FocusNode();
  TextEditingController searchController = TextEditingController();
  String dropdownValue = 'One';
  bool isFilter = false;
  String isFilter_status = "Default";
  List<TransactionsDBData> itemModel = [];
  List<TransactionsDBData> temp_itemModel = [];
  // StreamSubscription<SearchRfidState>? _subscription;

  @override
  void initState() {
    BlocProvider.of<SearchBloc>(context).add(
      GetSerachEvent(''),
    );
    // appDb.deleteTagRunningDuplicate().then((value) {

    //   focusNode.requestFocus();
    //   Future.delayed(Duration(milliseconds: 500), () async {
    //     SystemChannels.textInput.invokeMethod('TextInput.hide');
    //     setState(() {});
    //   });
    // });

    // _subscribeToBloc();
    AppData.setPopupInfo("page_serachtag");
    // TODO: implement initState
    super.initState();
  }

  // void _subscribeToBloc() {
  //   _subscription = context.read<SearchRfidBloc>().stream.listen((state) {
  //     if (state.status == FetchStatus.deleteAllSuccess) {
  //       itemModel.clear();
  //       temp_itemModel.clear();
  //       if (mounted) {
  //         setState(() {});
  //       }
  //     }
  //   });
  // }

  @override
  void dispose() {
    // _subscription?.cancel();
    super.dispose();
  }

  // Future<void> exportDataToTxt() async {
  //   try {
  //     await Permission.manageExternalStorage.request();
  //     if (await Permission.manageExternalStorage.request().isGranted) {
  //       var directory = await AndroidPathProvider.downloadsPath;

  //       var selectDirectory = directory;
  //       var directoryExists = await Directory(selectDirectory).exists();
  //       if (!directoryExists) {
  //         await Directory(selectDirectory).create(recursive: true);
  //       }

  //       var now = DateTime.now();
  //       var formatter = DateFormat('dd_MM_yyyy_HH_mm_ss');
  //       var formattedDate = formatter.format(now);

  //       var pathFile = '$selectDirectory/st_rfid_$formattedDate.txt';
  //       var file = File(pathFile);
  //       var sink = file.openWrite();
  //       sink.write('tag|Rssi|status\n');
  //       for (var item in itemModel) {
  //         sink.write('${item.ItemCode}|${item.rssi} dBm|${item.status}\n');
  //       }

  //       await sink.close();
  //       EasyLoading.showSuccess(appLocalizations.txt_export_success);
  //       print(pathFile);
  //     } else {
  //       openAppSettings();
  //     }
  //     print("object");
  //   } catch (e, s) {
  //     print("$e$s");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<SearchBloc, SearchState>(listener: (context, state) async {
          if (state.status == FetchStatus.fetching) {}
          if (state.status == FetchStatus.saved) {
            itemModel = state.data!;
            temp_itemModel = state.data!;

            setState(() {});
          }
        })
      ],
      child: Scaffold(
        body: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(5),
                  child: TextField(
                    controller: searchController,
                    focusNode: focusNode,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: appLocalizations.search,
                    ),
                    onChanged: (value) {
                      if (value.length > 1) {
                        context.read<SearchBloc>().add(GetSerachEvent(value));
                      } else if (value.length == 0) {
                        context.read<SearchBloc>().add(GetSerachEvent(''));
                      }
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                        style: const ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(Colors.blueAccent)),
                        onPressed: () async {
                          if (itemModel.length > 0) {
                            // await exportDataToTxt();
                          } else {
                            EasyLoading.showError(appLocalizations.no_data);
                          }
                        },
                        child: Text(
                          appLocalizations.btn_export_data,
                          style: TextStyle(color: Colors.white),
                        )),
                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                                isFilter_status == "Found"
                                    ? Colors.green
                                    : isFilter_status == "Not Found"
                                        ? Colors.redAccent
                                        : Colors.blue)),
                        onPressed: () {
                          // if (isFilter_status == "Default") {
                          //   itemModel = temp_itemModel
                          //       .where((element) => element.status == "Found")
                          //       .toList();
                          //   isFilter_status = "Found";
                          // } else if (isFilter_status == "Found") {
                          //   itemModel = temp_itemModel
                          //       .where(
                          //           (element) => element.status == "Not Found")
                          //       .toList();
                          //   isFilter_status = "Not Found";
                          // } else if (isFilter_status == "Not Found") {
                          //   context.read<SearchBloc>().add(GetSerachEvent(''));
                          //   isFilter_status = "Default";
                          // }

                          setState(() {});
                        },
                        child: Text(
                          "${isFilter_status == "Default" ? "${appLocalizations.btn_status_select}" : isFilter_status == "Not Found" ? "${appLocalizations.btn_status_not_found}" : "${appLocalizations.btn_status_found}"}",
                          style: TextStyle(color: Colors.white),
                        )),
                    IconButton(
                        onPressed: () {
                          isFilter = !isFilter;
                          if (isFilter) {
                            itemModel
                                .sort((a, b) => a.rssi!.compareTo(b.rssi!));

                            // do somethings
                          } else {
                            itemModel
                                .sort((a, b) => b.rssi!.compareTo(a.rssi!));

                            // do somethings
                          }
                          setState(() {});
                        },
                        icon: CircleAvatar(
                          backgroundColor: Colors.blueAccent,
                          child: Icon(
                            isFilter
                                ? Icons.arrow_downward
                                : Icons.arrow_upward,
                            color: Colors.white,
                          ),
                        ))
                  ],
                ),
                itemModel.length > 0
                    ? Expanded(
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: itemModel.length,
                          itemBuilder: (context, index) {
                            return Slidable(
                              endActionPane: ActionPane(
                                motion: BehindMotion(),
                                children: [
                                  SlidableAction(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 0),
                                    borderRadius: BorderRadius.circular(12),
                                    spacing: 1,
                                    onPressed: (BuildContext context) {
                                      // context.read<SearchRfidBloc>().add(
                                      //     DeleteRfidEvent(
                                      //         itemModel[index].key_id));
                                      itemModel.removeAt(index);

                                      setState(() {});
                                    },
                                    backgroundColor: Colors.red,
                                    foregroundColor: Colors.white,
                                    icon: Icons.delete,
                                    label: appLocalizations.btn_delete,
                                  ),
                                ],
                              ),
                              child: Card(
                                color: itemModel[index] == "Found"
                                    ? Colors.green
                                    : Colors.redAccent,
                                margin: EdgeInsets.all(4),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${appLocalizations.txt_number_tag} : ${itemModel[index]}',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                              'Rssi : ${itemModel[index].rssi} dBm',
                                              style: TextStyle(
                                                  color: Colors.white)),
                                          // Text(
                                          //     '${appLocalizations.txt_status} : ${itemModel[index].status == "Found" ? appLocalizations.txt_found : appLocalizations.txt_not_found}',
                                          //     style: TextStyle(
                                          //         color: Colors.white)),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    : Center(
                        child: Text(appLocalizations.no_data),
                      )
              ],
            )),
      ),
    );
  }
}
