import 'package:e_book_app/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/privacypolicy_controller.dart';

class PrivacyPolicyView extends GetView<PrivacypolicyController> {
  const PrivacyPolicyView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy Policy'),
        centerTitle: true,
      ),
      body:Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Privacy Policy",
              style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),),
            SizedBox(height: height_2,),
            Text("A mobile app privacy policy informs people about your "
                "data collection practices and discloses how your app gathers,"
                " stores, and uses personal information.",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),),
            SizedBox(height: height_2,),
            Text("1.Data Collcetion",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),),
            Text("Data collection is the process of gathering and"
                " measuring information on variables of interest",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),),
            SizedBox(height: height_2,),
            Text("2.Data Usage",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),),
            Text("Open your phone's Settings app. Internet. Next to your carrier, tap Settings ."
                " At the top you'll see how much total data you use.",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),),
            SizedBox(height: height_2,),
            Text("3.Data Sharing",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),),
            Text("Data sharing is the process of making the same data resources available to"
                " multiple applications, users, or organizations.",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),),
          ],
        ),
      )
    );
  }
}
