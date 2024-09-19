import 'package:countstock_rfid/database/appSettingDB.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:countstock_rfid/app.dart';
import 'package:countstock_rfid/database/database.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
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
  configLoading();
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..maskType = EasyLoadingMaskType.black
    ..dismissOnTap = false;
}
