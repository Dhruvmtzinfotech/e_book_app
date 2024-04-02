import 'package:e_book_app/app/modules/onboarding/controllers/onboarding_controller.dart';
import 'package:e_book_app/app/routes/app_pages.dart';
import 'package:e_book_app/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../intropage/introPage1/views/intro_page1_view.dart';
import '../../intropage/introPage2/views/intro_page2_view.dart';
import '../../intropage/introPage3/views/intro_page3_view.dart';


class OnboardingView extends StatefulWidget {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  @override
  Widget build(BuildContext context) {
    OnboardingController onboardingCon = Get.put(OnboardingController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          TextButton(
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.setBool("isFirst", true);
              Get.offAllNamed(Routes.LOGIN);
            },
            child: const Text("Skip",
              style: TextStyle(color: Colors.black),
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: Stack(
        children: [
          PageView(
            controller: onboardingCon.controller,
            onPageChanged: (index) {
              setState(() {
                onboardingCon.onLastPage.value = (index == 2);
              });
            },
            children: const [
              IntroPage1View(),
              IntroPage2View(),
              IntroPage3View(),
            ],
          ),
          Container(
            alignment: const Alignment(0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SmoothPageIndicator(
                  controller: onboardingCon.controller,
                  count: 3,
                  effect: const ExpandingDotsEffect(
                    activeDotColor: Colors.orange,
                  ),
                ),
                onboardingCon.onLastPage.value
                    ? SizedBox(
                  width: width_40,
                      child: ElevatedButton(
                          onPressed: () async {
                            SharedPreferences prefs = await SharedPreferences.getInstance();
                            prefs.setBool("isFirst", true);
                            Get.offAllNamed(Routes.LOGIN);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepOrange,
                          ),
                          child: const Text("Done", style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontSize:20
                            ),
                          ),
                        ),
                    )
                    : SizedBox(
                  width: width_40,
                      child: ElevatedButton(
                          onPressed: () {
                            onboardingCon.controller.nextPage(
                              duration: const Duration(microseconds: 500),
                              curve: Curves.easeIn,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepOrange,
                          ),
                          child: const Text("Next",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                    )
              ],
            ),
          )
        ],
      ),
    );
  }
}
