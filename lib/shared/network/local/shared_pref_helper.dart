import 'package:shared_preferences/shared_preferences.dart';

abstract class SharedHelper {
  static SharedPreferences? sharedPreferences;

  static Future<SharedPreferences> init() async {
    return sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> setSharePref({required bool isDark}) async {
    return await sharedPreferences!.setBool('isDark', isDark);
  }

  static void getSharePref() {
    sharedPreferences!.getBool('isDark');
  }
}
