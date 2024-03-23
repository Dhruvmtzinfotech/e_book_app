import 'package:e_book_app/app/modules/login/controllers/login_controller.dart';
import 'package:e_book_app/app/modules/otp/views/otp_view.dart';
import 'package:e_book_app/app/routes/app_pages.dart';
import 'package:e_book_app/widgets/button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginView extends StatefulWidget {

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  LoginController loginCon = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.deepOrange.shade100,
      body: SingleChildScrollView(
        child: SafeArea(
          child:Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Welcome Back!",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30
                ),),
                Text("Login in to continue",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  color: Colors.grey
                ),),
                Center(child: Image.asset("assets/img/phoneAuth.png")),
                SizedBox(height: 30,),
                Form(
                  key: loginCon.loginKey,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: TextFormField(
                            controller: loginCon.phoneController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(20.0),
                              border: InputBorder.none,
                              hintText: 'Enter Mobile Number',
                              suffixIcon: Icon(Icons.phone_android)
                            ),
                            cursorColor: Colors.deepOrangeAccent.shade100
                        ),
                      ),
                      Row(
                        children: [
                           Checkbox(
                               value: loginCon.valueFirst.value,
                              activeColor: Colors.deepOrangeAccent,
                              onChanged:(Value){
                                setState(() {
                                  loginCon.valueFirst.value = Value!;
                                });
                              }),
                          Text("Remember Me",style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                            fontSize: 18
                          ),),
                          SizedBox(width: 40),
                          Text("Forgot Password?",style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                              fontSize: 18
                          ),),
                        ],
                      ),
                      SizedBox(height: 15),
                      Button(btnText: "Login", onClick: () async{
                        await FirebaseAuth.instance.verifyPhoneNumber(verificationCompleted: (PhoneAuthCredential credential) {},
                            verificationFailed: (FirebaseAuthException ex) {},
                            codeSent: (String verificationId, int? resendToken) {

                           Get.to(() => OtpView(),arguments: verificationId);
                            },
                            codeAutoRetrievalTimeout: (String verificationId) {},
                            phoneNumber: loginCon.phoneController.text.toString());
        
                      }),
                      Text("Or Continue with ",style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey
                      ),),
                      GestureDetector(onTap: () async{

                        final GoogleSignIn googleSignIn = GoogleSignIn();
                        final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
                        if (googleSignInAccount != null) {
                          final GoogleSignInAuthentication googleSignInAuthentication =
                          await googleSignInAccount.authentication;
                          final AuthCredential authCredential = GoogleAuthProvider.credential(
                              idToken: googleSignInAuthentication.idToken,
                              accessToken: googleSignInAuthentication.accessToken);

                          UserCredential result = await auth.signInWithCredential(authCredential);
                          User user = result!.user!;

                          var name = user.displayName.toString();
                          var email = user.email.toString();
                          var photo = user.photoURL.toString();
                          var googleId = user.uid.toString();

                          SharedPreferences prefs = await SharedPreferences.getInstance();
                          prefs.setString("name", name);
                          prefs.setString("isLogin", "yes");
                          prefs.setString("email", email);
                          prefs.setString("photo", photo);
                          prefs.setString("googleId", googleId);

                         Get.offAllNamed(Routes.HOME);
                         Get.back();
                        }
                      },
                        child: Container(
                          width:MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Image.asset("assets/img/Google.jpg"),
                              ),
                              Text("Continue with Google",style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              )),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
