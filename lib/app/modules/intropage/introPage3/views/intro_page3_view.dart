import 'package:flutter/material.dart';

import '../../../../../utils/assets.dart';
import '../../../../../utils/responsive.dart';
import '../../../../../utils/strings.dart';

class IntroPage3View extends StatefulWidget {
  const IntroPage3View({super.key});

  @override
  State<IntroPage3View> createState() => _IntroPage3ViewState();
}

class _IntroPage3ViewState extends State<IntroPage3View> {
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
                  SizedBox(height: height_15),
                  Image.asset(icIntroPage_3),
                  const Text(
                    intro_3_title,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: height_3),
                  const Text(
                    intro_3_body,
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
