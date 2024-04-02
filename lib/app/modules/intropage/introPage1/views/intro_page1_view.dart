import 'package:e_book_app/utils/assets.dart';
import 'package:e_book_app/utils/responsive.dart';
import 'package:e_book_app/utils/strings.dart';
import 'package:flutter/material.dart';

class IntroPage1View extends StatefulWidget {
  const IntroPage1View({super.key});

  @override
  State<IntroPage1View> createState() => _IntroPage1ViewState();
}

class _IntroPage1ViewState extends State<IntroPage1View> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: height_15,),
              Image.asset(icIntroPage_1),
              const Text(intro_1_title,
                style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold
              ),),
              SizedBox(height: height_3),
              const Text(intro_1_body,textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
              ),),
            ],
          ),
        ),
      ),
    );
  }
}
