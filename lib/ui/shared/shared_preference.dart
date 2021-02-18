import 'package:shared_preferences/shared_preferences.dart';

class UserPreference {
  static SharedPreferences pref;

  static String isFirstTime = "isFirstTime";
  static String isUserLogin = "isUserLogin";
  static String email = "email";
  static String fullName = "fullName";
  static String attempts = "attempts";

  static Future<SharedPreferences> getPrefObject() async {
    pref = await SharedPreferences.getInstance();
    return pref;
  }

  static Future<void> updatePreferenceValue(String key, String value) async {
    pref = await getPrefObject();
    pref.setString(key, value);
    return;
  }

  ///set Email
  static Future<void> setUserEmail(String userEmail) async {
    pref = await getPrefObject();
    pref.setString(email, userEmail);
  }
/// get Email
  static Future<String> getUserEmail() async {
    pref = await getPrefObject();
    return pref.getString(email);
  }

  ///set Email
  static Future<void> setUserAttampts(int userEmail) async {
    pref = await getPrefObject();
    pref.setInt(attempts, userEmail);
  }
  /// get Email
  static Future<int> getUserAttampts() async {
    pref = await getPrefObject();
    return pref.getInt(attempts);
  }
  ///set fullName
  static Future<void> setUserFullName(String userFullName) async {
    pref = await getPrefObject();
    pref.setString(fullName, userFullName);
  }
  /// get fullName
  static Future<String> getUserFullName() async {
    pref = await getPrefObject();
    return pref.getString(fullName);
  }

  ///set Login
  static Future<bool> setUserLogin(bool isLogin) async {
    pref = await getPrefObject();
    // await getPrefObject();
    pref.setBool(isUserLogin, isLogin);
    return true;
  }

  ///get Login

  static Future<bool> getUserLogin() async {
    pref = await getPrefObject();
    // await getPrefObject();
    return pref.getBool(isUserLogin);
  }

  ///set user first time install App or not
  static Future<bool> setUserFirstTime(bool isUserLogin) async {
    pref = await getPrefObject();
    pref.setBool(isFirstTime, isUserLogin);
    return true;
  }

  ///get user first time install App or not

  static Future<bool> getUserFirstTime() async {
    pref = await getPrefObject();
    return pref.getBool(isFirstTime);
  }
}
