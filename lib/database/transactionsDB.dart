import 'dart:convert';

import 'package:countstock_rfid/main.dart';
import 'package:countstock_rfid/screens/settings/model/appsettingModel.dart';
import 'package:drift/drift.dart';
import 'package:countstock_rfid/database/database.dart';

import '../screens/scan/model/validateModel.dart';
import '../screens/scan/tableViewScan.dart';

class TransactionsDB extends Table {
  IntColumn get key_id => integer().autoIncrement()();
  IntColumn get item_id => integer().nullable()(); // not null
  TextColumn get count_ItemCode => text()(); //not null
  TextColumn get count_location_id => text().nullable()();
  TextColumn get count_location_code => text().nullable()();
  IntColumn get count_QuantityScan => integer().nullable()();
  TextColumn get serial_number => text().nullable()();
  TextColumn get status_item => text().nullable()();
  TextColumn get rssi => text().nullable()();
  DateTimeColumn get created_date => dateTime().nullable()();
  DateTimeColumn get updated_date => dateTime().nullable()();
}

abstract class ViewTransactionsDB extends View {
  TransactionsDB get transactionsDB;

  @override
  Query as() => select([
        transactionsDB.key_id,
        transactionsDB.item_id,
        transactionsDB.count_ItemCode,
        transactionsDB.count_location_id,
        transactionsDB.count_location_code,
        transactionsDB.count_QuantityScan,
        transactionsDB.status_item,
        transactionsDB.rssi,
        transactionsDB.created_date,
        transactionsDB.updated_date,
        transactionsDB.serial_number
      ]).from(transactionsDB);
}

class Transactions {
  final AppDb tranDb;
  bool isValidateLocation = false;
  bool isValidateItemCode = false;
  Transactions(this.tranDb);

  Future<List<GridDataList>> scanItem(TransactionsDBData data) async {
    List<GridDataList> itemReturn = [];
    try {
      final query = tranDb.select(tranDb.transactionsDB)
        ..where((tbl) => tbl.count_ItemCode.equals(data.count_ItemCode))
        ..where((tbl) => tbl.count_location_code.equals(data.count_ItemCode!));
      return itemReturn;
    } catch (e, s) {
      return itemReturn;
    }
  }

  Future<List<ValidateModel>> getValidate() async {
    List<ValidateModel> list = [];
    try {
      final query = await tranDb.select(tranDb.appSettingDB)
        ..where((tbl) => tbl.is_active.equals(true));

      final result = await query.get();

      result.removeWhere((qry) => qry.name == 'Item Code');

      if (result.isNotEmpty) {
        final queryLocation = await appDb.locationMasterDB.select().get();

        final querySerialNumber =
            await (appDb.select(appDb.itemMasterDB, distinct: true)
                  ..addColumns([appDb.itemMasterDB.SerialNumber]))
                .get();

        list = result
            .map((e) => ValidateModel(
                  item_id: e.item_id,
                  name: e.name!,
                  valueDropdown: e.name == 'Location Code'
                      ? queryLocation
                          .map((e) => ListDropdownModel(
                                location_code: e.location_code!,
                                location_name: e.location_name!,
                              ))
                          .toList()
                      : querySerialNumber
                          .where((e) =>
                              e.SerialNumber != null &&
                              e.SerialNumber!.isNotEmpty)
                          .map((e) => ListDropdownModel(
                                location_code: e.SerialNumber!,
                                location_name: e.SerialNumber!,
                              ))
                          .toList(),
                  is_validate: e.is_validate,
                  is_active: e.is_active,
                ))
            .toList();
      }

      return list;
    } catch (e, s) {
      throw Exception();
    }
  }
}
