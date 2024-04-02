
import 'package:e_book_app/app/modules/otp/controllers/otp_controller.dart';
import 'package:e_book_app/app/routes/app_pages.dart';
import 'package:e_book_app/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpView extends StatefulWidget {
  const OtpView({super.key});

  @override
  State<OtpView> createState() => _OtpViewState();
}
class _OtpViewState extends State<OtpView> {
  @override
  Widget build(BuildContext context) {
    OtpController otpCon = Get.put(OtpController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("OtpView"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(child: Image.asset("assets/img/phoneAuth.png")),
              const Text("A 4 digit code has been sent to example@gmail.com",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: TextFormField(
                    controller: otpCon.otpController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(20.0),
                        border: InputBorder.none,
                        hintText: 'Enter otp',
                        suffixIcon: Icon(Icons.phone_android)
                    ),
                    cursorColor: Colors.deepOrangeAccent.shade100
                ),
              ),
              const SizedBox(height: 30.0),

             Button(btnText: "Verify", onClick: () async{
               try {
                 PhoneAuthCredential credential = PhoneAuthProvider.credential(
                   verificationId: otpCon.verificationId,
                   smsCode: otpCon.otpController.text.toString(),
                 );
                 UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
                Get.offAllNamed(Routes.HOME);
               }
               catch (ex) {
                 if (kDebugMode) {
                   print('Verification failed: $ex');
                 }
               }
             })

            ],
          ),
        ),
      ),
    );
  }
}
