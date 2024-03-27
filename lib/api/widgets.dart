import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../app/modules/profile/controllers/profile_controller.dart';
import '../utils/responsive.dart';


final ImagePicker picker = ImagePicker();
ProfileController profileCon = Get.put(ProfileController());



Future? bottomSheet() {
  return Get.bottomSheet(
    Container(
      width: width_100,
      height: height_25,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromRGBO(158, 0, 255, 0.70),
            Color.fromRGBO(31, 12, 43, 0.35),
          ],
          stops: [0.0, 1.0],
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: width_50,
              height: height_8,
              child: ElevatedButton(onPressed: () async{

                final XFile? image = await picker.pickImage(source: ImageSource.camera);
                if (image != null)
                {
                  profileCon.updateProfileUrl(image.path);
                }

              },  style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
              ),child: Text("Camera",style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white
                  ),)),
            ),
            SizedBox(height: height_2),
            Container(
              width: width_50,
              height: height_8,
              child: ElevatedButton(onPressed: (){


              },  style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
              ),child: Text("Galary",style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white
              ),)),
            ),
          ],
        ),
      ),
    ),
  );
}
