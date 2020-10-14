import 'dart:convert';

RegisterModel registerModelFromJson(String str) =>
    RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
  RegisterModel({
    this.success,
    this.data,
    this.token,
  });

  bool success;
  Data data;
  String token;

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        success: json["success"],
        data: Data.fromJson(json["data"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
        "token": token,
      };
}

class Data {
  Data({
    this.name,
    this.email,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  String name;
  String email;
  DateTime updatedAt;
  DateTime createdAt;
  int id;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        name: json["name"],
        email: json["email"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
      };
}
