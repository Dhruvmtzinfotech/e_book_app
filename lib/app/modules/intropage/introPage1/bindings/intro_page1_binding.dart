import 'package:get/get.dart';

import '../controllers/intro_page1_controller.dart';

class IntroPage1Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IntroPage1Controller>(
      () => IntroPage1Controller(),
    );
  }
}
