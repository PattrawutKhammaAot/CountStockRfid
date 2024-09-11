import 'dart:convert';
import 'dart:ffi';

import 'package:countstock_rfid/database/appSettingDB.dart';
import 'package:countstock_rfid/main.dart';
import 'package:countstock_rfid/nativefunction/nativeFunction.dart';
import 'package:countstock_rfid/screens/settings/model/appsettingModel.dart';
import 'package:drift/drift.dart';
import 'package:countstock_rfid/database/database.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

import '../screens/scan/model/dropdownModel.dart';
import '../screens/scan/tableViewScan.dart';

class TransactionsDB extends Table {
  IntColumn get key_id => integer().autoIncrement()();
  IntColumn get item_id => integer().nullable()(); // not null
  TextColumn get count_ItemCode => text()(); //not null
  TextColumn get itemDesc => text().nullable()();
  TextColumn get count_location_name => text().nullable()();
  TextColumn get count_location_code => text().nullable()();
  IntColumn get count_QuantityScan => integer().nullable()();
  TextColumn get serial_number => text().nullable()();
  TextColumn get status_item => text().nullable()();
  TextColumn get rssi => text().nullable()();
  BoolColumn get is_Validate_Location => boolean().nullable()();
  BoolColumn get is_Validate_ItemCode => boolean().nullable()();
  BoolColumn get is_Validate_SerialNumber => boolean().nullable()();
  TextColumn get scan_by => text().nullable()();
  DateTimeColumn get created_date => dateTime().nullable()();
  DateTimeColumn get updated_date => dateTime().nullable()();
}

abstract class ViewTransactionsDB extends View {
  TransactionsDB get transactionsDB;

  @override
  Query as() => select([
        transactionsDB.key_id,
        transactionsDB.is_Validate_SerialNumber,
        transactionsDB.count_ItemCode,
        transactionsDB.count_location_name,
        transactionsDB.count_location_code,
        transactionsDB.count_QuantityScan,
        transactionsDB.status_item,
        transactionsDB.rssi,
        transactionsDB.created_date,
        transactionsDB.updated_date,
        transactionsDB.serial_number,
        transactionsDB.is_Validate_Location,
        transactionsDB.is_Validate_ItemCode,
        transactionsDB.item_id,
        transactionsDB.itemDesc,
        transactionsDB.scan_by,
      ]).from(transactionsDB);
}

class Transactions {
  final AppDb tranDb;

  Transactions(this.tranDb);

