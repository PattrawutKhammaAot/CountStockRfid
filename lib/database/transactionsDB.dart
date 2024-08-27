import 'package:countstock_rfid/main.dart';
import 'package:drift/drift.dart';
import 'package:countstock_rfid/database/database.dart';

class TransactionsDB extends Table {
  IntColumn get key_id => integer().autoIncrement()();
  IntColumn get item_id => integer()(); // not null
  TextColumn get ItemCode => text()(); //not null
  TextColumn get location_id => text().nullable()();
  TextColumn get location_code => text().nullable()();
  RealColumn get qty => real().nullable()();
  TextColumn get status => text().nullable()();
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
        transactionsDB.ItemCode,
        transactionsDB.location_id,
        transactionsDB.location_code,
        transactionsDB.qty,
        transactionsDB.status,
        transactionsDB.rssi,
        transactionsDB.created_date,
        transactionsDB.updated_date,
      ]).from(transactionsDB);
}

class Transactions {
  final AppDb tranDb;
  bool isValidateLocation = false;
  bool isValidateItemCode = false;
  Transactions(this.tranDb);

  Future<bool> scanItem(TransactionsDBData data) async {
    try {
      if (isValidateLocation && isValidateItemCode) {
        final query = tranDb.select(tranDb.transactionsDB)
          ..where((tbl) => tbl.ItemCode.equals(data.ItemCode))
          ..where((tbl) => tbl.location_code.equals(data.location_code!));
      } else if (isValidateItemCode == false) {
        return false;
      }
    } catch (e, s) {
      print("$e$s");
      return false;
    }
  }

  Future<List<TransactionsDBData>> searchMaster(String s) async {
    if (s.isEmpty) {
      return (tranDb.select(tranDb.transactionsDB)).get();
    } else {
      return (tranDb.select(tranDb.transactionsDB)
            ..where((tbl) => tbl.ItemCode.like('%$s%')))
          .get();
    }
  }

  Future<List<TransactionsDBData>> search(String s) async {
    if (s.isEmpty) {
      return (tranDb.select(tranDb.transactionsDB)).get();
    } else {
      return (tranDb.select(tranDb.transactionsDB)
            ..where((tbl) => tbl.ItemCode.like('%$s%')))
          .get();
    }
  }

  Future<int> totalFilter(String s) async {
    print(s);
    try {
      return (tranDb.select(tranDb.transactionsDB)
            ..where((tbl) => tbl.status.equals(s)))
          .get()
          .then((value) => value.length);
    } catch (e, s) {
      print("$e$s");
      throw Exception();
    }
  }
}
