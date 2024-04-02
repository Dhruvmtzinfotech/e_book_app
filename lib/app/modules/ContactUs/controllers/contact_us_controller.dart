import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ContactUsController extends GetxController {

TextEditingController contactController = TextEditingController();

  final count = 0.obs;



  void increment() => count.value++;
}
