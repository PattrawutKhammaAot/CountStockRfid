import 'dart:io';

import 'package:countstock_rfid/config/appData.dart';
import 'package:countstock_rfid/database/searchDB.dart';
import 'package:countstock_rfid/main.dart';
import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart' as xlsio;

class ExportDB {
  static Future<void> exportChoice(BuildContext context) async {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () async {
                      await ExportDB().exportExcel();
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: EdgeInsets.only(top: 15),
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/icons/iconexcel.png",
                            height: 50,
                            width: 50,
                          ),
                          Center(child: Text("Export  Excel"))
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      await ExportDB().exportCsv();
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 100,
                      width: 100,
                      padding: EdgeInsets.only(top: 15),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/icons/iconCsv.png",
                            height: 50,
                            width: 50,
                          ),
                          Center(child: Text("Export Csv"))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> exportExcel() async {
    try {
      EasyLoading.show(status: 'Exporting...');
      final item = await SearchDB().serachResult('');
      final username = await AppData.getUsername() ?? "Unknown";
      final xlsio.Workbook workbook = xlsio.Workbook();
      final xlsio.Worksheet sheet = workbook.worksheets[0];
      final headers = [
        'Item Code',
        'Description',
        'Serial Number',
        'Location',
        'Quantity Scan',
        'Quantity Plan',
        'Scan By',
        'Scan Date',
        'Status',
        'UDF 01',
        'UDF 02',
        'UDF 03',
        'UDF 04',
        'UDF 05'
      ];
      for (int i = 0; i < headers.length; i++) {
        final cell = sheet.getRangeByIndex(1, i + 1);
        cell.setText(headers[i]);
        cell.cellStyle.backColor = '#FFD700';
      }
      for (int i = 0; i < item.length; i++) {
        final cell = sheet.getRangeByIndex(i + 2, 1);
        cell.setText(item[i].count_ItemCode);
        final cell1 = sheet.getRangeByIndex(i + 2, 2);
        cell1.setText(item[i].itemDesc);
        cell1.columnWidth = 30;
        final cell2 = sheet.getRangeByIndex(i + 2, 3);
        cell2.setText(item[i].serial_number);
        final cell3 = sheet.getRangeByIndex(i + 2, 4);
        cell3.setText(item[i].count_location_name);
        cell3.columnWidth = 20;
        final cell4 = sheet.getRangeByIndex(i + 2, 5);
        cell4.setText(item[i].count_QuantityScan.toString());
        final cell5 = sheet.getRangeByIndex(i + 2, 6);
        cell5.setText(await itemMasterDB.getQtyPlan(item[i].count_ItemCode));
        final cell6 = sheet.getRangeByIndex(i + 2, 7);
        cell6.setText(username);
        final cell7 = sheet.getRangeByIndex(i + 2, 8);
        cell7.setText(item[i].created_date.toString());
        cell7.columnWidth = 15;
        final cell8 = sheet.getRangeByIndex(i + 2, 9);
        cell8.setText("Status");
        final cell10 = sheet.getRangeByIndex(i + 2, 11);
        cell10.setText("");
        final cell11 = sheet.getRangeByIndex(i + 2, 11);
        cell11.setText("");
        final cell12 = sheet.getRangeByIndex(i + 2, 12);
        cell12.setText("");
        final cell13 = sheet.getRangeByIndex(i + 2, 13);
        cell13.setText("");
        final cell14 = sheet.getRangeByIndex(i + 2, 14);
        cell14.setText("");
      }
      final List<int> bytes = workbook.saveAsStream();
      workbook.dispose();
      final String path =
          '/storage/emulated/0/Download/CountRfid(${DateFormat("yyyyMMdd-HHmm").format(DateTime.now())}).xlsx';
      final File file = File(path);
      await file.writeAsBytes(bytes);
    } catch (e) {
      print(e);
    } finally {
      EasyLoading.showSuccess('Export Success');
    }
  }

  Future<void> exportCsv() async {
    try {
      EasyLoading.show(status: 'Exporting...');
      final item = await SearchDB().serachResult('');
      final username = await AppData.getUsername() ?? "Unknown";
      final List<List<String>> csvData = [
        [
          'Item Code',
          'Description',
          'Serial Number',
          'Location',
          'Quantity Scan',
          'Quantity Plan',
          'Scan By',
          'Scan Date',
          'Status',
          'UDF 01',
          'UDF 02',
          'UDF 03',
          'UDF 04',
          'UDF 05'
        ]
      ];
      for (int i = 0; i < item.length; i++) {
        csvData.add([
          item[i].count_ItemCode,
          item[i].itemDesc ?? "",
          item[i].serial_number ?? "",
          item[i].count_location_name ?? "",
          item[i].count_QuantityScan.toString(),
          await itemMasterDB.getQtyPlan(item[i].count_ItemCode),
          username,
          item[i].created_date.toString(),
          "Status",
          "",
          "",
          "",
          "",
          ""
        ]);
      }
      final String csv =
          ListToCsvConverter(fieldDelimiter: '|').convert(csvData);
      final String path =
          '/storage/emulated/0/Download/CountRfid(${DateFormat("yyyyMMdd-HHmm").format(DateTime.now())}).csv';
      final File file = File(path);
      await file.writeAsString(csv);
    } catch (e, s) {
      print(e);
      print(s);
    } finally {
      EasyLoading.showSuccess('Export Success');
    }
  }
}
