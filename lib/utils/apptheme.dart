import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppTheme{
  static ThemeData light = ThemeData(
      scaffoldBackgroundColor: const Color(0xffF0FBF5),
      textTheme: const TextTheme(
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
      contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(color: Colors.grey[400]!, width: 1.0),
      ),
       prefixIcon: Icon(iconData),
      hintStyle: const TextStyle(color: Colors.grey),
    );
  }

  static Container customSliderContainer(String img)
  {
    return Container(
      child: Image.asset(img),
    );
  }


  static GestureDetector customDrawerField({required VoidCallback onTap,required String text,required String img,})
  {
    return GestureDetector(
      onTap:onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(text,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18.0,
                ),
              ),
              const Spacer(),
              Image.asset(img),
            ],
          ),
        ),
      ),
    );
  }
}