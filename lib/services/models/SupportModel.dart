// To parse this JSON data, do
//
//     final supportModel = supportModelFromJson(jsonString);

import 'dart:convert';

List<SupportModel> supportModelFromJson(String str) => List<SupportModel>.from(
    json.decode(str).map((x) => SupportModel.fromJson(x)));

String supportModelToJson(List<SupportModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SupportModel {
  SupportModel({
    this.id,
    this.name,
    this.slug,
    this.banner,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String name;
  String slug;
  String banner;
  DateTime createdAt;
  DateTime updatedAt;

  factory SupportModel.fromJson(Map<String, dynamic> json) => SupportModel(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        banner: json["banner"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "banner": banner,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
