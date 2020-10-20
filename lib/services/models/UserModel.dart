import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.success,
    this.data,
  });

  bool success;
  Data data;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        success: json["success"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.avatar,
    this.phoneNumber,
    this.userType,
    this.slug,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.favouriteProducts,
    this.favourites,
  });

  int id;
  String name;
  String email;
  dynamic emailVerifiedAt;
  String avatar;
  String phoneNumber;
  int userType;
  dynamic slug;
  int status;
  DateTime createdAt;
  DateTime updatedAt;
  List<dynamic> favouriteProducts;
  List<dynamic> favourites;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        avatar: json["avatar"],
        phoneNumber: json["phone_number"],
        userType: json["user_type"],
        slug: json["slug"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        favouriteProducts:
            List<dynamic>.from(json["favourite_products"].map((x) => x)),
        favourites: List<dynamic>.from(json["favourites"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "avatar": avatar,
        "phone_number": phoneNumber,
        "user_type": userType,
        "slug": slug,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "favourite_products":
            List<dynamic>.from(favouriteProducts.map((x) => x)),
        "favourites": List<dynamic>.from(favourites.map((x) => x)),
      };
}
