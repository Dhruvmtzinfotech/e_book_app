import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../model/usermodel.dart';

class HomeController extends GetxController {

  int currentPosition = 0; // DotsIndicator



  // Future getUserDetail() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? userProfileJson = await prefs.getString("userProfile");
  //   if (userProfileJson != null) {
  //     UserProfile storedUserProfile =
  //     UserProfile.fromJson(json.decode(userProfileJson));
  //     name.value = storedUserProfile.userImage;
  //     photo.value = storedUserProfile.userProfileFileImg;
  //   }
  // }

  RxString name = "".obs;
  RxString photo = "".obs;

  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    name.value = prefs.getString("name") ?? "";
    photo.value = prefs.getString("photo") ?? "";
  }

  @override
  void onInit() {
    super.onInit();
    getData();
  }

}
