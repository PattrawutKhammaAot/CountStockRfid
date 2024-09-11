import 'package:countstock_rfid/config/appConstants.dart';
import 'package:countstock_rfid/database/database.dart';
import 'package:countstock_rfid/database/transactionsDB.dart';
import 'package:countstock_rfid/main.dart';
import 'package:countstock_rfid/utils/CustomTextInput.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';

class EditDetailScreen extends StatefulWidget {
  const EditDetailScreen({super.key});

  @override
  State<EditDetailScreen> createState() => _EditDetailScreenState();
}

class _EditDetailScreenState extends State<EditDetailScreen> {
  TransactionsDBData itemModel =
      TransactionsDBData(key_id: 0, count_ItemCode: '');

  TextEditingController itemCodeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController serialNumberController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController quantityScanController = TextEditingController();
  TextEditingController quantityPlanController = TextEditingController();
  TextEditingController scanByController = TextEditingController();
  TextEditingController scanDateController = TextEditingController();
  TextEditingController statusController = TextEditingController();

  List<String> dropdownList = [
    StatusAssets.status_normal,
    StatusAssets.status_dmg,
    StatusAssets.status_loss
  ];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final arguments = ModalRoute.of(context)?.settings.arguments;
      if (arguments != null) {
        setState(() {
          itemModel = arguments as TransactionsDBData;
          onChangeValues();
        });
      }
    });
    // TODO: implement initState
    super.initState();
  }

  Future onChangeValues() async {
    itemCodeController.text = itemModel.count_ItemCode;
    descriptionController.text = itemModel.itemDesc.toString();
    serialNumberController.text = itemModel.serial_number.toString();
    locationController.text = itemModel.count_location_name.toString();
    quantityScanController.text = itemModel.count_QuantityScan.toString();
    quantityPlanController.text =
        await itemMasterDB.getQtyPlan(itemCodeController.text);
    scanByController.text = itemModel.scan_by.toString();

    final formatedDate = DateFormat('dd-MM-yyyy hh:mm')
        .format(itemModel.created_date ?? DateTime.now());
    scanDateController.text = formatedDate;
    statusController.text = itemModel.status_item.toString();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue[700],
        title: Text(
          'Edit Details',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CustomTextInput(
              readOnly: true,
              labelText: "Item Code",
              controller: itemCodeController,
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextInput(
              readOnly: true,
              labelText: "Desciption",
              maxLines: 3,
              controller: descriptionController,
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextInput(
              readOnly: true,
              labelText: "Serial Number",
              controller: serialNumberController,
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextInput(
              readOnly: true,
              labelText: "Location",
              controller: locationController,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomTextInput(
                    readOnly: true,
                    labelText: "Qty Scan",
                    controller: quantityScanController,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: CustomTextInput(
                    readOnly: true,
                    labelText: "Qty Plan",
                    controller: quantityPlanController,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomTextInput(
                    readOnly: true,
                    labelText: "Scan By",
                    controller: scanByController,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: CustomTextInput(
                    readOnly: true,
                    labelText: "Scan Date",
                    controller: scanDateController,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            statusController.text.isNotEmpty
                ? DropdownButtonFormField2<String>(
                    isExpanded: true,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    items: dropdownList
                        .map((e) => DropdownMenuItem<String>(
                              value: e,
                              child: Text(e),
                            ))
                        .toList(),
                    value: statusController.text,
                    onChanged: (v) {
                      setState(() {
                        statusController.text = v!;
                      });
                    },
                    onSaved: (v) {
                      statusController.text = v!;
                    },
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
                  )
                : SizedBox.shrink(),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                    child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              WidgetStatePropertyAll(Colors.blue[700]),
                        ),
                        onPressed: () async {
                          transactionDB.updateEdit(TransactionsDBData(
                              key_id: itemModel.key_id,
                              count_ItemCode: itemCodeController.text,
                              status_item: statusController.text));
                          EasyLoading.showSuccess(appLocalizations.success);
                        },
                        child: Text(
                          "Save",
                          style: TextStyle(color: Colors.white),
                        ))),
              ],
            )
          ],
        ),
      ),
    );
  }
}
