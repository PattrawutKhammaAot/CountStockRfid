import 'package:countstock_rfid/database/database.dart';
import 'package:countstock_rfid/main.dart';
import 'package:drift/drift.dart';

class SearchDB {
  Future<List<TransactionsDBData>> serachResult(
      String itemCode, offset, limit, filter) async {
    try {
      if (itemCode.isNotEmpty) {
        var result = await (appDb.select(appDb.transactionsDB)
              ..where((t) => t.count_ItemCode.contains(itemCode.toUpperCase())))
            .get();

        if (result.isNotEmpty) {
          return result;
        } else {
          return [];
        }
      } else {
        var result = await appDb.select(appDb.transactionsDB).get();
        if (result.isNotEmpty) {
          return result;
        } else {
          return [];
        }
      }
    } catch (e, s) {
      print("$e$s");
      return [];
    }
  }
  //Paing
  //  Future<List<TransactionsDBData>> serachResult(
  //     String itemCode, int offset, int limit, String filter) async {
  //   try {
  //     if (itemCode.isNotEmpty) {
  //       var result = await (appDb.select(appDb.transactionsDB)
  //             ..where((t) => t.count_ItemCode.contains(itemCode.toUpperCase()))
  //             ..limit(limit, offset: offset))
  //           .get();

  //       if (result.isNotEmpty) {
  //         return result;
  //       } else {
  //         return [];
  //       }
  //     } else {
  //       var result = await (appDb.select(appDb.transactionsDB)
  //             ..limit(limit, offset: offset))
  //           .get();
  //       if (result.isNotEmpty) {
  //         return result;
  //       } else {
  //         return [];
  //       }
  //     }
  //   } catch (e, s) {
  //     print("$e$s");
  //     return [];
  //   }
  // }

  Future<bool> deleteByID(int key_id) async {
    try {
      var result = await appDb.transaction(() async {
        await (appDb.delete(appDb.transactionsDB)
              ..where((tbl) => tbl.key_id.equals(key_id)))
            .go();
      });
      return true;
    } catch (e, s) {
      print("$e$s");
      return false;
    }
  }
}
