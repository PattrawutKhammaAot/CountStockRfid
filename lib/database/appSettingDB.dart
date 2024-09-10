import 'package:countstock_rfid/database/database.dart';
import 'package:countstock_rfid/main.dart';
import 'package:drift/drift.dart';

import '../config/appData.dart';
import '../screens/settings/model/appsettingModel.dart';

class AppSettingDB extends Table {
  IntColumn get item_id => integer().autoIncrement()();
  TextColumn get name => text().nullable()();
  BoolColumn get is_validate => boolean()();
  BoolColumn get is_active => boolean()();
}

abstract class ViewAppSettingDB extends View {
  AppSettingDB get appsettingDB;

  @override
  Query as() => select([
        appsettingDB.item_id,
        appsettingDB.name,
        appsettingDB.is_validate,
        appsettingDB.is_active,
      ]).from(appsettingDB);
}

class AppSetting {
  AppDb appDb;

  AppSetting(this.appDb) {
    initValue();
  }

  Future initValue() async {
    final checkDb = await appDb.select(appDb.appSettingDB).get();
    if (checkDb.isEmpty) {
      List<String> listApp = ['Location Code', 'Item Code', 'Serial Number'];
      for (var item in listApp) {
        await appDb.into(appDb.appSettingDB).insert(AppSettingDBCompanion(
              name: Value(item),
              is_validate: Value(false),
              is_active:
                  item.contains('Item Code') ? Value(true) : Value(false),
            ));
      }
    }
  }

  Future<List<AppsettingModel>> getList() async {
    final query = appDb.select(appDb.appSettingDB);
    final result = await query.get();
    return result
        .map((e) => AppsettingModel(
              item_id: e.item_id,
              name: e.name!,
              is_validate: e.is_validate,
              is_active: e.is_active,
            ))
        .toList();
  }

  Future<List<AppsettingModel>> getValidate() async {
    final query = appDb.select(appDb.appSettingDB)
      ..where((tbl) => tbl.is_validate.equals(true));
    final result = await query.get();
    return result
        .map((e) => AppsettingModel(
              item_id: e.item_id,
              name: e.name!,
              is_validate: e.is_validate,
              is_active: e.is_active,
            ))
        .toList();
  }

  Future<void> update(AppsettingModel data) async {
    await appDb.update(appDb.appSettingDB).replace(AppSettingDBData(
          item_id: data.item_id,
          name: data.name,
          is_validate: data.is_active ? data.is_validate : false,
          is_active: data.is_active,
        ));
  }

  Future<void> deleteAll() async {
    await appDb.delete(appDb.transactionsDB).go();
    await appDb.delete(appDb.itemMasterDB).go();
    await appDb.delete(appDb.locationMasterDB).go();
    await AppData.clearUsername();
  }
}
