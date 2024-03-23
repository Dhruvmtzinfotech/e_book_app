import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {

  TextEditingController mobileController = TextEditingController();
  TextEditingController phoneController = TextEditingController();


  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();

  RxBool valueFirst = false.obs;



}
