import 'dart:convert';
import 'dart:io';

import 'package:csv/csv.dart';
import 'package:drift/drift.dart';
import 'package:countstock_rfid/database/database.dart';
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter/material.dart' as Mt;

class LocationMasterDB extends Table {
  IntColumn get location_id => integer().autoIncrement()();
  TextColumn get location_code => text().nullable()();
  TextColumn get location_name => text().nullable()();
  TextColumn get location_desc => text().nullable()();
}

abstract class ViewLocationMasterDB extends View {
  LocationMasterDB get localtionMasterDB;

  @override
  Query as() => select([
        localtionMasterDB.location_id,
        localtionMasterDB.location_code,
        localtionMasterDB.location_name,
        localtionMasterDB.location_desc,
      ]).from(localtionMasterDB);
}

class LocationMaster {
  final AppDb _db;

  LocationMaster(this._db);

  Future<dynamic> pagingMaster(int limit, int offset) async {
    return (_db.select(_db.locationMasterDB)
          ..limit(limit, offset: offset)
          ..orderBy([(t) => OrderingTerm(expression: t.location_id)]))
        .get();
  }

  Future<void> imporLocationMaster_Txt_CSV() async {
    try {
      final FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['csv'],
      );

      if (result != null) {
        final String csvPath = result.files.single.path!;

        final String csvString =
            await File(csvPath).readAsString(encoding: utf8);

        final List<List<dynamic>> csvData = CsvToListConverter().convert(
            csvString.toString().trim(),
            fieldDelimiter: '|',
            eol: '\n');

        // Skip the header row
        final List<List<dynamic>> dataWithoutHeader = csvData.skip(1).toList();

        dataWithoutHeader.forEach((row) async {
          // Assuming the columns are in the order: ItemCode, ItemName, ItemDescription, SerialNumber, Quantity, Udf01, Udf02, Udf03, Udf04, Udf05
          final LocationMasterDBCompanion importModel =
              LocationMasterDBCompanion(
            location_code: Value(row[0].toString()),
            location_name: Value(row[1].toString()),
            location_desc: Value(row[2].toString()),
          );
          _db.into(_db.locationMasterDB).insert(importModel);
        });
      }
    } catch (e, s) {
      print(e);
      print(s);
    }
  }
  //Paging
  // Future<void> importLocationMaster_Txt_CSV() async {
  //   const int pageSize = 100; // Define the page size

  //   try {
  //     final FilePickerResult? result = await FilePicker.platform.pickFiles(
  //       type: FileType.custom,
  //       allowedExtensions: ['csv'],
  //     );

  //     if (result != null) {
  //       final String csvPath = result.files.single.path!;

  //       final String csvString =
  //           await File(csvPath).readAsString(encoding: utf8);

  //       final List<List<dynamic>> csvData = CsvToListConverter().convert(
  //           csvString.toString().trim(),
  //           fieldDelimiter: '|',
  //           eol: '\n');

  //       // Skip the header row
  //       final List<List<dynamic>> dataWithoutHeader = csvData.skip(1).toList();

  //       for (int i = 0; i < dataWithoutHeader.length; i += pageSize) {
  //         final List<List<dynamic>> chunk = dataWithoutHeader.skip(i).take(pageSize).toList();

  //         await _db.transaction(() async {
  //           for (final row in chunk) {
  //             // Assuming the columns are in the order: ItemCode, ItemName, ItemDescription, SerialNumber, Quantity, Udf01, Udf02, Udf03, Udf04, Udf05
  //             final LocationMasterDBCompanion importModel =
  //                 LocationMasterDBCompanion(
  //               location_code: Value(row[0].toString()),
  //               location_name: Value(row[1].toString()),
  //               location_desc: Value(row[2].toString()),
  //             );
  //             await _db.into(_db.locationMasterDB).insert(importModel);
  //           }
  //         });
  //       }
  //     }
  //   } catch (e, s) {
  //     print(e);
  //     print(s);
  //   }
  // }

  Future<void> importExcelFileLocationMaster() async {
    try {
      EasyLoading.show(
          status: "Loading ..", maskType: EasyLoadingMaskType.black);
      final FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['xlsx', 'xls'],
      );

      if (result != null) {
        EasyLoading.show(
            status: "Loading ..", maskType: EasyLoadingMaskType.black);
        final String excelPath = result.files.single.path!;

        final bytes = File(excelPath).readAsBytesSync();
        final excel = Excel.decodeBytes(bytes);

        final List<List<dynamic>> excelData = [];

        for (var table in excel.tables.keys) {
          final sheet = excel.tables[table];
          if (sheet != null) {
            for (var row in sheet.rows) {
              final List<dynamic> rowData =
                  row.map((cell) => cell?.value).toList();
              excelData.add(rowData);
            }
          }
        }

        // Skip the header row
        final List<List<dynamic>> dataWithoutHeader =
            excelData.skip(1).toList();

        // Process data in chunks
        const int chunkSize = 100; // Adjust the chunk size as needed

        for (int i = 0; i < dataWithoutHeader.length; i += chunkSize) {
          final chunk = dataWithoutHeader.skip(i).take(chunkSize).toList();
          final List<LocationMasterDBCompanion> chunkItems = [];

          for (var row in chunk) {
            final LocationMasterDBCompanion importModel =
                LocationMasterDBCompanion(
              location_code: Value(row[0].toString()),
              location_name: Value(row[1].toString()),
              location_desc: Value(row[2].toString()),
            );
            chunkItems.add(importModel);
          }

          await insertToSqlPaged(chunkItems);

          final progress = ((i + chunkSize) / dataWithoutHeader.length) * 100;
          if (progress <= 100) {
            EasyLoading.showProgress(progress / 100,
                status: 'Loading ... ${progress.toStringAsFixed(0)}%',
                maskType: EasyLoadingMaskType.black);
          }
        }

        EasyLoading.dismiss();
      }
    } catch (e, s) {
      EasyLoading.showError('Error: $e');
      print(e);
      print(s);
    } finally {
      EasyLoading.dismiss();
    }
  }

  Future<void> insertToSqlPaged(List<LocationMasterDBCompanion> items,
      {int pageSize = 100}) async {
    for (int i = 0; i < items.length; i += pageSize) {
      final end = (i + pageSize < items.length) ? i + pageSize : items.length;
      final batch = items.sublist(i, end);
      await insertBatch(batch);
    }
  }

  Future<void> insertBatch(List<LocationMasterDBCompanion> items) async {
    await _db.batch((batch) {
      batch.insertAll(_db.locationMasterDB, items);
    });
  }

  Future<List<LocationMasterDBData>> searchMaster(String s) async {
    if (s.isEmpty) {
      return (_db.select(_db.locationMasterDB)).get();
    } else {
      return (_db.select(_db.locationMasterDB)
            ..where((tbl) => tbl.location_code.like('%$s%')))
          .get();
    }
  }

  Future<void> deleteLocationMaster() async {
    await (_db.delete(_db.locationMasterDB).go());
  }

  Future<bool> importChoice(Mt.BuildContext context) async {
    final result = await Mt.showModalBottomSheet<bool>(
      context: context,
      builder: (Mt.BuildContext context) {
        return Mt.Padding(
          padding: Mt.EdgeInsets.all(8.0),
          child: Mt.Column(
            mainAxisSize: Mt.MainAxisSize.min,
            children: <Mt.Widget>[
              Mt.Row(
                mainAxisAlignment: Mt.MainAxisAlignment.spaceEvenly,
                children: [
                  Mt.GestureDetector(
                    onTap: () async {
                      await importExcelFileLocationMaster();
                      Mt.Navigator.pop(context, true);
                    },
                    child: Mt.Container(
                      padding: Mt.EdgeInsets.only(top: 15),
                      height: 100,
                      width: 100,
                      decoration: Mt.BoxDecoration(
                        border: Mt.Border.all(
                          color: Mt.Colors.black,
                          width: 1,
                        ),
                        borderRadius: Mt.BorderRadius.circular(10),
                      ),
                      child: Mt.Column(
                        children: [
                          Mt.Image.asset(
                            "assets/icons/iconexcel.png",
                            height: 50,
                            width: 50,
                          ),
                          Mt.Center(child: Mt.Text("Import  Excel"))
                        ],
                      ),
                    ),
                  ),
                  Mt.GestureDetector(
                    onTap: () async {
                      await imporLocationMaster_Txt_CSV();
                      Mt.Navigator.pop(
                        context,
                        true,
                      );
                    },
                    child: Mt.Container(
                      height: 100,
                      width: 100,
                      padding: Mt.EdgeInsets.only(top: 15),
                      decoration: Mt.BoxDecoration(
                        border: Mt.Border.all(
                          color: Mt.Colors.black,
                          width: 1,
                        ),
                        borderRadius: Mt.BorderRadius.circular(10),
                      ),
                      child: Mt.Column(
                        children: [
                          Mt.Image.asset(
                            "assets/icons/iconCsv.png",
                            height: 50,
                            width: 50,
                          ),
                          Mt.Center(child: Mt.Text("Import Csv"))
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
    return result ?? false;
  }
}
