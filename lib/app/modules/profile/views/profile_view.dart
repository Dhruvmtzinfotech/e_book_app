import 'package:e_book_app/api/widgets.dart';
import 'package:e_book_app/app/modules/home/controllers/home_controller.dart';
import 'package:e_book_app/app/modules/profile/controllers/profile_controller.dart';
import 'package:e_book_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/apptheme.dart';
import '../../../../utils/responsive.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  ProfileController profileCon = Get.put(ProfileController());
  HomeController homeCon = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      centerTitle: true,
        title: Text("EditProfile"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Center(
                child: Stack(
                  //profileCon.profileUrl.value,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.grey,
                        ),
                      ),
                      child: ClipOval(
                        child:Image.network(homeCon.photo.value)
                      ),
                    ),
                    // : Container(
                    //     decoration: BoxDecoration(
                    //         shape: BoxShape.circle,
                    //         border: Border.all(
                    //           color: Colors.grey,
                    //         ),
                    //         image: DecorationImage(image: FileImage(File(profileCon.profileUrl.value)),fit: BoxFit.cover))),
                    Positioned(
                      bottom: 1,
                      right: 8,
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
                            bottomSheet();
                          },
                            child: Icon(Icons.upload)),
                      ),
                    ),
                  ],
                ),
              ),
              Text(homeCon.name.value,style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18.0,
              ),),
              Form(
                key: profileCon.formKey,
                child: Column(
                  children: [
                    SizedBox(height: height_5),
                    TextFormField(
                      controller: profileCon.nameController,
                      keyboardType: TextInputType.text,
                      decoration: AppTheme.customTextfield("Name",Icons.person),
                      validator: profileCon.nameValidation
                    ),
                    SizedBox(height: height_3),
                    TextFormField(
                      controller: profileCon.mobileController,
                      keyboardType: TextInputType.number,
                      decoration: AppTheme.customTextfield("Mobile No",Icons.phone_android),
                      validator: profileCon.mobileValidation,
                    ),
                    SizedBox(height: height_3),
                    TextFormField(
                      controller: profileCon.emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: AppTheme.customTextfield("Email",Icons.email_outlined),
                      validator: profileCon.emailValidation
                    ),
                    SizedBox(height: height_3),
                    TextFormField(
                      controller: profileCon.cityController,
                      keyboardType: TextInputType.text,
                      decoration: AppTheme.customTextfield("City",Icons.location_city),
                      validator: profileCon.cityValidation
                    ),
                    SizedBox(height: height_5),
                    Button(btnText: "Update", onClick: (){
                      if (profileCon.formKey.currentState?.validate() ?? false) {
                      }
                      else {

                      }
        
                    })
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
