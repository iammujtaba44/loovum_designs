import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.success,
    this.data,
    this.token,
  });

  bool success;
  dynamic data;
  String token;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        success: json["success"],
        data: json["data"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data,
        "token": token,
      };
}
