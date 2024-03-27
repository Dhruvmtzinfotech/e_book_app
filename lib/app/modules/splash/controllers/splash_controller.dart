import 'package:e_book_app/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {

  checkData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    dynamic isLoginValue = prefs.get('isLogin');

    if (prefs.containsKey("isLogin") && isLoginValue is bool) {
      bool isLogin = isLoginValue;

      if (isLogin) {
        Get.offAllNamed(Routes.HOME);
      }
      else
      {
        if (prefs.containsKey("isFirst")) {
          Get.offAllNamed(Routes.LOGIN);
        } else {
          Get.offAllNamed(Routes.ONBOARDING);
        }
      }
    }
  }
}
