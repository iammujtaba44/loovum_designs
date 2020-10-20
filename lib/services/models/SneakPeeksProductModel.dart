// To parse this JSON data, do
//
//     final sneakPeeksProductsModel = sneakPeeksProductsModelFromJson(jsonString);

import 'dart:convert';

SneakPeeksProductsModel sneakPeeksProductsModelFromJson(String str) =>
    SneakPeeksProductsModel.fromJson(json.decode(str));

String sneakPeeksProductsModelToJson(SneakPeeksProductsModel data) =>
    json.encode(data.toJson());

class SneakPeeksProductsModel {
  SneakPeeksProductsModel({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  int currentPage;
  List<dynamic> data;
  String firstPageUrl;
  dynamic from;
  int lastPage;
  String lastPageUrl;
  dynamic nextPageUrl;
  String path;
  int perPage;
  dynamic prevPageUrl;
  dynamic to;
  int total;

  factory SneakPeeksProductsModel.fromJson(Map<String, dynamic> json) =>
      SneakPeeksProductsModel(
        currentPage: json["current_page"],
        data: List<dynamic>.from(json["data"].map((x) => x)),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": List<dynamic>.from(data.map((x) => x)),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
      };
}
