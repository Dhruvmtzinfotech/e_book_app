import 'dart:typed_data';
import 'package:e_book_app/api/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ProfileController extends GetxController {

  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  Uint8List? userImage = Uint8List(0);

  Api api = Api();



  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RxString profileUrl = ''.obs;


  void updateProfileUrl(String newUrl) {
    profileUrl.value = newUrl;
  }


  bool isNumeric(String? value) {
    if (value == null) {
      return false;
    }
    return double.tryParse(value) != null;
  }    // mobile


  String? nameValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    return null;
  }


  String? mobileValidation(String? value) {
    {
      if (value == null || value.isEmpty) {
        return 'Please enter a mobile number';
      } else if (value.length != 10 ||!isNumeric(value)) {
        return 'Please enter a valid 10-digit mobile number';
      }
      return null;
    }
  }


  String? emailValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    } else if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
        .hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }


  String? cityValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter City';
    }
    return null;
  }


  // getData() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   UserProfile userProfile = UserProfile(prefs);
  //
  //   String userName = userData.getUserName();
  //   String userEmail = userData.getUserEmail();
  //   String userPhoto = userData.getUserPhoto();
  //   String userCity = userData.getUserCity();
  //
  // }


  RxString name = "".obs;
  RxString photo = "".obs;
  RxString mobile = "".obs;
  RxString email = "".obs;
  RxString city = "".obs;


  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    name.value = prefs.getString("name") ?? "";
    photo.value = prefs.getString("photo") ?? "";
    mobile.value = prefs.getString("mobile") ?? "";
    email.value = prefs.getString("email") ?? "";
    city.value = prefs.getString("city") ?? "";
  }
  @override
  void onInit() {
  super.onInit();
  getData();
  }


}
