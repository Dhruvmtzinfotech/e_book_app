import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_book_app/app/modules/faq/views/faq_view.dart';
import 'package:e_book_app/app/modules/privacypolicy/views/privacypolicy_view.dart';
import 'package:e_book_app/app/modules/profile/views/profile_view.dart';
import 'package:e_book_app/app/modules/rate/views/rate_view.dart';
import 'package:e_book_app/utils/apptheme.dart';
import 'package:e_book_app/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../app/modules/ContactUs/views/contact_us_view.dart';
import '../app/modules/home/controllers/home_controller.dart';
import '../app/modules/home/views/home_view.dart';
import '../app/routes/app_pages.dart';
import '../utils/responsive.dart';
import 'package:share_plus/share_plus.dart';

/*Login Button*/
class Button extends StatelessWidget {
  final String btnText;
  final GestureTapCallback onClick;

  const Button({super.key,required this.btnText,required this.onClick,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Column(
        children: [
          Container(
            padding:  EdgeInsets.symmetric(vertical: 15.0,horizontal: 156.0),
            decoration: BoxDecoration(
              color:  Colors.deepOrangeAccent,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(btnText,style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


/* Drawer*/
final ImagePicker picker = ImagePicker();

String msg="https://play.google.com/store/apps/details?id=com.example.com.example.e_book_app";

ShareText(){
  Share.share(msg);
}

Shareimage() async{
  final XFile? image = await picker.pickImage(source: ImageSource.gallery);
  if(image == null) {
    return;
  }
  Share.shareXFiles([image]);
}

HomeController homeCon = Get.put(HomeController());
class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(height: height_3),
                Row(
                  children: [
                    Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.grey,
                            ),
                          ),
                          child: ClipOval(
                              child:CachedNetworkImage(
                                imageUrl: homeCon.photo.value,fit: BoxFit.cover,
                                placeholder: (context, url) => CircularProgressIndicator(),
                                errorWidget: (context, url, error) => Icon(Icons.error),
                              ),
                            //: Image.asset("assets/img/phoneAuth.png", height: height_18),
                          ),
                        ),
                        Positioned(
                          bottom: 5,
                          right: 10,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.grey,
                              ),
                            ),
                            child: GestureDetector(
                                onTap: (){
                                  Get.to(() => ProfileView());
                                },
                                child: Icon(Icons.edit)),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(homeCon.name.value,style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18.0,
                    ),),
                  ],
                ),
                Divider(
                  color: Colors.black,
                ),
                SizedBox(height: height_2),
                AppTheme.customDrawerField(
                    onTap:(){
                      scaffoldKey.currentState!.openEndDrawer();
                      Get.to(() => RateView());
                    },
                    text: "Rate Us",
                    img: icBackArrow
                ),
                SizedBox(height: height_2),
                AppTheme.customDrawerField(
                    onTap:(){},
                    text: "Contact with Us",
                    img: icBackArrow
                ),
                SizedBox(height: height_2),
                AppTheme.customDrawerField(
                    onTap: () async{
                      scaffoldKey.currentState!.openEndDrawer();
                      ShareText();
                    },
                    text: "Share With Friends",
                    img:icBackArrow
                ),
                SizedBox(height: height_2),
                AppTheme.customDrawerField(
                    onTap: (){},
                    text: "Our More Apps",
                    img:icBackArrow
                ),
                SizedBox(height: height_2),
                AppTheme.customDrawerField(
                    onTap: (){
                      scaffoldKey.currentState!.openEndDrawer();
                      Get.to(() => FaqView());
                    },
                    text: "FAQ",
                    img:icBackArrow
                ),
                SizedBox(height: height_2),
                AppTheme.customDrawerField(
                    onTap: (){
                      scaffoldKey.currentState!.openEndDrawer();
                      Get.to(() => ContactUsView());
                    },
                    text: "Contact Us",
                    img:icBackArrow
                ),
                SizedBox(height: height_2),
                AppTheme.customDrawerField(
                    onTap: (){
                      scaffoldKey.currentState!.openEndDrawer();
                      Get.to(() => PrivacyPolicyView());
                    },
                    text: "Privacy policy",
                    img:icBackArrow
                ),
                SizedBox(height: height_2),
                AppTheme.customDrawerField(
                    onTap: () async{
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      prefs.clear();

                      GoogleSignIn googleSignIn = GoogleSignIn();  // Google logout
                      googleSignIn.signOut();

                      Get.offAllNamed(Routes.LOGIN);
                    },
                    text: "Log Out",
                    img: icBackArrow
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}