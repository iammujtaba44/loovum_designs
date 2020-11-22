import 'dart:convert';

BlogCatModel blogCatModelFromJson(String str) =>
    BlogCatModel.fromJson(json.decode(str));

String blogCatModelToJson(BlogCatModel data) => json.encode(data.toJson());

class BlogCatModel {
  BlogCatModel({
    this.category,
    this.posts,
  });

  Category category;
  Posts posts;

  factory BlogCatModel.fromJson(Map<String, dynamic> json) => BlogCatModel(
        category: Category.fromJson(json["category"]),
        posts: Posts.fromJson(json["posts"]),
      );

  Map<String, dynamic> toJson() => {
        "category": category.toJson(),
        "posts": posts.toJson(),
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

class Posts {
  Posts({
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
  List<CatData> data;
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

  factory Posts.fromJson(Map<String, dynamic> json) => Posts(
        currentPage: json["current_page"],
        data: List<CatData>.from(json["data"].map((x) => CatData.fromJson(x))),
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

class CatData {
  CatData({
    this.id,
    this.categoryId,
    this.categoryName,
    this.title,
    this.slug,
    this.image,
    this.image2,
    this.description,
    this.viewCount,
    this.seoTitle,
    this.seoKeyword,
    this.seoDescription,
    this.createdAt,
    this.updatedAt,
    this.category,
  });

  int id;
  int categoryId;
  String categoryName;
  String title;
  String slug;
  String image;
  dynamic image2;
  String description;
  int viewCount;
  String seoTitle;
  dynamic seoKeyword;
  String seoDescription;
  DateTime createdAt;
  DateTime updatedAt;
  Category category;

  factory CatData.fromJson(Map<String, dynamic> json) => CatData(
        id: json["id"],
        categoryId: json["category_id"],
        categoryName: json["category_name"],
        title: json["title"],
        slug: json["slug"],
        image: json["image"],
        image2: json["image2"],
        description: json["description"],
        viewCount: json["view_count"] == null ? null : json["view_count"],
        seoTitle: json["seo_title"],
        seoKeyword: json["seo_keyword"],
        seoDescription: json["seo_description"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        category: Category.fromJson(json["category"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_id": categoryId,
        "category_name": categoryName,
        "title": title,
        "slug": slug,
        "image": image,
        "image2": image2,
        "description": description,
        "view_count": viewCount == null ? null : viewCount,
        "seo_title": seoTitle,
        "seo_keyword": seoKeyword,
        "seo_description": seoDescription,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "category": category.toJson(),
      };
}
