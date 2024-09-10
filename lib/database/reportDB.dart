import 'package:countstock_rfid/main.dart';
import 'package:drift/drift.dart';

class ReportDB {
  Future<int> getLocationMaster() async {
    try {
      // สร้าง query ที่นับจำนวนแถวทั้งหมดในตาราง masterRfid
      var query = appDb.selectOnly(appDb.locationMasterDB)
        ..addColumns([
          appDb.locationMasterDB.location_id.count()
        ]); // ใช้ id หรือคอลัมน์อื่นๆ ในตารางเพื่อนับ
      var result = await query.getSingle();
      return result.read(appDb.locationMasterDB.location_id.count()) ?? 0;
    } catch (e, s) {
      return 0;
    }
  }

  Future<int> getItemMaster() async {
    try {
      var query = appDb.selectOnly(appDb.itemMasterDB)
        ..addColumns([appDb.itemMasterDB.item_id.count()]);
      var result = await query.getSingle();
      return result.read(appDb.itemMasterDB.item_id.count()) ?? 0;
    } catch (e, s) {
      return 0;
    }
  }

  Future<int> getItemScanned() async {
    try {
      var query = appDb.selectOnly(appDb.transactionsDB)
        ..addColumns([appDb.transactionsDB.item_id.count()]);
      var result = await query.getSingle();
      return result.read(appDb.transactionsDB.item_id.count()) ?? 0;
    } catch (e, s) {
      print(e);
      print(s);
      return 0;
    }
  }

  Future<int> getItemNotScan() async {
    try {
      var getItemTransaction = await appDb.select(appDb.transactionsDB).get();
      var getItemMaster = await appDb.select(appDb.itemMasterDB).get();
      var itemTransaction = getItemTransaction.map((e) => e.item_id).toList();
      var itemMaster = getItemMaster.map((e) => e.item_id).toList();
      var result = itemMaster.length -
          itemTransaction.length; // นับจำนวน item ที่ยังไม่ได้ scan
      print(result);
      if (result < 0) {
        return 0;
      }
      return result;
    } catch (e, s) {
      print(e);
      print(s);
      return 0;
    }
  }
}
