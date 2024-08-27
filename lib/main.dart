import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:countstock_rfid/app.dart';
import 'package:countstock_rfid/database/database.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:countstock_rfid/database/itemMasterDB.dart';
import 'package:countstock_rfid/database/locationMasterDB.dart';
import 'package:countstock_rfid/database/transactionsDB.dart';

late AppDb appDb;
late ItemMaster itemMasterDB;
late LocationMaster locationDB;
late Transactions transDB;
late AppLocalizations appLocalizations;
void main() {
  appDb = AppDb();
  itemMasterDB = ItemMaster(appDb);
  locationDB = LocationMaster(appDb);
  transDB = Transactions(appDb);
  runApp(const App());
  WidgetsFlutterBinding.ensureInitialized();
}
