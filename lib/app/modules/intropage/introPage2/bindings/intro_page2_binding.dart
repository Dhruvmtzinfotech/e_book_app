import 'package:get/get.dart';

import '../controllers/intro_page2_controller.dart';

class IntroPage2Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IntroPage2Controller>(
      () => IntroPage2Controller(),
    );
  }
}
