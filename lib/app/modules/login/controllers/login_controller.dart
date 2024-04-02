import 'dart:convert';
import 'package:e_book_app/api/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../model/UserProfile.dart';

class LoginController extends GetxController {

  // TextEditingController mobileController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  Api api = Api();

  bool isLogin = false;


  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();

  RxBool valueFirst = false.obs;

  saveUserDetail(userEmail, userName, userImage) async {
    UserProfile userProfile = UserProfile(
      email: userEmail ?? "",
      name: userName ?? "",
      mobileNumber: "",
      city: "",
      userProfileFileImg: "",
      userImage: userImage ?? "",
    );
    String jsonBody = json.encode(userProfile.toJson());
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString("userProfile", jsonBody);
  }

}
