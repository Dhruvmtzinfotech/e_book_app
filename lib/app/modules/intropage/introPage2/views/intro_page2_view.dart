import 'package:e_book_app/utils/assets.dart';
import 'package:flutter/material.dart';
import '../../../../../utils/responsive.dart';
import '../../../../../utils/strings.dart';

class IntroPage2View extends StatefulWidget {
  const IntroPage2View({super.key});

  @override
  State<IntroPage2View> createState() => _IntroPage2ViewState();
}

class _IntroPage2ViewState extends State<IntroPage2View> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: height_15,
                  ),
                  Image.asset(icIntroPage_2),
                  Text(intro_2_title,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: height_3),
                  Text(intro_2_body,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
