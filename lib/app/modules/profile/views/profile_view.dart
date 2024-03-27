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
                        child: Icon(Icons.upload),
                      ),
                    ),
                  ],
                ),
              ),
              Text("Dhruv Ghoghari",style: TextStyle(
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
                      decoration: AppTheme.customTextfield("Name"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: height_2),
                    TextFormField(
                      controller: profileCon.mobileController,
                      keyboardType: TextInputType.number,
                      decoration: AppTheme.customTextfield("Mobile No"),
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
                    SizedBox(height: height_2),
                    TextFormField(
                      controller: profileCon.emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: AppTheme.customTextfield("Email"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        } else if (!RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                            .hasMatch(value)) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: height_2),
                    TextFormField(
                      controller: profileCon.cityController,
                      keyboardType: TextInputType.text,
                      decoration: AppTheme.customTextfield("City"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter City';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: height_2),
                    Button(btnText: "Update", onClick: (){
                      if (profileCon.formKey.currentState?.validate() ?? false)
                        {
                          var name = profileCon.nameController.text;
                          var mobile = profileCon.mobileController.text;
                          var email = profileCon.emailController.text;
                          var city = profileCon.cityController.text;
        
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
