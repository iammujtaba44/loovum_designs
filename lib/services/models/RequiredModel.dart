// To parse this JSON data, do
//
//     final requiredModel = requiredModelFromJson(jsonString);

import 'dart:convert';

RequiredModel requiredModelFromJson(String str) =>
    RequiredModel.fromJson(json.decode(str));

String requiredModelToJson(RequiredModel data) => json.encode(data.toJson());

class RequiredModel {
  RequiredModel({
    this.setting,
    this.offer,
    this.categories,
    this.menus,
    this.reviews,
  });

  Setting setting;
  Offer offer;
  List<Category> categories;
  List<Menu> menus;
  List<Review> reviews;

  factory RequiredModel.fromJson(Map<String, dynamic> json) => RequiredModel(
        setting: Setting.fromJson(json["setting"]),
        offer: Offer.fromJson(json["offer"]),
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromJson(x))),
        menus: List<Menu>.from(json["menus"].map((x) => Menu.fromJson(x))),
        reviews:
            List<Review>.from(json["reviews"].map((x) => Review.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "setting": setting.toJson(),
        "offer": offer.toJson(),
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
        "menus": List<dynamic>.from(menus.map((x) => x.toJson())),
        "reviews": List<dynamic>.from(reviews.map((x) => x.toJson())),
      };
}

class Category {
  Category({
    this.id,
    this.name,
    this.slug,
    this.banner,
    this.status,
    this.sortOrder,
    this.seoTitle,
    this.seoKeyword,
    this.seoDescription,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String name;
  String slug;
  String banner;
  int status;
  int sortOrder;
  String seoTitle;
  String seoKeyword;
  String seoDescription;
  DateTime deletedAt;
  DateTime createdAt;
  DateTime updatedAt;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        banner: json["banner"],
        status: json["status"],
        sortOrder: json["sort_order"],
        seoTitle: json["seo_title"],
        seoKeyword: json["seo_keyword"],
        seoDescription: json["seo_description"],
        deletedAt: json["deleted_at"] == null
            ? null
            : DateTime.parse(json["deleted_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "banner": banner,
        "status": status,
        "sort_order": sortOrder,
        "seo_title": seoTitle,
        "seo_keyword": seoKeyword,
        "seo_description": seoDescription,
        "deleted_at": deletedAt == null ? null : deletedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Menu {
  Menu({
    this.id,
    this.name,
    this.url,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String name;
  String url;
  DateTime createdAt;
  DateTime updatedAt;

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
        id: json["id"],
        name: json["name"],
        url: json["url"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "url": url,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Offer {
  Offer({
    this.name,
    this.status,
    this.showinHeader,
    this.textColor,
    this.slug,
  });

  String name;
  int status;
  int showinHeader;
  String textColor;
  String slug;

  factory Offer.fromJson(Map<String, dynamic> json) => Offer(
        name: json["name"],
        status: json["status"],
        showinHeader: json["showin_header"],
        textColor: json["text_color"],
        slug: json["slug"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "status": status,
        "showin_header": showinHeader,
        "text_color": textColor,
        "slug": slug,
      };
}

class Review {
  Review({
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

  factory Review.fromJson(Map<String, dynamic> json) => Review(
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
  String avatar;
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
        avatar: json["avatar"],
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
        "avatar": avatar,
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

class Setting {
  Setting({
    this.id,
    this.websiteName,
    this.logo,
    this.footerCredit,
    this.facebook,
    this.twitter,
    this.youtube,
    this.instagram,
    this.pinterest,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String websiteName;
  String logo;
  String footerCredit;
  String facebook;
  String twitter;
  String youtube;
  String instagram;
  String pinterest;
  DateTime createdAt;
  DateTime updatedAt;

  factory Setting.fromJson(Map<String, dynamic> json) => Setting(
        id: json["id"],
        websiteName: json["website_name"],
        logo: json["logo"],
        footerCredit: json["footer_credit"],
        facebook: json["facebook"],
        twitter: json["twitter"],
        youtube: json["youtube"],
        instagram: json["instagram"],
        pinterest: json["pinterest"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "website_name": websiteName,
        "logo": logo,
        "footer_credit": footerCredit,
        "facebook": facebook,
        "twitter": twitter,
        "youtube": youtube,
        "instagram": instagram,
        "pinterest": pinterest,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
