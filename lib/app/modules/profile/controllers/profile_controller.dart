import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {

  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController cityController = TextEditingController();


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
  } // mobile


  String? nameValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    return null;
  }

  String? mobilValidation(String? value){
    if (value == null || value.isEmpty) {
      return 'Please enter a mobile number';
    } else if (value.length != 10 ||
        isNumeric(value)) {
      return 'Please enter a valid 10-digit mobile number';
    }
    return null;
  }


  String? emailValidation(String? value)
  {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    } else if (!RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
        .hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? cityValidation(String? value)
  {
    if (value == null || value.isEmpty) {
      return 'Please enter City';
    }
    return null;
  }







}
