import 'dart:convert';

PopularModel popularModelFromJson(String str) =>
    PopularModel.fromJson(json.decode(str));

String popularModelToJson(PopularModel data) => json.encode(data.toJson());

class PopularModel {
  PopularModel({
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
  List<Dater> data;
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

  factory PopularModel.fromJson(Map<String, dynamic> json) => PopularModel(
        currentPage: json["current_page"],
        data: List<Dater>.from(json["data"].map((x) => Dater.fromJson(x))),
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

class Dater {
  Dater({
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
  List<Attribute> attributes;
  List<Favourite> favourite;

  factory Dater.fromJson(Map<String, dynamic> json) => Dater(
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
        attributes: List<Attribute>.from(
            json["attributes"].map((x) => Attribute.fromJson(x))),
        favourite: List<Favourite>.from(
            json["favourite"].map((x) => Favourite.fromJson(x))),
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
        price: json["price"],
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
        "price": price,
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
