import 'package:shared_preferences/shared_preferences.dart';

class HelperMethods {
  static String userLoggedInKey = 'USERLOGGEDINKEY';

  static Future<bool> savedUserLoggedInDetails(bool isLoggedin) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool(userLoggedInKey, isLoggedin);
  }

  static Future<bool> getUserLoggedInDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(userLoggedInKey);
  }
}
