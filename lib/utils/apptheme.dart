import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';

class AppTheme{



  static const loginBtnColor = Colors.black;
  static const border = Colors.grey;
  static const canvas = Color(0xffF0FBF5);


  static ThemeData light = ThemeData(
      textTheme: TextTheme(
        displaySmall: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: 15,
        ),
      )
  );


  static InputDecoration customDecoration(String hintText,IconData prefixIcon) {
    return InputDecoration(
      hintText: hintText,
      prefixIcon: GestureDetector(
        // onTap: () {
        //   iconColor = Colors.deepPurple;
        // },
        child: Icon(prefixIcon),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 16.0),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        gapPadding: 10,
        borderSide: BorderSide(color: border, width: 2),
      ),
      disabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        gapPadding: 10,
        borderSide: BorderSide(color: Colors.grey, width: 2),
      ),
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        gapPadding: 10,
        borderSide: BorderSide(color: Colors.grey, width: 2),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: const BorderSide(color: loginBtnColor, width: 2),
      ),
      hintStyle: const TextStyle(color: Colors.grey),
    );
  }

  static getSnackBar({String? message}) {
    Get.showSnackbar(GetSnackBar(
      message: message,
      duration: const Duration(seconds: 2),
      snackPosition: SnackPosition.BOTTOM,
      borderRadius: 45.0,
    ));
  }

  static InputDecoration customTextfield(String hintText) {
    return InputDecoration(
      hintText: hintText,
      filled: true,
      fillColor: Colors.grey[200],
      contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(color: Colors.grey[400]!, width: 1.0),
      ),
      // prefixIcon: Icon(prefixicon.iconData),
      hintStyle: TextStyle(color: Colors.grey),
    );
  }

}