// To parse this JSON data, do
//
//     final mainHomeModel = mainHomeModelFromJson(jsonString);

import 'dart:convert';

MainHomeModel mainHomeModelFromJson(String str) =>
    MainHomeModel.fromJson(json.decode(str));

String mainHomeModelToJson(MainHomeModel data) => json.encode(data.toJson());

class MainHomeModel {
  MainHomeModel({
    this.products,
    this.count,
  });

  List<Product> products;
  int count;

  factory MainHomeModel.fromJson(Map<String, dynamic> json) => MainHomeModel(
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
        "count": count,
      };
}

class Product {
  Product({
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
    this.attributes,
    this.favourite,
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
  String infoAndCare;
  String shippingAndReturns;
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
  String seoTitle;
  String seoKeyword;
  String seoDescription;
  int ratingCount;
  int starCount;
  int starFive;
  int starFour;
  int starThree;
  int starTwo;
  int starOne;
  DateTime deletedAt;
  DateTime createdAt;
  DateTime updatedAt;
  List<Attribute> attributes;
  List<dynamic> favourite;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        categoryId: json["category_id"],
        subcategoryId: json["subcategory_id"],
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
        sortOrder: json["sort_order"],
        startTime: DateTime.parse(json["start_time"]),
        endTime: DateTime.parse(json["end_time"]),
        seoTitle: json["seo_title"] == null ? null : json["seo_title"],
        seoKeyword: json["seo_keyword"] == null ? null : json["seo_keyword"],
        seoDescription:
            json["seo_description"] == null ? null : json["seo_description"],
        ratingCount: json["rating_count"],
        starCount: json["star_count"],
        starFive: json["star_five"],
        starFour: json["star_four"],
        starThree: json["star_three"],
        starTwo: json["star_two"],
        starOne: json["star_one"],
        deletedAt: DateTime.parse(json["deleted_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        attributes: List<Attribute>.from(
            json["attributes"].map((x) => Attribute.fromJson(x))),
        favourite: List<dynamic>.from(json["favourite"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_id": categoryId,
        "subcategory_id": subcategoryId,
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
        "sort_order": sortOrder,
        "start_time": startTime.toIso8601String(),
        "end_time": endTime.toIso8601String(),
        "seo_title": seoTitle == null ? null : seoTitle,
        "seo_keyword": seoKeyword == null ? null : seoKeyword,
        "seo_description": seoDescription == null ? null : seoDescription,
        "rating_count": ratingCount,
        "star_count": starCount,
        "star_five": starFive,
        "star_four": starFour,
        "star_three": starThree,
        "star_two": starTwo,
        "star_one": starOne,
        "deleted_at": deletedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "attributes": List<dynamic>.from(attributes.map((x) => x.toJson())),
        "favourite": List<dynamic>.from(favourite.map((x) => x)),
      };
}

class Attribute {
  Attribute({
    this.id,
    this.productId,
    this.sku,
    this.value,
    this.type,
    this.price,
    this.stock,
    this.colorImage,
    this.sortOrder,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  int productId;
  String sku;
  String value;
  String type;
  String price;
  int stock;
  dynamic colorImage;
  int sortOrder;
  DateTime createdAt;
  DateTime updatedAt;

  factory Attribute.fromJson(Map<String, dynamic> json) => Attribute(
        id: json["id"],
        productId: json["product_id"],
        sku: json["sku"],
        value: json["value"],
        type: json["type"],
        price: json["price"],
        stock: json["stock"],
        colorImage: json["color_image"],
        sortOrder: json["sort_order"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "sku": sku,
        "value": value,
        "type": type,
        "price": price,
        "stock": stock,
        "color_image": colorImage,
        "sort_order": sortOrder,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
