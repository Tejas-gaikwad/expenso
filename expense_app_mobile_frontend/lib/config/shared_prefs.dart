import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  static SharedPreferences? _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static SharedPreferences? get instance => _prefs;

  static Future<void> setStatus(String? loginStatus) async {
    print("Login status set to ---    $loginStatus");
    await _prefs?.setString('login_status', loginStatus ?? "");

    final stat =  _prefs?.getString('login_status') ;

    print("Login status is ---    $stat");
  }

  static String getStatus() {
    return _prefs?.getString('login_status') ?? '';
  }

}
