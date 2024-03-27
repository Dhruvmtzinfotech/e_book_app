import 'package:e_book_app/app/modules/login/controllers/login_controller.dart';
import 'package:e_book_app/app/modules/otp/views/otp_view.dart';
import 'package:e_book_app/app/routes/app_pages.dart';
import 'package:e_book_app/utils/responsive.dart';
import 'package:e_book_app/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../function.dart';
import '../../profile/controllers/profile_controller.dart';

class LoginView extends StatefulWidget {

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  ProfileController profileCon = Get.put(ProfileController());

  LoginController loginCon = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: SafeArea(
          child:Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                SizedBox(height: height_8),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: Colors.black,
                            width: 0.5
                        )
                    ),
                    child: ClipOval(
                      child: Image.asset("assets/img/phoneAuth.png",
                        height: height_20,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: height_5),
                Center(
                  child: Text("Login with Mobile",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),),
                ),
                SizedBox(height: height_2,),
                Form(
                  key: loginCon.loginKey,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: TextFormField(
                          controller: loginCon.phoneController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(20.0),
                              border: InputBorder.none,
                              hintText: 'Enter Mobile Number',
                            prefixIcon: Padding(padding: EdgeInsets.all(15), child: Text('+91')),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a mobile number';
                            } else if (value.length != 10 ||
                                profileCon.isNumeric(value)) {
                              return 'Please enter a valid 10-digit mobile number';
                            }
                            return null;
                          },
                        ),
                      ),
                      // Row(
                      //   children: [
                      //     Checkbox(
                      //         value: loginCon.valueFirst.value,
                      //         activeColor: Colors.deepOrangeAccent,
                      //         onChanged:(Value){
                      //           setState(() {
                      //             loginCon.valueFirst.value = Value!;
                      //           });
                      //         }),
                      //     Text("Remember Me",style: TextStyle(
                      //         color: Colors.grey,
                      //         fontWeight: FontWeight.w500,
                      //         fontSize: 15
                      //     ),),
                      //     SizedBox(width: width_20),
                      //     Text("Forgot Password?",style: TextStyle(
                      //         color: Colors.grey,
                      //         fontWeight: FontWeight.w500,
                      //         fontSize: 15
                      //     ),),
                      //   ],
                      // ),
                      SizedBox(height: height_3),
                      Button(btnText: "Login", onClick: () async{
                        // if(loginCon.loginKey.currentState?.validate() ?? false) {
                        //     var mobile = profileCon.mobileController.text;
                        //   }
                        // else {
                        //
                        //   }
                        await FirebaseAuth.instance.verifyPhoneNumber(verificationCompleted: (PhoneAuthCredential credential) {},
                            verificationFailed: (FirebaseAuthException ex) {},
                            codeSent: (String verificationId, int? resendToken) {

                              Get.to(() => OtpView(),arguments: verificationId);
                            },
                            codeAutoRetrievalTimeout: (String verificationId) {},
                            phoneNumber: loginCon.phoneController.text.toString());

                      }),
                      SizedBox(height: height_1),
                      Row(children: <Widget>[
                        Expanded(
                          child: new Container(
                              margin: EdgeInsets.only(left: 10.0, right: 20.0),
                              child: Divider(
                                color: Colors.black,
                                height: 36,
                              )),
                        ),
                        Text("OR"),
                        Expanded(
                          child: Container(
                              margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                              child: Divider(
                                color: Colors.black,
                                height: 36,
                              )),
                        ),
                      ]),
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
                          User user = result.user!;

                          var name = user.displayName.toString();
                          var email = user.email.toString();
                          var photo = user.photoURL.toString();
                          var googleId = user.uid.toString();

                          SharedPreferences prefs = await SharedPreferences.getInstance();
                          prefs.setString("name", name);
                         // prefs.setString("isLogin", "true");
                          prefs.setBool('isLogin', true);
                          prefs.setString("email", email);
                          prefs.setString("photo", photo);
                          prefs.setString("googleId", googleId);

                          Get.offAllNamed(Routes.HOME);
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
                      SizedBox(height: height_3),
                      GestureDetector(onTap: () async{
                        signInWithFacebook();
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
                                child: Image.asset("assets/img/Facebook.jpg"),
                              ),
                              Text("Continue with Facebook",style: TextStyle(
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
