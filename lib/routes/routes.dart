import 'package:countstock_rfid/screens/homepage/homePage.dart';
import 'package:countstock_rfid/screens/import/import_location_screen.dart';
import 'package:countstock_rfid/screens/import/import_master_screen.dart';
import 'package:countstock_rfid/screens/scan/scanScreen.dart';
import 'package:countstock_rfid/screens/serach/editdetailScreen.dart';
import 'package:countstock_rfid/screens/serach/serachScreen.dart';
import 'package:countstock_rfid/screens/settings/setting_Screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String home = '/';
  static const String importMaster = '/importMaster';
  static const String importLocation = '/importLocation';
  static const String scan = '/scan';
  static const String settings = '/settings';
  static const String report = '/serach';
  static const String export = '/export';
  static const String editDetails = '/detail';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      home: (context) => HomePage(),
      importMaster: (context) => ImportMasterScreen(),
      importLocation: (context) => ImportLocationScreen(),
      scan: (context) => ScanScreen(),
      report: (context) => SearchScreen(),
      export: (context) => Container(),
      settings: (context) => SettingScreen(),
      editDetails: (context) => EditDetailScreen(),
    };
  }
}

class CustomRouteObserver extends RouteObserver<PageRoute<dynamic>> {
  static const String resetColor = '\x1B[0m';
  static const String redColor = '\x1B[31m';
  static const String greenColor = '\x1B[32m';
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    if (route is PageRoute) {
      print('${greenColor}Navigating to ${route.settings.name}$resetColor');
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    if (route is PageRoute) {
      print(
          '${redColor}Navigating back from ${route.settings.name}$resetColor');
    }
    if (previousRoute is PageRoute) {
      print(
          '${greenColor}Navigating back to ${previousRoute.settings.name}$resetColor');
    }
  }
}
