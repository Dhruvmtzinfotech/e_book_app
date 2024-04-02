import 'package:shared_preferences/shared_preferences.dart';

class Helper
{
  static SharedPreferences? preferences;

  static String userToken = 'token';



  // get bearer token
  static Future<String?> getUserToken() async {
    preferences = await SharedPreferences.getInstance();
    return preferences!.getString(userToken);
  }


}