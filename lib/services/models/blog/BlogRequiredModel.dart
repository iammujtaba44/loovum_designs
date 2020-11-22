import 'dart:convert';

BlogRequiredModel blogRequiredModelFromJson(String str) =>
    BlogRequiredModel.fromJson(json.decode(str));

String blogRequiredModelToJson(BlogRequiredModel data) =>
    json.encode(data.toJson());

class BlogRequiredModel {
  BlogRequiredModel({
    this.product,
    this.categories,
    this.products,
    this.setting,
  });

  dynamic product;
  List<Category> categories;
  List<dynamic> products;
  Setting setting;

  factory BlogRequiredModel.fromJson(Map<String, dynamic> json) =>
      BlogRequiredModel(
        product: json["product"],
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromJson(x))),
        products: List<dynamic>.from(json["products"].map((x) => x)),
        setting: Setting.fromJson(json["setting"]),
      );

  Map<String, dynamic> toJson() => {
        "product": product,
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
        "products": List<dynamic>.from(products.map((x) => x)),
        "setting": setting.toJson(),
      };
}

class Category {
  Category({
    this.id,
    this.name,
    this.slug,
    this.seoTitle,
    this.seoKeyword,
    this.seoDescription,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String name;
  String slug;
  dynamic seoTitle;
  dynamic seoKeyword;
  dynamic seoDescription;
  DateTime createdAt;
  DateTime updatedAt;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
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
        "seo_title": seoTitle,
        "seo_keyword": seoKeyword,
        "seo_description": seoDescription,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
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
