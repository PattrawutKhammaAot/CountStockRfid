import 'dart:convert';
import 'dart:io';

import 'package:csv/csv.dart';
import 'package:drift/drift.dart';
import 'package:countstock_rfid/database/database.dart';
import 'package:file_picker/file_picker.dart';

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

  Future<void> imporLocationMaster() async {
    try {
      final FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['csv'],
      );

      if (result != null) {
        await _db.delete(_db.locationMasterDB).go();
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

  Future<List<LocationMasterDBData>> searchMaster(String s) async {
    if (s.isEmpty) {
      return (_db.select(_db.locationMasterDB)).get();
    } else {
      return (_db.select(_db.locationMasterDB)
            ..where((tbl) => tbl.location_code.like('%$s%')))
          .get();
    }
  }
}
