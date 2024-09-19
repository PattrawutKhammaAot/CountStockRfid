import 'package:shared_preferences/shared_preferences.dart';

class AppData {
  static setLocale(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // await storage.write(key: "ApiUrl", value: value);
    await prefs.setString("Locale", value);
  }

  static Future<dynamic> getLocale() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // String? value = await storage.read(key: "ApiUrl");
    // return value;
    return prefs.getString("Locale");
  }

  static setPower(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // await storage.write(key: "ApiUrl", value: value);
    await prefs.setString("powerR", value);
  }

  static Future<dynamic> getPower() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // String? value = await storage.read(key: "ApiUrl");
    // return value;
    return prefs.getString("powerR");
  }

  static setPopupInfo(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // await storage.write(key: "ApiUrl", value: value);
    await prefs.setString("popupInfo", value);
  }

  static Future<dynamic> getPopupInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // String? value = await storage.read(key: "ApiUrl");
    // return value;
    return prefs.getString("popupInfo");
  }

  static setUsername(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // await storage.write(key: "ApiUrl", value: value);
    await prefs.setString("username", value);
  }

  static Future<dynamic> getUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // String? value = await storage.read(key: "ApiUrl");
    // return value;
    return prefs.getString("username");
  }

  static Future<dynamic> clearUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove("username");
  }

  Future<void> saveCounter(int counter) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('import_counter', counter);
  }

  Future<int> loadCounter() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('import_counter') ?? 1; // Default value if not set
  }
}
