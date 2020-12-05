// To parse this JSON data, do
//
//     final productLikeModel = productLikeModelFromJson(jsonString);

import 'dart:convert';

ProductLikeModel productLikeModelFromJson(String str) =>
    ProductLikeModel.fromJson(json.decode(str));

String productLikeModelToJson(ProductLikeModel data) =>
    json.encode(data.toJson());

class ProductLikeModel {
  ProductLikeModel({
    this.productId,
    this.userId,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  String productId;
  int userId;
  DateTime updatedAt;
  DateTime createdAt;
  int id;

  factory ProductLikeModel.fromJson(Map<String, dynamic> json) =>
      ProductLikeModel(
        productId: json["product_id"],
        userId: json["user_id"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "user_id": userId,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
      };
}
