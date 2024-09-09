import 'package:countstock_rfid/database/appSettingDB.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:countstock_rfid/app.dart';
import 'package:countstock_rfid/database/database.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:countstock_rfid/database/itemMasterDB.dart';
import 'package:countstock_rfid/database/locationMasterDB.dart';
import 'package:countstock_rfid/database/transactionsDB.dart';

enum ItemMasterStatus { Uncheck, Check }

late AppDb appDb;
late ItemMaster itemMasterDB;
late LocationMaster locationDB;
late Transactions transactionDB;
late AppSetting appSettingDB;
late AppLocalizations appLocalizations;
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  appDb = AppDb();
  itemMasterDB = ItemMaster(appDb);
  locationDB = LocationMaster(appDb);
  transactionDB = Transactions(appDb);
  appSettingDB = AppSetting(appDb);
  runApp(const App());
}
