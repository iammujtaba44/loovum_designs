// To parse this JSON data, do
//
//     final changeAccountPasswordModel = changeAccountPasswordModelFromJson(jsonString);

import 'dart:convert';

ChangeAccountPasswordModel changeAccountPasswordModelFromJson(String str) =>
    ChangeAccountPasswordModel.fromJson(json.decode(str));

String changeAccountPasswordModelToJson(ChangeAccountPasswordModel data) =>
    json.encode(data.toJson());

class ChangeAccountPasswordModel {
  ChangeAccountPasswordModel({
    this.message,
    this.errors,
  });

  String message;
  Errors errors;

  factory ChangeAccountPasswordModel.fromJson(Map<String, dynamic> json) =>
      ChangeAccountPasswordModel(
        message: json["message"],
        errors: Errors.fromJson(json["errors"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "errors": errors.toJson(),
      };
}

class Errors {
  Errors({
    this.currentPassword,
  });

  List<String> currentPassword;

  factory Errors.fromJson(Map<String, dynamic> json) => Errors(
        currentPassword:
            List<String>.from(json["current_password"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "current_password": List<dynamic>.from(currentPassword.map((x) => x)),
      };
}
