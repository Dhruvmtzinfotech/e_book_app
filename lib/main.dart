import 'package:e_book_app/utils/helpers.dart';
import 'package:e_book_app/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app/routes/app_pages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await SharedPrefs().init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    initializeSharedPreferences();
  }

  Future<void> initializeSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<void> updateUserData(String name,String mobile,String email,String city) async {
     prefs.setString('name', name);
     prefs.setString('mobile', mobile);
     prefs.setString('email', email);
     prefs.setString('city', city);


  }

  String getUserName()  {
    return prefs.getString('name') ?? 'name';
  }

  String getUserEmail() {
    return prefs.getString('email') ?? 'email';
  }

  String getUserPhoto() {
    return prefs.getString('photo') ?? 'photo';
  }

  String getUserCity(){
    return prefs.getString('city') ?? 'city';
  }

  Future<void> clearUserData() async {
    await prefs.clear();
  }



  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: GestureDetector(
        onTap: (){
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: GetMaterialApp(
          // home: Scaffold(
          //   body: Text("Hi ${SharedPrefs().username}"),
          // ),
          debugShowCheckedModeBanner: false,
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
        ),
      ),
    );
  }
}
