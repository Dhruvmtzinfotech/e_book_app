import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class AppTheme{


  static ThemeData light = ThemeData(
      textTheme: TextTheme(

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
        borderSide: BorderSide(color: Colors.black, width: 2),
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
        borderSide: const BorderSide(color: Colors.black, width: 2),
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

  static InputDecoration customTextfield(String hintText,IconData iconData) {
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
       prefixIcon: Icon(iconData),
      hintStyle: TextStyle(color: Colors.grey),
    );
  }

  static StepProgressIndicator progressIndicator()
  {
    return StepProgressIndicator(
      totalSteps: 15,
      currentStep: 12,
      size: 20,
      selectedColor: Colors.amber,
      unselectedColor: Colors.black,
      roundedEdges: Radius.circular(10),
      gradientColor: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Colors.orange, Colors.white],
      ),
    );
  }

}