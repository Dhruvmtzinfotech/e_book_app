import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));
String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String? name;
  String? mobile;
  String? email;
  String? city;

  UserModel({
    this.name,
    this.mobile,
    this.email,
    this.city,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    name: json["name"],
    mobile: json["mobile"],
    email: json["email"],
    city: json["city"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "mobile": mobile,
    "email": email,
    "city": city,
  };
}
