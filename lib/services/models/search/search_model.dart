// To parse this JSON data, do
//
//     final searchModel = searchModelFromJson(jsonString);

import 'dart:convert';

SearchModel searchModelFromJson(String str) =>
    SearchModel.fromJson(json.decode(str));

String searchModelToJson(SearchModel data) => json.encode(data.toJson());

class SearchModel {
  SearchModel({
    this.products,
    this.randomProducts,
  });

  List<Product> products;
  List<dynamic> randomProducts;

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
        randomProducts:
            List<dynamic>.from(json["randomProducts"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
        "randomProducts": List<dynamic>.from(randomProducts.map((x) => x)),
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
  int sold;
  int soldCount;
  int percentage;
  dynamic discountId;
  int activate;
  int color;
  int size;
  int style;
  int sortOrder;
  DateTime startTime;
  DateTime endTime;
  SeoTitle seoTitle;
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
  List<Favourite> favourite;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        categoryId: json["category_id"],
        subcategoryId:
            json["subcategory_id"] == null ? null : json["subcategory_id"],
        sellerId: json["seller_id"],
        title: json["title"],
        image: json["image"],
        smallImage: json["small_image"],
        slug: json["slug"],
        fitDetails: json["fit_details"] == null ? null : json["fit_details"],
        description: json["description"],
        infoAndCare:
            json["info_and_care"] == null ? null : json["info_and_care"],
        shippingAndReturns: json["shipping_and_returns"] == null
            ? null
            : json["shipping_and_returns"],
        sku: json["sku"],
        favCount: json["fav_count"],
        favNumber: json["fav_number"],
        bestSeller: json["best_seller"],
        handPicked: json["hand_picked"],
        price: json["price"],
        salePrice: json["sale_price"],
        sold: json["sold"] == null ? null : json["sold"],
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
        seoTitle: json["seo_title"] == null
            ? null
            : seoTitleValues.map[json["seo_title"]],
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
        deletedAt: json["deleted_at"] == null
            ? null
            : DateTime.parse(json["deleted_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        attributes: List<Attribute>.from(
            json["attributes"].map((x) => Attribute.fromJson(x))),
        favourite: List<Favourite>.from(
            json["favourite"].map((x) => Favourite.fromJson(x))),
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
        "fit_details": fitDetails == null ? null : fitDetails,
        "description": description,
        "info_and_care": infoAndCare == null ? null : infoAndCare,
        "shipping_and_returns":
            shippingAndReturns == null ? null : shippingAndReturns,
        "sku": sku,
        "fav_count": favCount,
        "fav_number": favNumber,
        "best_seller": bestSeller,
        "hand_picked": handPicked,
        "price": price,
        "sale_price": salePrice,
        "sold": sold == null ? null : sold,
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
        "seo_title": seoTitle == null ? null : seoTitleValues.reverse[seoTitle],
        "seo_keyword": seoKeyword == null ? null : seoKeyword,
        "seo_description": seoDescription == null ? null : seoDescription,
        "rating_count": ratingCount,
        "star_count": starCount,
        "star_five": starFive,
        "star_four": starFour,
        "star_three": starThree,
        "star_two": starTwo,
        "star_one": starOne,
        "deleted_at": deletedAt == null ? null : deletedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "attributes": List<dynamic>.from(attributes.map((x) => x.toJson())),
        "favourite": List<dynamic>.from(favourite.map((x) => x.toJson())),
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
  Type type;
  String price;
  int stock;
  String colorImage;
  int sortOrder;
  DateTime createdAt;
  DateTime updatedAt;

  factory Attribute.fromJson(Map<String, dynamic> json) => Attribute(
        id: json["id"],
        productId: json["product_id"],
        sku: json["sku"],
        value: json["value"],
        type: typeValues.map[json["type"]],
        price: json["price"] == null ? null : json["price"],
        stock: json["stock"],
        colorImage: json["color_image"] == null ? null : json["color_image"],
        sortOrder: json["sort_order"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "sku": sku,
        "value": value,
        "type": typeValues.reverse[type],
        "price": price == null ? null : price,
        "stock": stock,
        "color_image": colorImage == null ? null : colorImage,
        "sort_order": sortOrder,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

enum Type { SIZE, COLOR }

final typeValues = EnumValues({"color": Type.COLOR, "size": Type.SIZE});

class Favourite {
  Favourite({
    this.id,
    this.productId,
    this.userId,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  int productId;
  int userId;
  DateTime createdAt;
  DateTime updatedAt;

  factory Favourite.fromJson(Map<String, dynamic> json) => Favourite(
        id: json["id"],
        productId: json["product_id"],
        userId: json["user_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "user_id": userId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

enum SeoTitle {
  WOMEN_S_CLOTHING_DEALS_TUNICS_DRESSES_TANKS_MORE_LOOVUM,
  PERFUME_DEALS_DISCOUNTED_DECANTED_PERFUME_COLOGNE_LOOVUM
}

final seoTitleValues = EnumValues({
  "Perfume Deals: Discounted Decanted Perfume & Cologne | Loovum":
      SeoTitle.PERFUME_DEALS_DISCOUNTED_DECANTED_PERFUME_COLOGNE_LOOVUM,
  "Womenʼs Clothing Deals: Tunics, Dresses, Tanks & More | Loovum":
      SeoTitle.WOMEN_S_CLOTHING_DEALS_TUNICS_DRESSES_TANKS_MORE_LOOVUM
});

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
