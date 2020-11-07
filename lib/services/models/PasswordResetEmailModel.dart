import 'dart:convert';

PasswordResetEmailModel passwordResetEmailModelFromJson(String str) =>
    PasswordResetEmailModel.fromJson(json.decode(str));

String passwordResetEmailModelToJson(PasswordResetEmailModel data) =>
    json.encode(data.toJson());

class PasswordResetEmailModel {
  PasswordResetEmailModel({
    this.success,
  });

  String success;

  factory PasswordResetEmailModel.fromJson(Map<String, dynamic> json) =>
      PasswordResetEmailModel(
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
      };
}
