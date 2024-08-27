import 'dart:io';

import 'package:drift/drift.dart';

// These imports are used to open the database
import 'package:drift/native.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:countstock_rfid/database/itemMasterDB.dart';
import 'package:countstock_rfid/database/locationMasterDB.dart';
import 'package:countstock_rfid/database/transactionsDB.dart';

part 'database.g.dart';
// dart run build_runner build  // สำหรับการสร้าง database.g.dart

//    dart run build_runner watch   //
// @DriftDatabase(
//   // relative import for the drift file. Drift also supports `package:`
//   // imports
//   include: {'tables.drift'},
// )
// class AppDb extends _$AppDb {
//   AppDb() : super(_openConnection());
//
//   @override
//   int get schemaVersion => 1;
// }

// this annotation tells drift to prepare a database class that uses both of the
// tables we just defined. We'll see how to use that database class in a moment.
@DriftDatabase(
    tables: [ItemMasterDB, LocationMasterDB, TransactionsDB],
    views: [ViewItemMasterDB, ViewLocationMasterDB, ViewTransactionsDB])
class AppDb extends _$AppDb {
  // AppDb(super.e);

  // we tell the database where to store the data with this constructor
  AppDb() : super(_openConnection());

  // AppDb(QueryExecutor e): super(e);
  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {},
      beforeOpen: (details) async {
        // // your existing beforeOpen callback, enable foreign keys, etc.
        // if (kDebugMode) {
        //   // This check pulls in a fair amount of code that's not needed
        //   // anywhere else, so we recommend only doing it in debug builds.
        //   await validateDatabaseSchema();
        // }
      },
    );
  }

  //#region ************************** MASTER *******************************

//#endregion *********************************************************//
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));

    return NativeDatabase.createInBackground(file);
  });
}
