import 'package:e_book_app/app/modules/login/controllers/login_controller.dart';
import 'package:e_book_app/app/routes/app_pages.dart';
import 'package:e_book_app/utils/responsive.dart';
import 'package:e_book_app/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../utils/function.dart';
import '../../../../utils/assets.dart';
import '../../profile/controllers/profile_controller.dart';

class LoginView extends StatefulWidget {
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool _isLoading = false;

  final FirebaseAuth auth = FirebaseAuth.instance;
  ProfileController profileCon = Get.put(ProfileController());
  LoginController loginCon = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                SizedBox(height: height_8),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black, width: 0.5)),
                    child: ClipOval(
                      child: Image.asset(icLoginTitle,height: height_20),
                    ),
                  ),
                ),
                SizedBox(height: height_5),
                Center(
                  child: Text("Login with Mobile",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(height: height_2),
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
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(20.0),
                              border: InputBorder.none,
                              hintText: 'Enter Mobile Number',
                              prefixIcon: Padding(
                                  padding: EdgeInsets.all(15),
                                  child: Text('+91')),
                            ),
                            validator: profileCon.mobileValidation
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
                      // _isLoading
                      //     ? AppTheme.progressIndicator()
                      //     :
                      Button(
                          btnText: "Login",
                          onClick: () async {
                            signInWithPhone();
                          }),
                      SizedBox(height: height_1),
                      Row(children: [
                        Expanded(
                          child: Container(
                              margin: EdgeInsets.only(left: 10.0, right: 20.0),
                              child: Divider(
                                color: Colors.black,
                                height: 36,
                              )),
                        ),
                        Text("OR"),
                        Expanded(
                          child: Container(
                              margin: EdgeInsets.only(left: 20.0, right: 10.0),
                              child: Divider(
                                color: Colors.black,
                                height: 36,
                              )),
                        ),
                      ]),
                      GestureDetector(
                        onTap: () async {
                          setState(() {
                            _isLoading = true;
                          });

                          final GoogleSignIn googleSignIn = GoogleSignIn();
                          try {
                            final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
                            if (googleSignInAccount != null) {
                              final GoogleSignInAuthentication
                                  googleSignInAuthentication =
                                  await googleSignInAccount.authentication;
                              final AuthCredential authCredential =
                                  GoogleAuthProvider.credential(idToken: googleSignInAuthentication.idToken,
                                accessToken: googleSignInAuthentication.accessToken,
                              );

                              UserCredential result = await FirebaseAuth.instance.signInWithCredential(authCredential);
                              User user = result.user!;

                              var name = user.displayName.toString();
                              var email = user.email.toString();
                              var photo = user.photoURL.toString();

                              SharedPreferences prefs = await SharedPreferences.getInstance();
                              prefs.setBool('isLogin', true);
                              prefs.setString('name', name);
                              prefs.setString('email', email);
                              prefs.setString('photo', photo);

                              //loginCon.saveUserDetail(name, email, photo);

                              Get.offAllNamed(Routes.HOME);
                            }
                          } catch (error) {
                            print("Error signing in with Google: $error");
                          } finally {
                            setState(() {
                              _isLoading = false;
                            });
                          }
                        },
                        child: _isLoading
                            ? Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                                child: Center(
                                  child: LoadingAnimationWidget.staggeredDotsWave(
                                    color: Colors.white,
                                    size: 60,
                                  ),
                                ),
                              )
                            : Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Image.asset(icGoogleAuth),
                                    ),
                                    Text("Continue with Google",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                      ),
                      SizedBox(height: height_3),
                      GestureDetector(
                        onTap: () async {
                          signInWithFacebook();
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Image.asset(icFaceBookAuth),
                              ),
                              Text("Continue with Facebook",
                                  style: TextStyle(
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
