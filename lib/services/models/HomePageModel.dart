import 'dart:convert';

HomePageModel homePageModelFromJson(String str) =>
    HomePageModel.fromJson(json.decode(str));

String homePageModelToJson(HomePageModel data) => json.encode(data.toJson());

class HomePageModel {
  HomePageModel({
    this.shopcategories,
    this.banners,
    this.collections,
    this.ads,
  });

  List<Shopcategory> shopcategories;
  List<Ad> banners;
  List<Collection> collections;
  List<Ad> ads;

  factory HomePageModel.fromJson(Map<String, dynamic> json) => HomePageModel(
        shopcategories: List<Shopcategory>.from(
            json["shopcategories"].map((x) => Shopcategory.fromJson(x))),
        banners: List<Ad>.from(json["banners"].map((x) => Ad.fromJson(x))),
        collections: List<Collection>.from(
            json["collections"].map((x) => Collection.fromJson(x))),
        ads: List<Ad>.from(json["ads"].map((x) => Ad.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "shopcategories":
            List<dynamic>.from(shopcategories.map((x) => x.toJson())),
        "banners": List<dynamic>.from(banners.map((x) => x.toJson())),
        "collections": List<dynamic>.from(collections.map((x) => x.toJson())),
        "ads": List<dynamic>.from(ads.map((x) => x.toJson())),
      };
}

class Ad {
  Ad({
    this.id,
    this.name,
    this.banner,
    this.link,
    this.sortOrder,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.title,
  });

  int id;
  String name;
  String banner;
  String link;
  int sortOrder;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  dynamic title;

  factory Ad.fromJson(Map<String, dynamic> json) => Ad(
        id: json["id"],
        name: json["name"] == null ? null : json["name"],
        banner: json["banner"],
        link: json["link"] == null ? null : json["link"],
        sortOrder: json["sort_order"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name == null ? null : name,
        "banner": banner,
        "link": link == null ? null : link,
        "sort_order": sortOrder,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
        "title": title,
      };
}

class Collection {
  Collection({
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

  factory Collection.fromJson(Map<String, dynamic> json) => Collection(
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

class Shopcategory {
  Shopcategory({
    this.id,
    this.name,
    this.categoryId,
    this.subcategoryId,
    this.image,
    this.sortOrder,
    this.createdAt,
    this.updatedAt,
    this.category,
    this.subcategory,
  });

  int id;
  String name;
  dynamic categoryId;
  int subcategoryId;
  String image;
  int sortOrder;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic category;
  Category subcategory;

  factory Shopcategory.fromJson(Map<String, dynamic> json) => Shopcategory(
        id: json["id"],
        name: json["name"],
        categoryId: json["category_id"],
        subcategoryId: json["subcategory_id"],
        image: json["image"],
        sortOrder: json["sort_order"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        category: json["category"],
        subcategory: Category.fromJson(json["subcategory"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "category_id": categoryId,
        "subcategory_id": subcategoryId,
        "image": image,
        "sort_order": sortOrder,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "category": category,
        "subcategory": subcategory.toJson(),
      };
}

class Category {
  Category({
    this.id,
    this.name,
    this.banner,
    this.slug,
    this.categoryId,
    this.seoTitle,
    this.seoKeyword,
    this.seoDescription,
    this.createdAt,
    this.updatedAt,
    this.categorySlug,
    this.category,
    this.status,
    this.sortOrder,
    this.deletedAt,
  });

  int id;
  String name;
  String banner;
  String slug;
  int categoryId;
  String seoTitle;
  String seoKeyword;
  String seoDescription;
  DateTime createdAt;
  DateTime updatedAt;
  String categorySlug;
  Category category;
  int status;
  int sortOrder;
  dynamic deletedAt;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        banner: json["banner"],
        slug: json["slug"],
        categoryId: json["category_id"] == null ? null : json["category_id"],
        seoTitle: json["seo_title"],
        seoKeyword: json["seo_keyword"],
        seoDescription: json["seo_description"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        categorySlug:
            json["category_slug"] == null ? null : json["category_slug"],
        category: json["category"] == null
            ? null
            : Category.fromJson(json["category"]),
        status: json["status"] == null ? null : json["status"],
        sortOrder: json["sort_order"] == null ? null : json["sort_order"],
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "banner": banner,
        "slug": slug,
        "category_id": categoryId == null ? null : categoryId,
        "seo_title": seoTitle,
        "seo_keyword": seoKeyword,
        "seo_description": seoDescription,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "category_slug": categorySlug == null ? null : categorySlug,
        "category": category == null ? null : category.toJson(),
        "status": status == null ? null : status,
        "sort_order": sortOrder == null ? null : sortOrder,
        "deleted_at": deletedAt,
      };
}
