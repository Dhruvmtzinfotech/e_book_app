import 'package:e_book_app/app/modules/profile/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../app/modules/home/controllers/home_controller.dart';
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
void shareFiles() {
  final List<XFile> files = [XFile('path/to/your/file')];
  Share.shareXFiles(files, text: 'Check out this file!');
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
                            child: Image.asset("assets/img/phoneAuth.png", height: height_18),
                          ),
                        ),
                        Positioned(
                          bottom: 5,
                          right: 15,
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
                    Text("Dhruv Ghoghari",style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18.0,
                    ),),
                  ],
                ),
                Divider(
                  color: Colors.black,
                ),
                SizedBox(height: height_2),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text("Rate Us",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18.0,
                          ),
                        ),
                        Spacer(),
                        Image.asset("assets/img/back_arrow.png"),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: height_2,),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text("Contact With Us",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18.0,
                          ),
                        ),
                        Spacer(),
                        Image.asset("assets/img/back_arrow.png"),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: height_2,),
                GestureDetector(
                  onTap: () async{
                    // Share.share('Check out this awesome Flutter package!');
                    // Share.shareXFiles(files, text: 'See these documents', subject: 'Important Docs');


                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text("Share With Frinds",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18.0,
                            ),
                          ),
                          Spacer(),
                          Image.asset("assets/img/back_arrow.png"),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: height_2,),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text("Our More Apps",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18.0,
                          ),
                        ),
                        Spacer(),
                        Image.asset("assets/img/back_arrow.png"),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: height_2,),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text("FAQ",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18.0,
                          ),
                        ),
                        Spacer(),
                        Image.asset("assets/img/back_arrow.png"),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: height_2,),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text("Contact Us",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18.0,
                          ),
                        ),
                        Spacer(),
                        Image.asset("assets/img/back_arrow.png"),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: height_2,),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text("Privacy Policy",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18.0,
                          ),
                        ),
                        Spacer(),
                        Image.asset("assets/img/back_arrow.png"),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: height_2,),
                GestureDetector(
                  onTap: () async{
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    prefs.clear();

                    GoogleSignIn googleSignIn = GoogleSignIn();  // Google logout
                    googleSignIn.signOut();

                    Get.back();
                    Get.offAllNamed(Routes.LOGIN);

                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text("Log Out",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18.0,
                            ),
                          ),
                          Spacer(),
                          Image.asset("assets/img/back_arrow.png"),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
