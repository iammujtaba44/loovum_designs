// To parse this JSON data, do
//
//     final sellerReviewModel = sellerReviewModelFromJson(jsonString);

import 'dart:convert';

SellerReviewModel sellerReviewModelFromJson(String str) =>
    SellerReviewModel.fromJson(json.decode(str));

String sellerReviewModelToJson(SellerReviewModel data) =>
    json.encode(data.toJson());

class SellerReviewModel {
  SellerReviewModel({
    this.rating,
    this.starCount,
    this.allRatings,
  });

  List<Rating> rating;
  int starCount;
  int allRatings;

  factory SellerReviewModel.fromJson(Map<String, dynamic> json) =>
      SellerReviewModel(
        rating:
            List<Rating>.from(json["rating"].map((x) => Rating.fromJson(x))),
        starCount: json["starCount"],
        allRatings: json["allRatings"],
      );

  Map<String, dynamic> toJson() => {
        "rating": List<dynamic>.from(rating.map((x) => x.toJson())),
        "starCount": starCount,
        "allRatings": allRatings,
      };
}

class Rating {
  Rating({
    this.id,
    this.stars,
    this.name,
    this.feedback,
    this.userId,
    this.productId,
    this.orderId,
    this.date,
    this.sellerId,
    this.productTitle,
    this.productImage,
    this.productSlug,
    this.createdAt,
    this.updatedAt,
    this.user,
  });

  int id;
  int stars;
  String name;
  String feedback;
  int userId;
  int productId;
  int orderId;
  DateTime date;
  int sellerId;
  String productTitle;
  String productImage;
  String productSlug;
  DateTime createdAt;
  DateTime updatedAt;
  User user;

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        id: json["id"],
        stars: json["stars"],
        name: json["name"],
        feedback: json["feedback"],
        userId: json["user_id"],
        productId: json["product_id"],
        orderId: json["order_id"],
        date: DateTime.parse(json["date"]),
        sellerId: json["seller_id"],
        productTitle: json["product_title"],
        productImage: json["product_image"],
        productSlug: json["product_slug"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "stars": stars,
        "name": name,
        "feedback": feedback,
        "user_id": userId,
        "product_id": productId,
        "order_id": orderId,
        "date": date.toIso8601String(),
        "seller_id": sellerId,
        "product_title": productTitle,
        "product_image": productImage,
        "product_slug": productSlug,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "user": user.toJson(),
      };
}

class User {
  User({
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
  Avatar avatar;
  dynamic phoneNumber;
  int userType;
  dynamic slug;
  int status;
  DateTime createdAt;
  DateTime updatedAt;
  List<dynamic> favouriteProducts;
  List<dynamic> favourites;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        avatar: avatarValues.map[json["avatar"]],
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
        "avatar": avatarValues.reverse[avatar],
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

enum Avatar { ADMIN_IMG_USER_PNG }

final avatarValues =
    EnumValues({"admin/img/user.png": Avatar.ADMIN_IMG_USER_PNG});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
