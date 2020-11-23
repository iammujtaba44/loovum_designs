// To parse this JSON data, do
//
//     final sellerModel = sellerModelFromJson(jsonString);

import 'dart:convert';

SellerModel sellerModelFromJson(String str) =>
    SellerModel.fromJson(json.decode(str));

String sellerModelToJson(SellerModel data) => json.encode(data.toJson());

class SellerModel {
  SellerModel({
    this.id,
    this.name,
    this.slug,
    this.logo,
    this.sellerName,
    this.sellerPhoto,
    this.location,
    this.website,
    this.shipping,
    this.print,
    this.about,
    this.seoTitle,
    this.seoKeyword,
    this.seoDescription,
    this.ratingCount,
    this.starCount,
    this.starFive,
    this.starFour,
    this.starThree,
    this.starTwo,
    this.starOne,
    this.status,
    this.createdDate,
    this.area,
    this.handlingTime,
    this.shippingCharge,
    this.shippingChargeTwo,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String name;
  String slug;
  String logo;
  String sellerName;
  String sellerPhoto;
  String location;
  dynamic website;
  dynamic shipping;
  dynamic print;
  String about;
  dynamic seoTitle;
  dynamic seoKeyword;
  dynamic seoDescription;
  int ratingCount;
  int starCount;
  int starFive;
  int starFour;
  int starThree;
  int starTwo;
  int starOne;
  int status;
  dynamic createdDate;
  dynamic area;
  int handlingTime;
  dynamic shippingCharge;
  dynamic shippingChargeTwo;
  DateTime createdAt;
  DateTime updatedAt;

  factory SellerModel.fromJson(Map<String, dynamic> json) => SellerModel(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        logo: json["logo"],
        sellerName: json["seller_name"],
        sellerPhoto: json["seller_photo"],
        location: json["location"],
        website: json["website"],
        shipping: json["shipping"],
        print: json["print"],
        about: json["about"],
        seoTitle: json["seo_title"],
        seoKeyword: json["seo_keyword"],
        seoDescription: json["seo_description"],
        ratingCount: json["rating_count"],
        starCount: json["star_count"],
        starFive: json["star_five"],
        starFour: json["star_four"],
        starThree: json["star_three"],
        starTwo: json["star_two"],
        starOne: json["star_one"],
        status: json["status"],
        createdDate: json["created_date"],
        area: json["area"],
        handlingTime: json["handling_time"],
        shippingCharge: json["shipping_charge"],
        shippingChargeTwo: json["shipping_charge_two"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "logo": logo,
        "seller_name": sellerName,
        "seller_photo": sellerPhoto,
        "location": location,
        "website": website,
        "shipping": shipping,
        "print": print,
        "about": about,
        "seo_title": seoTitle,
        "seo_keyword": seoKeyword,
        "seo_description": seoDescription,
        "rating_count": ratingCount,
        "star_count": starCount,
        "star_five": starFive,
        "star_four": starFour,
        "star_three": starThree,
        "star_two": starTwo,
        "star_one": starOne,
        "status": status,
        "created_date": createdDate,
        "area": area,
        "handling_time": handlingTime,
        "shipping_charge": shippingCharge,
        "shipping_charge_two": shippingChargeTwo,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
