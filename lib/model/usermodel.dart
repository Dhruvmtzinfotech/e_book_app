// import 'dart:convert';
//
// LoginUserModel userModelFromJson(String str) => LoginUserModel.fromJson(json.decode(str));
// String userModelToJson(LoginUserModel data) => json.encode(data.toJson());
//
// class LoginUserModel {
//   int? isSuccess;
//   String? code;
//   Data? data;
//   String? message;
//
//   LoginUserModel({
//     this.isSuccess,
//     this.code,
//     this.data,
//     this.message,
//   });
//
//   factory LoginUserModel.fromJson(Map<String, dynamic> json) => LoginUserModel(
//     isSuccess: json["isSuccess"],
//     code: json["code"],
//     data: json["data"] == null ? null : Data.fromJson(json["data"]),
//     message: json["message"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "isSuccess": isSuccess,
//     "code": code,
//     "data": data?.toJson(),
//     "message": message,
//   };
// }
//
// class Data {
//   int? id;
//   dynamic name;
//   dynamic email;
//   String? mobile;
//   dynamic username;
//   dynamic city;
//   int? isAdmin;
//   dynamic emailVerifiedAt;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   dynamic googleId;
//   dynamic fbId;
//   dynamic image;
//   String? otp;
//
//   Data({
//     this.id,
//     this.name,
//     this.email,
//     this.mobile,
//     this.username,
//     this.city,
//     this.isAdmin,
//     this.emailVerifiedAt,
//     this.createdAt,
//     this.updatedAt,
//     this.googleId,
//     this.fbId,
//     this.image,
//     this.otp,
//   });
//
//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//     id: json["id"],
//     name: json["name"],
//     email: json["email"],
//     mobile: json["mobile"],
//     username: json["username"],
//     city: json["city"],
//     isAdmin: json["is_admin"],
//     emailVerifiedAt: json["email_verified_at"],
//     createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
//     updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
//     googleId: json["google_id"],
//     fbId: json["fb_id"],
//     image: json["image"],
//     otp: json["otp"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "name": name,
//     "email": email,
//     "mobile": mobile,
//     "username": username,
//     "city": city,
//     "is_admin": isAdmin,
//     "email_verified_at": emailVerifiedAt,
//     "created_at": createdAt?.toIso8601String(),
//     "updated_at": updatedAt?.toIso8601String(),
//     "google_id": googleId,
//     "fb_id": fbId,
//     "image": image,
//     "otp": otp,
//   };
// }
