import 'package:shared_preferences/shared_preferences.dart';

abstract class CashHelper {
  static SharedPreferences? sharedPreferences;

  static Future<SharedPreferences> init() async {
    return sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> setSharePref({required bool isDark}) async {
    return await sharedPreferences!.setBool('isDark', isDark);
  }

  static bool? getSharePref() {
    return sharedPreferences!.getBool('isDark');
  }
}
