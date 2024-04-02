import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:e_book_app/api/widgets.dart';
import 'package:e_book_app/utils/Constants.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/helper.dart';

class Api{
  Dio dio = Dio(BaseOptions(
    baseUrl:Constants.baseUrl,
    contentType: 'application/json'
  ));

  Future? header() async {
    String? token;
    await Helper.getUserToken().then((value) {
      token = value;
    });
    if (kDebugMode) {
      print(token);
    }
    return dio.options.headers["Authorization"] = "Bearer $token";
  }

  Future? userLogin({String? mobile}) async {
    Map <String, dynamic> map = {'mobile':mobile};
    String body = jsonEncode(map);
    try{

      var header = {'Authorization': 'Bearer${Constants.token}'
      };
      var response = await dio.post('login',data: body,options: Options(headers: header));
      if(response.statusCode == 200 || response.statusCode == 201){
        print(response.data);
        if(response.data['data'] != null){

          var name = response.data['data']['name'];
          var mobile = response.data['data']['mobile'];
          var email = response.data['data']['email'];
          var city = response.data['data']['city'];
         //var token = response.data['data']['token'];

          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('name', name);
          prefs.setString('mobile', mobile);
          prefs.setString('email', email);
          prefs.setString('city', city);
          //prefs.setString('token', token);
          return response.data;
        }
      }
    }
    on DioException catch(ex){
      return apiDialog(
          ex.response!.data['message'] ?? "please try again later"
      );
    }
  }

  Future? verifyOtp({String? mobile,int? otp}) async {
    Map<String,dynamic> map = {'mobile':mobile,'otp':otp};
    String body = json.encode(map);
    try{
      var header = {
        "Content-type": "application/json",
        "Accept": "application/json"
      };
      var response = await dio.post('verify_otp',data: body,options: Options(headers: header));
      if(response.statusCode == 200 || response.statusCode == 201){
        return response.data;
      }
    }
    on DioException catch(ex){
      return apiDialog(
        ex.response!.data['message'] ?? "please try again later"
      );
    }
  }

  Future? updateProfile(
      {final String? mobile,
        final String? name,
        final String? email,
        final String? city,
        dynamic image,
        final String? id,
        String? uid,
      }) async {
    try{
      var formData = FormData.fromMap({
        "mobile": mobile,
        "name": name,
        "email": email,
        "city": city,
      });
      formData.files.addAll([MapEntry(
          "image", MultipartFile.fromBytes(image!, filename: 'comImage.jpg')),
      ]);
      var header = {'Authorization': 'Bearer${Constants.token}'};
      var response = await dio.post("profile/update$uid",data:formData,options: Options(headers: header));
      if(response.statusCode == 200 || response.statusCode == 201)
      {
        if(kDebugMode){
          print("update userProfile response ${response.data}");
        }
        return response.data;
      }
    }
    on DioException catch(ex){
      return apiDialog(ex.response!.data['message']);
    }
  }

}