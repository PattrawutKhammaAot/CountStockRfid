import 'dart:convert';
import 'dart:io';

import 'package:csv/csv.dart';
import 'package:drift/drift.dart';
import 'package:file_picker/file_picker.dart';
import 'package:countstock_rfid/database/database.dart';

class ItemMasterDB extends Table {
  IntColumn get item_id => integer().autoIncrement()();
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
        allowedExtensions: ['txt'],
      );

      if (result != null) {
        await _db.delete(_db.itemMasterDB).go();
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
          final ItemMasterDBCompanion importModel = ItemMasterDBCompanion(
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
          _db.into(_db.itemMasterDB).insert(importModel);
        });
      }
    } catch (e, s) {
      print(e);
      print(s);
    }
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

  Future<int> totalMaster() async {
    // สร้าง query ที่นับจำนวนแถวทั้งหมดในตาราง masterRfid
    var query = _db.selectOnly(_db.itemMasterDB)
      ..addColumns([
        _db.itemMasterDB.item_id.count()
      ]); // ใช้ id หรือคอลัมน์อื่นๆ ในตารางเพื่อนับ
    var result = await query.getSingle();
    return result.read(_db.itemMasterDB.item_id.count()) ?? 0;
  }
}
