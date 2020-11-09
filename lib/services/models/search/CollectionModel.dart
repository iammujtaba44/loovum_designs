import 'dart:convert';

CollectionModel collectionModelFromJson(String str) =>
    CollectionModel.fromJson(json.decode(str));

String collectionModelToJson(CollectionModel data) =>
    json.encode(data.toJson());

class CollectionModel {
  CollectionModel({
    this.id,
    this.name,
    this.slug,
    this.bannerImage,
    this.preview,
    this.seoTitle,
    this.seoKeyword,
    this.seoDescription,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String name;
  String slug;
  String bannerImage;
  String preview;
  dynamic seoTitle;
  dynamic seoKeyword;
  dynamic seoDescription;
  DateTime createdAt;
  DateTime updatedAt;

  factory CollectionModel.fromJson(Map<String, dynamic> json) =>
      CollectionModel(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        bannerImage: json["banner_image"],
        preview: json["preview"],
        seoTitle: json["seo_title"],
        seoKeyword: json["seo_keyword"],
        seoDescription: json["seo_description"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "banner_image": bannerImage,
        "preview": preview,
        "seo_title": seoTitle,
        "seo_keyword": seoKeyword,
        "seo_description": seoDescription,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
