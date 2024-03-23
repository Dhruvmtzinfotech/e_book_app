import 'package:e_book_app/app/modules/login/views/login_view.dart';
import 'package:e_book_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  _OnboardingViewState createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  Widget _buildImage(String assetsName, [double width = 500]) {
    return Image.asset('assets/img/$assetsName', width: width);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        // SizedBox(height: 130),
        // Image.asset("assets/img/onBoardingImg.jpg"),
        // Text("Only Books Can Help You ",
        //   style: TextStyle(
        //     fontSize: 25,
        //     fontWeight: FontWeight.bold,
        //   ),
        // ),
        // Padding(
        //   padding: const EdgeInsets.all(15.0),
        //   child: Text("Books can help you to increase your knowledge and become more successful,",
        //     textAlign: TextAlign.center,
        //     style: TextStyle(
        //       color: Colors.grey,
        //       fontSize: 20,
        //       fontWeight: FontWeight.bold,
        //     ),
        //   ),
        // ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: IntroductionScreen(
            pages: [
              PageViewModel(
                title: "Only Books Can Help You ",
                body: "Books can help you to increase your knowledge and become more successful,",
                image: _buildImage('onBoardingImg.jpg'),
              ),
              PageViewModel(
                title: "Learn on your Time Schedule",
                body: "Learn a lot of new skills with our interesting lesson by our courses and solve tasks",
                image: _buildImage('onBoardingImg.jpg'),
              ),
              PageViewModel(
                title: "Welcome to Ebook App",
                body: "We have true friend in our life and the books is that.Book has power to change yourself and make you more valuable ",
                image: _buildImage('welcomeImg.jpg'),
              ),
            ],
            showSkipButton: true,
            skip:  Text("Skip"),
            next:  Text("Next",style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20
            ),),
            done:  Text("Done",style: TextStyle(
            fontWeight: FontWeight.bold,
                fontSize: 20
            ),),
            onDone: ()  async{
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.setBool("isFirst", true);
              Get.offAllNamed(Routes.LOGIN);
            },
            onSkip: ()
            async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.setBool("isFirst", true);
              Get.offAllNamed(Routes.LOGIN);
            },
            baseBtnStyle: TextButton.styleFrom(
              backgroundColor: Colors.deepOrangeAccent,
            ),
            doneStyle: TextButton.styleFrom(foregroundColor: Colors.white),
            nextStyle: TextButton.styleFrom(foregroundColor: Colors.white),
          ),
        ),
      ),
    );
  }
}