  Future<GridDataList> scanItem(TransactionsDBData data) async {
    GridDataList itemReturn = GridDataList();
    try {
      final itemDesc = await getItemDesc(data.count_ItemCode);
      List<AppsettingModel> getValidate = await appSettingDB.getValidate();
      bool isValidateLocation = getValidate
              .where((element) => element.name == 'Location Code')
              .firstOrNull
              ?.is_validate ??
          false;
      bool isValidateItemCode = getValidate
              .where((element) => element.name == 'Item Code')
              .firstOrNull
              ?.is_validate ??
          false;
      bool isValidateSerialNumber = getValidate
              .where((element) => element.name == 'Serial Number')
              .firstOrNull
              ?.is_validate ??
          false;
      final insertToDB = TransactionsDBCompanion(
        item_id: Value(0),
        count_ItemCode: Value(data.count_ItemCode),
        itemDesc: Value(itemDesc.toString()),
        count_location_name: Value(data.count_location_name),
        count_location_code: Value(data.count_location_code),
        count_QuantityScan: Value(data.count_QuantityScan ?? 1),
        serial_number: Value(data.serial_number),
        status_item: Value(data.status_item ?? ""),
        rssi: Value(data.rssi),
        created_date: Value(data.created_date),
        is_Validate_Location: Value(isValidateLocation),
        is_Validate_ItemCode: Value(isValidateItemCode),
        is_Validate_SerialNumber: Value(isValidateSerialNumber),
        scan_by: Value(data.scan_by),
      );

      if (isValidateItemCode && isValidateLocation && isValidateSerialNumber) {
        //validate ทั้งหมด
        final queryMaster = await (tranDb.selectOnly(appDb.itemMasterDB)
              ..addColumns([
                appDb.itemMasterDB.ItemCode,
                appDb.itemMasterDB.SerialNumber
              ])
              ..where(appDb.itemMasterDB.ItemCode.equals(data.count_ItemCode))
              ..where(
                  appDb.itemMasterDB.SerialNumber.equals(data.serial_number!)))
            .get();
        final queryLocation = await (tranDb.select(appDb.locationMasterDB)
              ..where(
                  (tbl) => tbl.location_code.equals(data.count_location_code!)))
            .get();

        if (queryMaster.isNotEmpty && queryLocation.isNotEmpty) {
          //do somethings
          final checkDuplicate = await (tranDb.select(appDb.transactionsDB)
                ..where((tbl) => tbl.count_ItemCode.equals(data.count_ItemCode))
                ..where((tbl) =>
                    tbl.count_location_code.equals(data.count_location_code!))
                ..where((tbl) => tbl.serial_number.equals(data.serial_number!))
                ..where((tbl) =>
                    tbl.is_Validate_ItemCode.equals(isValidateItemCode))
                ..where((tbl) =>
                    tbl.is_Validate_Location.equals(isValidateLocation))
                ..where((tbl) => tbl.is_Validate_SerialNumber
                    .equals(isValidateSerialNumber)))
              .get();
          if (checkDuplicate.isEmpty) {
            await tranDb.into(appDb.transactionsDB).insert(insertToDB);
          } else {
            final update = await (tranDb.update(tranDb.transactionsDB)
                  ..where(
                      (tbl) => tbl.count_ItemCode.equals(data.count_ItemCode))
                  ..where((tbl) =>
                      tbl.count_location_code.equals(data.count_location_code!))
                  ..where(
                      (tbl) => tbl.serial_number.equals(data.serial_number!)))
                .write(TransactionsDBCompanion(
                    count_location_code: Value(data.count_location_code),
                    count_location_name: Value(data.count_location_name),
                    serial_number: Value(data.serial_number),
                    count_QuantityScan: Value(data.count_QuantityScan),
                    status_item: Value(data.status_item),
                    rssi: Value(data.rssi),
                    updated_date: Value(DateTime.now())));
          }
          itemReturn = GridDataList(
              rfid_tag: data.count_ItemCode, status: "Found", rssi: data.rssi);
        }
      }
      if (!isValidateItemCode && isValidateLocation && isValidateSerialNumber) {
        //validate location, serial
        final queryMaster = await (tranDb.selectOnly(appDb.itemMasterDB)
              ..addColumns([appDb.itemMasterDB.SerialNumber])
              ..where(appDb.itemMasterDB.ItemCode.equals(data.count_ItemCode!)))
            .get();
        final queryLocation = await (tranDb.select(appDb.locationMasterDB)
              ..where(
                  (tbl) => tbl.location_code.equals(data.count_location_code!)))
            .get();
        if (queryMaster.isNotEmpty && queryLocation.isNotEmpty) {
          final dbSerialNumber =
              queryMaster.first.read(appDb.itemMasterDB.SerialNumber);
          if (dbSerialNumber == data.serial_number) {
            final checkDuplicate = await (tranDb.select(appDb.transactionsDB)
                  ..where((tbl) => tbl.count_location_code
                      .equals(data.count_location_code ?? ""))
                  ..where(
                      (tbl) => tbl.serial_number.equals(data.serial_number!))
                  ..where((tbl) =>
                      tbl.is_Validate_Location.equals(isValidateLocation))
                  ..where((tbl) => tbl.is_Validate_SerialNumber
                      .equals(isValidateSerialNumber)))
                .get();
            if (checkDuplicate.isEmpty) {
              final insert =
                  await tranDb.into(appDb.transactionsDB).insert(insertToDB);
            } else {
              final update = await (tranDb.update(tranDb.transactionsDB)
                    ..where((tbl) => tbl.count_location_code
                        .equals(data.count_location_code ?? ""))
                    ..where(
                        (tbl) => tbl.serial_number.equals(data.serial_number!)))
                  .write(TransactionsDBCompanion(
                      count_location_code: Value(data.count_location_code),
                      count_location_name: Value(data.count_location_name),
                      serial_number: Value(data.serial_number),
                      count_QuantityScan: Value(data.count_QuantityScan),
                      status_item: Value(data.status_item),
                      rssi: Value(data.rssi),
                      updated_date: Value(DateTime.now())));
            }
            itemReturn = GridDataList(
                rfid_tag: data.count_ItemCode,
                status: "Found",
                rssi: data.rssi);
          }
        }
      }
      if (isValidateItemCode && !isValidateLocation && isValidateSerialNumber) {
        //validate item, serial
        final queryMaster = await (tranDb.selectOnly(appDb.itemMasterDB)
              ..addColumns([appDb.itemMasterDB.ItemCode])
              ..where(appDb.itemMasterDB.ItemCode.equals(data.count_ItemCode))
              ..where(
                  appDb.itemMasterDB.SerialNumber.equals(data.serial_number!)))
            .get();
        if (queryMaster.isNotEmpty) {
          //do somethings
          final dbSerialNumber =
              queryMaster.first.read(appDb.itemMasterDB.SerialNumber);
          if (dbSerialNumber == data.serial_number) {
            final checkDuplicate = await (tranDb.select(appDb.transactionsDB)
                  ..where(
                      (tbl) => tbl.count_ItemCode.equals(data.count_ItemCode))
                  ..where(
                      (tbl) => tbl.serial_number.equals(data.serial_number!))
                  ..where((tbl) =>
                      tbl.is_Validate_ItemCode.equals(isValidateItemCode))
                  ..where((tbl) => tbl.is_Validate_SerialNumber
                      .equals(isValidateSerialNumber)))
                .get();
            if (checkDuplicate.isEmpty) {
              final insert =
                  await tranDb.into(appDb.transactionsDB).insert(insertToDB);
            } else {
              final update = await (tranDb.update(tranDb.transactionsDB)
                    ..where(
                        (tbl) => tbl.count_ItemCode.equals(data.count_ItemCode))
                    ..where(
                        (tbl) => tbl.serial_number.equals(data.serial_number!)))
                  .write(TransactionsDBCompanion(
                      count_location_code: Value(data.count_location_code),
                      count_location_name: Value(data.count_location_name),
                      serial_number: Value(data.serial_number),
                      count_QuantityScan: Value(data.count_QuantityScan),
                      status_item: Value(data.status_item),
                      rssi: Value(data.rssi),
                      updated_date: Value(DateTime.now())));
            }
            itemReturn = GridDataList(
                rfid_tag: data.count_ItemCode,
                status: "Found",
                rssi: data.rssi);
          }
        }
      }
      if (isValidateItemCode && isValidateLocation && !isValidateSerialNumber) {
        //validate item, location
        final queryMaster = await (tranDb.selectOnly(appDb.itemMasterDB)
              ..addColumns([appDb.itemMasterDB.ItemCode])
              ..where(appDb.itemMasterDB.ItemCode.equals(data.count_ItemCode)))
            .get();
        final queryLocation = await (tranDb.select(appDb.locationMasterDB)
              ..where(
                  (tbl) => tbl.location_code.equals(data.count_location_code!)))
            .get();
        if (queryMaster.isNotEmpty && queryLocation.isNotEmpty) {
          //do somethings

          final checkDuplicate = await (tranDb.select(appDb.transactionsDB)
                ..where((tbl) => tbl.count_ItemCode.equals(data.count_ItemCode))
                ..where((tbl) =>
                    tbl.count_location_code.equals(data.count_location_code!))
                ..where((tbl) =>
                    tbl.is_Validate_ItemCode.equals(isValidateItemCode))
                ..where((tbl) =>
                    tbl.is_Validate_Location.equals(isValidateLocation)))
              .get();
          if (checkDuplicate.isEmpty) {
            final insert =
                await tranDb.into(appDb.transactionsDB).insert(insertToDB);
          } else {
            final update = await (tranDb.update(tranDb.transactionsDB)
                  ..where(
                      (tbl) => tbl.count_ItemCode.equals(data.count_ItemCode))
                  ..where((tbl) => tbl.count_location_code
                      .equals(data.count_location_code!)))
                .write(TransactionsDBCompanion(
                    count_location_code: Value(data.count_location_code),
                    count_location_name: Value(data.count_location_name),
                    serial_number: Value(data.serial_number),
                    count_QuantityScan: Value(data.count_QuantityScan),
                    status_item: Value(data.status_item),
                    rssi: Value(data.rssi),
                    updated_date: Value(DateTime.now())));
          }
          itemReturn = GridDataList(
              rfid_tag: data.count_ItemCode, status: "Found", rssi: data.rssi);
        }
      }
      if (!isValidateItemCode &&
          !isValidateLocation &&
          isValidateSerialNumber) {
        //validate serial
        final queryMaster = await (tranDb.selectOnly(appDb.itemMasterDB)
              ..addColumns([appDb.itemMasterDB.SerialNumber])
              ..where(
                  appDb.itemMasterDB.SerialNumber.equals(data.serial_number!)))
            .get();
        if (queryMaster.isNotEmpty) {
          //do somethings

          final checkDuplicate = await (tranDb.select(appDb.transactionsDB)
                ..where((tbl) => tbl.serial_number.equals(data.serial_number!))
                ..where((tbl) => tbl.is_Validate_SerialNumber
                    .equals(isValidateSerialNumber)))
              .get();
          if (checkDuplicate.isEmpty) {
            final insert =
                await tranDb.into(appDb.transactionsDB).insert(insertToDB);
          } else {
            final update = await (tranDb.update(tranDb.transactionsDB)
                  ..where(
                      (tbl) => tbl.serial_number.equals(data.serial_number!))
                  ..where((tbl) => tbl.is_Validate_SerialNumber
                      .equals(isValidateSerialNumber)))
                .write(TransactionsDBCompanion(
                    count_location_code: Value(data.count_location_code),
                    count_location_name: Value(data.count_location_name),
                    serial_number: Value(data.serial_number),
                    count_QuantityScan: Value(data.count_QuantityScan),
                    status_item: Value(data.status_item),
                    rssi: Value(data.rssi),
                    updated_date: Value(DateTime.now())));
          }
          itemReturn = GridDataList(
              rfid_tag: data.count_ItemCode, status: "Found", rssi: data.rssi);
        }
      }
      if (!isValidateItemCode &&
          isValidateLocation &&
          !isValidateSerialNumber) {
        //validate location
        final queryLocation = await (tranDb.select(appDb.locationMasterDB)
              ..where(
                  (tbl) => tbl.location_code.equals(data.count_location_code!)))
            .get();
        if (queryLocation.isNotEmpty) {
          //do somethings

          final checkDuplicate = await (tranDb.select(appDb.transactionsDB)
                ..where((tbl) => tbl.count_location_code
                    .equals(data.count_location_code ?? ""))
                ..where((tbl) =>
                    tbl.is_Validate_Location.equals(isValidateLocation)))
              .get();
          if (checkDuplicate.isEmpty) {
            final insert =
                await tranDb.into(appDb.transactionsDB).insert(insertToDB);
          } else {
            final update = await (tranDb.update(tranDb.transactionsDB)
                  ..where((tbl) => tbl.count_location_code
                      .equals(data.count_location_code ?? ""))
                  ..where((tbl) =>
                      tbl.is_Validate_Location.equals(isValidateLocation)))
                .write(TransactionsDBCompanion(
                    count_location_code: Value(data.count_location_code),
                    count_location_name: Value(data.count_location_name),
                    serial_number: Value(data.serial_number),
                    count_QuantityScan: Value(data.count_QuantityScan),
                    status_item: Value(data.status_item),
                    rssi: Value(data.rssi),
                    updated_date: Value(DateTime.now())));
          }
          itemReturn = GridDataList(
              rfid_tag: data.count_ItemCode, status: "Found", rssi: data.rssi);
        }
      }
      if (isValidateItemCode &&
          !isValidateLocation &&
          !isValidateSerialNumber) {
        //validate item
        final queryMaster = await (tranDb.selectOnly(appDb.itemMasterDB)
              ..addColumns([appDb.itemMasterDB.ItemCode])
              ..where(appDb.itemMasterDB.ItemCode.equals(data.count_ItemCode)))
            .get();

        if (queryMaster.isNotEmpty) {
          //do somethings
          final checkDuplicate = await (tranDb.select(appDb.transactionsDB)
                ..where((tbl) => tbl.count_ItemCode.equals(data.count_ItemCode))
                ..where((tbl) =>
                    tbl.is_Validate_ItemCode.equals(isValidateItemCode)))
              .get();

          if (checkDuplicate.isEmpty) {
            final insert =
                await tranDb.into(appDb.transactionsDB).insert(insertToDB);
          } else {
            final update = await (tranDb.update(tranDb.transactionsDB)
                  ..where(
                      (tbl) => tbl.count_ItemCode.equals(data.count_ItemCode))
                  ..where((tbl) =>
                      tbl.is_Validate_ItemCode.equals(isValidateItemCode)))
                .write(TransactionsDBCompanion(
                    count_location_code: Value(data.count_location_code),
                    count_location_name: Value(data.count_location_name),
                    serial_number: Value(data.serial_number),
                    count_QuantityScan: Value(data.count_QuantityScan),
                    status_item: Value(data.status_item),
                    rssi: Value(data.rssi),
                    updated_date: Value(DateTime.now())));
          }
          itemReturn = GridDataList(
              rfid_tag: data.count_ItemCode, status: "Found", rssi: data.rssi);
        }
      }
      if (!isValidateItemCode &&
          !isValidateLocation &&
          !isValidateSerialNumber) {
        //ไม่ validate อะไรเลย
        //do somethings

        final checkDuplicate = await (tranDb.select(appDb.transactionsDB)
              ..where((tbl) => tbl.count_ItemCode.equals(data.count_ItemCode))
              ..where((tbl) => tbl.count_location_code
                  .equals(data.count_location_code ?? ""))
              ..where((tbl) =>
                  tbl.serial_number.equals(data.serial_number ?? "1234")))
            .get();
        if (checkDuplicate.isEmpty) {
          final insert =
              await tranDb.into(appDb.transactionsDB).insert(insertToDB);
        } else {
          final update = await (tranDb.update(tranDb.transactionsDB)
                ..where((tbl) => tbl.count_ItemCode.equals(data.count_ItemCode))
                ..where((tbl) => tbl.count_location_code
                    .equals(data.count_location_code ?? ""))
                ..where((tbl) =>
                    tbl.serial_number.equals(data.serial_number ?? "")))
              .write(TransactionsDBCompanion(
                  count_location_code: Value(data.count_location_code),
                  count_location_name: Value(data.count_location_name),
                  serial_number: Value(data.serial_number),
                  count_QuantityScan: Value(data.count_QuantityScan ?? 1),
                  status_item: Value(data.status_item),
                  rssi: Value(data.rssi),
                  itemDesc: Value(itemDesc.toString()),
                  updated_date: Value(DateTime.now())));
        }
        itemReturn = GridDataList(
            rfid_tag: data.count_ItemCode, status: "Found", rssi: data.rssi);
      }
      if (itemReturn.rfid_tag != null && itemReturn.rfid_tag!.isNotEmpty) {
        await SDK_Function.playSound();
      }

      return itemReturn;
    } catch (e, s) {
      print(e);
      print(s);
      return itemReturn;
    }
  }

