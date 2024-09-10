import 'dart:convert';
import 'dart:io';

import 'package:csv/csv.dart';
import 'package:drift/drift.dart';
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:countstock_rfid/database/database.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';

import '../config/appData.dart';

class ItemMasterDB extends Table {
  IntColumn get item_id => integer().autoIncrement()();
  TextColumn get Plan => text().nullable()();
  TextColumn get ItemCode => text().nullable()();
  TextColumn get ItemName => text().nullable()();
  TextColumn get ItemDescription => text().nullable()();
  TextColumn get SerialNumber => text().nullable()();
  TextColumn get Quantity => text().nullable()();
  TextColumn get Udf01 => text().nullable()();
  TextColumn get Udf02 => text().nullable()();
  TextColumn get Udf03 => text().nullable()();
  TextColumn get Udf04 => text().nullable()();
  TextColumn get Udf05 => text().nullable()();
}

abstract class ViewItemMasterDB extends View {
  ItemMasterDB get itemMasterDB;

  @override
  Query as() => select([
        itemMasterDB.Plan,
        itemMasterDB.item_id,
        itemMasterDB.ItemCode,
        itemMasterDB.ItemName,
        itemMasterDB.ItemDescription,
        itemMasterDB.SerialNumber,
        itemMasterDB.Quantity,
        itemMasterDB.Udf01,
        itemMasterDB.Udf02,
        itemMasterDB.Udf03,
        itemMasterDB.Udf04,
        itemMasterDB.Udf05,
      ]).from(itemMasterDB);
}

class ItemMaster {
  final AppDb _db;

  ItemMaster(this._db);

  Future<void> imporItemMaster() async {
    try {
      final FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['txt', 'csv'],
      );

      if (result != null) {
        final String csvPath = result.files.single.path!;

        final String csvString =
            await File(csvPath).readAsString(encoding: utf8);

        final List<List<dynamic>> csvData = CsvToListConverter().convert(
            csvString.toString().trim(),
            fieldDelimiter: '|',
            eol: '\n');
        int importCounter = await AppData().loadCounter();
        String plan_id =
            '${DateFormat('yyyyMMdd').format(DateTime.now())}-${importCounter.toString().padLeft(5, '0')}';

        // Skip the header row
        final List<List<dynamic>> dataWithoutHeader = csvData.skip(1).toList();

        dataWithoutHeader.forEach((row) async {
          // Assuming the columns are in the order: ItemCode, ItemName, ItemDescription, SerialNumber, Quantity, Udf01, Udf02, Udf03, Udf04, Udf05
          final ItemMasterDBCompanion importModel = ItemMasterDBCompanion(
            Plan: Value(plan_id),
            ItemCode: Value(row[0].toString().toUpperCase()),
            ItemName: Value(row[1].toString()),
            ItemDescription: Value(row[2].toString()),
            SerialNumber: Value(row[3].toString()),
            Quantity: Value(row[4].toString()),
            Udf01: Value(row[5].toString()),
            Udf02: Value(row[6].toString()),
            Udf03: Value(row[7].toString()),
            Udf04: Value(row[8].toString()),
            Udf05: Value(row[9].toString()),
          );
          _db.into(_db.itemMasterDB).insert(importModel);
        });
        importCounter++;
        await AppData().saveCounter(importCounter);
      }
    } catch (e, s) {
      print(e);
      print(s);
    }
  }

  Future<void> importFileExcelMaster() async {
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

        final List<List<dynamic>> dataWithoutHeader =
            excelData.skip(1).toList();
        int importCounter = await AppData().loadCounter();
        const int chunkSize = 100;

        String plan_id =
            '${DateFormat('yyyyMMdd').format(DateTime.now())}-${importCounter.toString().padLeft(5, '0')}';
        for (int i = 0; i < dataWithoutHeader.length; i += chunkSize) {
          final chunk = dataWithoutHeader.skip(i).take(chunkSize).toList();
          final List<ItemMasterDBCompanion> chunkItems = [];

          for (var row in chunk) {
            final ItemMasterDBCompanion importModel = ItemMasterDBCompanion(
              Plan: Value(plan_id),
              ItemCode: Value(row[0].toString()),
              ItemName: Value(row[1].toString()),
              ItemDescription: Value(row[2].toString()),
              SerialNumber: Value(row[3].toString()),
              Quantity: Value(row[4].toString()),
              Udf01: Value(row[5].toString()),
              Udf02: Value(row[6].toString()),
              Udf03: Value(row[7].toString()),
              Udf04: Value(row[8].toString()),
              Udf05: Value(row[9].toString()),
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
        importCounter++;
        await AppData().saveCounter(importCounter);
      }
    } catch (e, s) {
      EasyLoading.showError('Error: $e');
      print(e);
      print(s);
    } finally {
      EasyLoading.dismiss();
    }
  }

  Future<void> insertToSqlPaged(List<ItemMasterDBCompanion> items,
      {int pageSize = 100}) async {
    for (int i = 0; i < items.length; i += pageSize) {
      final end = (i + pageSize < items.length) ? i + pageSize : items.length;
      final batch = items.sublist(i, end);
      await insertBatch(batch);
    }
  }

  Future<void> insertBatch(List<ItemMasterDBCompanion> items) async {
    await _db.batch((batch) {
      batch.insertAll(_db.itemMasterDB, items);
    });
  }

  Future<List<ItemMasterDBData>> searchMaster(String s) async {
    if (s.isEmpty) {
      return (_db.select(_db.itemMasterDB)).get();
    } else {
      return (_db.select(_db.itemMasterDB)
            ..where((tbl) => tbl.ItemCode.like('%$s%')))
          .get();
    }
  }

  // Future<int> totalMaster() async {
  //   // สร้าง query ที่นับจำนวนแถวทั้งหมดในตาราง masterRfid
  //   var query = _db.selectOnly(_db.itemMasterDB)
  //     ..addColumns([
  //       _db.itemMasterDB.item_id.count()
  //     ]); // ใช้ id หรือคอลัมน์อื่นๆ ในตารางเพื่อนับ
  //   var result = await query.getSingle();
  //   return result.read(_db.itemMasterDB.item_id.count()) ?? 0;
  // }

  Future<void> deleteItemMaster() async {
    await (_db.delete(_db.itemMasterDB).go());
  }

  Future<String> getQtyPlan(String itemCode) async {
    final ItemMasterDBData item = await (_db.select(_db.itemMasterDB)
          ..where((tbl) => tbl.ItemCode.equals(itemCode.toUpperCase())))
        .getSingle();
    return item.Quantity!;
  }
}
