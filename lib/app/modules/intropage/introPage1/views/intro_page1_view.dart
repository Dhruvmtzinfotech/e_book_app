import 'package:e_book_app/utils/responsive.dart';
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
              Image.asset("assets/img/onBoardingImg.jpg"),
              Text("Only Books Can Help You" ,style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold
              ),),
              SizedBox(height: height_3),
              Text("Books can help you to increase your knowledge and become more successful,",textAlign: TextAlign.center,style: TextStyle(
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
