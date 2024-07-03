import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  static SharedPreferences? _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static SharedPreferences? get instance => _prefs;

  // save token
  static Future<void> saveLoginStatus(String? token) async {
    await _prefs?.setString('login_status', token ?? "");
  }

  static String getLoginStatus() {
    return _prefs?.getString('login_status') ?? '';
  }

  // save token
  static Future<void> saveToken(String? token) async {
    await _prefs?.setString('mKey', token ?? "");
  }

  static String getToken() {
    return _prefs?.getString('mKey') ?? '';
  }

  static Future<void> saveGOBPCode(String? token) async {
    await _prefs?.setString('gobpCode', token ?? "");
  }

  static String getGOBPCode() {
    return _prefs?.getString('gobpCode') ?? '';
  }
}
