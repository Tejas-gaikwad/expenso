import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  static SharedPreferences? _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static SharedPreferences? get instance => _prefs;

  static Future<void> setStatus(String? loginStatus) async {
    await _prefs?.setString('login_status', loginStatus ?? "");
  }

  static String getStatus() {
    return _prefs?.getString('login_status') ?? '';
  }

  static Future<void> setUserId(String? uid) async {
    print("user_uid set to ---    $uid");
    await _prefs?.setString('user_uid', uid ?? "");

    final stat =  _prefs?.getString('user_uid') ;

    print("user_uid  is ---    $stat");
  }

  static String getUserId() {
    return _prefs?.getString('user_uid') ?? '';
  }

}