  Future<List<dropdownModel>> getValidate() async {
    List<dropdownModel> list = [];
    try {
      final query = await tranDb.select(tranDb.appSettingDB)
        ..where((tbl) => tbl.is_active.equals(true));

      final result = await query.get();

      result.removeWhere((qry) => qry.name == 'Item Code');

      if (result.isNotEmpty) {
        final queryLocation =
            await (appDb.select(appDb.locationMasterDB, distinct: true)
                  ..addColumns([
                    appDb.locationMasterDB.location_code,
                    appDb.locationMasterDB.location_name
                  ]))
                .get();

        final uniqueLocationSet = <String>{};

        final uniqueLocation = queryLocation
            .where(
                (e) => e.location_code != null && e.location_code!.isNotEmpty)
            .where((e) =>
                uniqueLocationSet.add(e.location_code! + e.location_name!))
            .map((e) => ListDropdownModel(
                  location_code: e.location_code!,
                  location_name: e.location_name!,
                ))
            .toList();
        final querySerialNumber =
            await (appDb.select(appDb.itemMasterDB, distinct: true)
                  ..addColumns([appDb.itemMasterDB.SerialNumber]))
                .get();
        final uniqueSerialNumbers = querySerialNumber
            .where((e) => e.SerialNumber != null && e.SerialNumber!.isNotEmpty)
            .map((e) => e.SerialNumber!)
            .toSet() // ใช้ Set เพื่อกรองค่าที่ซ้ำกันออก
            .map((serial) => ListDropdownModel(
                  location_code: serial,
                  location_name: serial,
                ))
            .toList();
        list = result
            .map((e) => dropdownModel(
                  item_id: e.item_id,
                  name: e.name!,
                  valueDropdown: e.name == 'Location Code'
                      ? uniqueLocation
                      : uniqueSerialNumbers,
                  is_validate: e.is_validate,
                  is_active: e.is_active,
                ))
            .toList();
      }

      return list;
    } catch (e, s) {
      print(e);
      print(s);
      throw Exception();
    }
  }

  Future<String> getItemDesc(String itemCode) async {
    try {
      final query = await (tranDb.selectOnly(tranDb.itemMasterDB)
            ..addColumns([tranDb.itemMasterDB.ItemDescription])
            ..where(tranDb.itemMasterDB.ItemCode.equals(itemCode))
            ..limit(1))
          .get();

      if (query.isNotEmpty) {
        final itemDescription =
            query.first.read(tranDb.itemMasterDB.ItemDescription);
        print(itemDescription);
        return itemDescription!;
      } else {
        print("object");
        return "";
      }
    } catch (e, s) {
      throw Exception();
    }
  }

  Future<void> updateEdit(TransactionsDBData data) async {
    try {
      final update = await (tranDb.update(tranDb.transactionsDB)
            ..where((tbl) => tbl.key_id.equals(data.key_id)))
          .write(TransactionsDBCompanion(
              status_item: Value(data.status_item),
              updated_date: Value(DateTime.now())));
    } catch (e, s) {
      throw Exception();
    }
  }
}
