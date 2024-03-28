import 'package:e_book_app/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {

  checkData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    bool isLogin = prefs.getBool('isLogin') ?? false;

    bool isFirst = prefs.getBool('isFirst') ?? false;

    if (isLogin) {
      Get.offAllNamed(Routes.HOME);
    } else if (isFirst) {
      Get.offAllNamed(Routes.LOGIN);
    } else {
      Get.offAllNamed(Routes.ONBOARDING);
    }
  }
}
