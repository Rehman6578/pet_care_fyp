
import 'package:shared_preferences/shared_preferences.dart';

class commonFiles{


  // create methods for saving and getting string data from shared preferences

  static  Future<bool> saveStringData(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(key, value);
  }

  static Future<String?> getStringData(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }






}