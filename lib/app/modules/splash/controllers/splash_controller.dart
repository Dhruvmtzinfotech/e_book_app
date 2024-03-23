import 'package:e_book_app/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {

  checkData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey("IsLogin")) {
     Get.offAllNamed(Routes.HOME);
    }
    else
    {
      if(prefs.containsKey("isFirst"))
      {
       Get.offAllNamed(Routes.LOGIN);
      }
      else
      {
        Get.offAllNamed(Routes.ONBOARDING);
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
    checkData();
  }


}
