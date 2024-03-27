import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../controllers/rate_controller.dart';

class RateView extends StatefulWidget {
  const RateView({super.key});

  @override
  State<RateView> createState() => _RateViewState();
}

class _RateViewState extends State<RateView> {
  RateController rateCon = Get.put(RateController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("RateView"),),
      body: Column(
        children: [
          ElevatedButton(onPressed: (){
            rateCon.openAppStoreReview(context);

          }, child: Text("Rating My App")),

        ],
      ),

    );
  }
}
