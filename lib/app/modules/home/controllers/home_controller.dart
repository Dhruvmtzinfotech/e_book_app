import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {

  RxString name = "".obs;
  RxString photo = "".obs;

  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    name.value = prefs.getString("name") ?? "";
    photo.value = prefs.getString("photo") ?? "";
  }

  @override
  void onInit() {
    super.onInit();
    getData();
  }

}
