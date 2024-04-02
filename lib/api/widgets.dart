import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../app/modules/profile/controllers/profile_controller.dart';
import '../utils/responsive.dart';


final ImagePicker picker = ImagePicker();
ProfileController profileCon = Get.put(ProfileController());

Future? apiDialog(String msg) {
  return Get.dialog(
    barrierDismissible:false,
    CupertinoAlertDialog(
      title: Text(msg),
      actions: [
        CupertinoActionSheetAction(
          child: Text('Ok'),
          onPressed: () {
            Get.back();
          },
        ),
      ],
    ),
  );
}



Future? bottomSheet() {
  return Get.bottomSheet(
    Container(
      width: width_100,
      height: height_25,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromRGBO(158, 0, 255, 0.70),
            Color.fromRGBO(31, 12, 43, 0.35),
          ],
          stops: [0.0, 1.0],
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
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
              ),child: const Text("Camera",style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white
                  ),)),
            ),
            SizedBox(height: height_2),
            SizedBox(
              width: width_50,
              height: height_8,
              child: ElevatedButton(onPressed: () async{

                final XFile? photo = await picker.pickImage(source: ImageSource.gallery);
                if(photo != null){
                  profileCon.updateProfileUrl(photo.path);
                }

              },  style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
              ),child: const Text("Galary",
                style: TextStyle(
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
