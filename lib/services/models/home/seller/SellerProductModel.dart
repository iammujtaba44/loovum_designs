// To parse this JSON data, do
//
//     final sellerProductModel = sellerProductModelFromJson(jsonString);

import 'dart:convert';

SellerProductModel sellerProductModelFromJson(String str) =>
    SellerProductModel.fromJson(json.decode(str));

String sellerProductModelToJson(SellerProductModel data) =>
    json.encode(data.toJson());

class SellerProductModel {
  SellerProductModel({
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
  List<Datum> data;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  dynamic nextPageUrl;
  String path;
  int perPage;
  dynamic prevPageUrl;
  int to;
  int total;

  factory SellerProductModel.fromJson(Map<String, dynamic> json) =>
      SellerProductModel(
        currentPage: json["current_page"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
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
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
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

class Datum {
  Datum({
    this.id,
    this.categoryId,
    this.subcategoryId,
    this.sellerId,
    this.title,
    this.image,
    this.smallImage,
    this.slug,
    this.fitDetails,
    this.description,
    this.infoAndCare,
    this.shippingAndReturns,
    this.sku,
    this.favCount,
    this.favNumber,
    this.bestSeller,
    this.handPicked,
    this.price,
    this.salePrice,
    this.sold,
    this.soldCount,
    this.percentage,
    this.discountId,
    this.activate,
    this.color,
    this.size,
    this.style,
    this.sortOrder,
    this.startTime,
    this.endTime,
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
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  int categoryId;
  int subcategoryId;
  int sellerId;
  String title;
  String image;
  String smallImage;
  String slug;
  String fitDetails;
  String description;
  dynamic infoAndCare;
  dynamic shippingAndReturns;
  String sku;
  int favCount;
  int favNumber;
  int bestSeller;
  int handPicked;
  String price;
  String salePrice;
  dynamic sold;
  int soldCount;
  int percentage;
  int discountId;
  int activate;
  int color;
  int size;
  int style;
  int sortOrder;
  DateTime startTime;
  DateTime endTime;
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
  dynamic deletedAt;
  DateTime createdAt;
  DateTime updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        categoryId: json["category_id"],
        subcategoryId:
            json["subcategory_id"] == null ? null : json["subcategory_id"],
        sellerId: json["seller_id"],
        title: json["title"],
        image: json["image"],
        smallImage: json["small_image"],
        slug: json["slug"],
        fitDetails: json["fit_details"],
        description: json["description"],
        infoAndCare: json["info_and_care"],
        shippingAndReturns: json["shipping_and_returns"],
        sku: json["sku"],
        favCount: json["fav_count"],
        favNumber: json["fav_number"],
        bestSeller: json["best_seller"],
        handPicked: json["hand_picked"],
        price: json["price"],
        salePrice: json["sale_price"],
        sold: json["sold"],
        soldCount: json["sold_count"],
        percentage: json["percentage"],
        discountId: json["discount_id"],
        activate: json["activate"],
        color: json["color"],
        size: json["size"],
        style: json["style"],
        sortOrder: json["sort_order"] == null ? null : json["sort_order"],
        startTime: DateTime.parse(json["start_time"]),
        endTime: DateTime.parse(json["end_time"]),
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
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_id": categoryId,
        "subcategory_id": subcategoryId == null ? null : subcategoryId,
        "seller_id": sellerId,
        "title": title,
        "image": image,
        "small_image": smallImage,
        "slug": slug,
        "fit_details": fitDetails,
        "description": description,
        "info_and_care": infoAndCare,
        "shipping_and_returns": shippingAndReturns,
        "sku": sku,
        "fav_count": favCount,
        "fav_number": favNumber,
        "best_seller": bestSeller,
        "hand_picked": handPicked,
        "price": price,
        "sale_price": salePrice,
        "sold": sold,
        "sold_count": soldCount,
        "percentage": percentage,
        "discount_id": discountId,
        "activate": activate,
        "color": color,
        "size": size,
        "style": style,
        "sort_order": sortOrder == null ? null : sortOrder,
        "start_time": startTime.toIso8601String(),
        "end_time": endTime.toIso8601String(),
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
        "deleted_at": deletedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
