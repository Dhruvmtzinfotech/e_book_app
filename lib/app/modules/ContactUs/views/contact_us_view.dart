import 'package:e_book_app/utils/responsive.dart';
import 'package:e_book_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/contact_us_controller.dart';

class ContactUsView extends GetView<ContactUsController> {
  const ContactUsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ContactUsController contactUsCon = Get.put(ContactUsController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feedback'),
        centerTitle: true,
      ),
      body:Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.deepOrange.shade50,
                border: Border.all(color: Colors.black),
              ),
              width: MediaQuery.of(context).size.width ,
              height: height_20,
              child: TextFormField(
                controller: contactUsCon.contactController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Feedback',
                  contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                ),
              ),
            ),
          ),
          Button(btnText: "Submit", onClick: (){

          })
        ],
      )
    );
  }
}
