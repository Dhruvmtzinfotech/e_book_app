// import 'package:shared_preferences/shared_preferences.dart';
//
// class SharedPrefs {
//
//   late final SharedPreferences _sharedPrefs;
//   Future<void> init() async {
//     _sharedPrefs = await SharedPreferences.getInstance();
//   }
//
//   String get username => _sharedPrefs.getString(keyUsername) ?? "";
//
//   set username(String value) {
//     _sharedPrefs.setString(keyUsername, value);
//   }
//   final sharedPrefs = SharedPrefs();
//    String keyUsername = "key_username";
//
//   factory SharedPrefs() => _instance;
//   SharedPrefs._internal();
//
// }
// final sharedPrefs = SharedPrefs();
//
