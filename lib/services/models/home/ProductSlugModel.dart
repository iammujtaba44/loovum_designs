// To parse this JSON data, do
//
//     final productSlugModel = productSlugModelFromJson(jsonString);

import 'dart:convert';

ProductSlugModel productSlugModelFromJson(String str) =>
    ProductSlugModel.fromJson(json.decode(str));

String productSlugModelToJson(ProductSlugModel data) =>
    json.encode(data.toJson());

class ProductSlugModel {
  ProductSlugModel({
    this.product,
    this.rating,
    this.ratingCount,
    this.bestSeller,
    this.similarProducts,
    this.liked,
  });

  Product product;
  List<Rating> rating;
  int ratingCount;
  List<dynamic> bestSeller;
  List<dynamic> similarProducts;
  bool liked;

  factory ProductSlugModel.fromJson(Map<String, dynamic> json) =>
      ProductSlugModel(
        product: Product.fromJson(json["product"]),
        rating:
            List<Rating>.from(json["rating"].map((x) => Rating.fromJson(x))),
        ratingCount: json["ratingCount"],
        bestSeller: List<dynamic>.from(json["bestSeller"].map((x) => x)),
        similarProducts:
            List<dynamic>.from(json["similarProducts"].map((x) => x)),
        liked: json["liked"],
      );

  Map<String, dynamic> toJson() => {
        "product": product.toJson(),
        "rating": List<dynamic>.from(rating.map((x) => x.toJson())),
        "ratingCount": ratingCount,
        "bestSeller": List<dynamic>.from(bestSeller.map((x) => x)),
        "similarProducts": List<dynamic>.from(similarProducts.map((x) => x)),
        "liked": liked,
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
    this.galleries,
    this.attributes,
    this.accords,
    this.seller,
    this.favourite,
    this.category,
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
  dynamic sortOrder;
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
  List<Gallery> galleries;
  List<Attribute> attributes;
  List<dynamic> accords;
  Seller seller;
  List<Favourite> favourite;
  Category category;

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
        galleries: List<Gallery>.from(
            json["galleries"].map((x) => Gallery.fromJson(x))),
        attributes: List<Attribute>.from(
            json["attributes"].map((x) => Attribute.fromJson(x))),
        accords: List<dynamic>.from(json["accords"].map((x) => x)),
        seller: Seller.fromJson(json["seller"]),
        favourite: List<Favourite>.from(
            json["favourite"].map((x) => Favourite.fromJson(x))),
        category: Category.fromJson(json["category"]),
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
        "galleries": List<dynamic>.from(galleries.map((x) => x.toJson())),
        "attributes": List<dynamic>.from(attributes.map((x) => x.toJson())),
        "accords": List<dynamic>.from(accords.map((x) => x)),
        "seller": seller.toJson(),
        "favourite": List<dynamic>.from(favourite.map((x) => x.toJson())),
        "category": category.toJson(),
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
  String colorImage;
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
        "type": type,
        "price": price,
        "stock": stock,
        "color_image": colorImage == null ? null : colorImage,
        "sort_order": sortOrder,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
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
  dynamic deletedAt;
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
        deletedAt: json["deleted_at"],
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
        "deleted_at": deletedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

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

class Gallery {
  Gallery({
    this.id,
    this.productId,
    this.image,
    this.sortOrder,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  int productId;
  String image;
  int sortOrder;
  DateTime createdAt;
  DateTime updatedAt;

  factory Gallery.fromJson(Map<String, dynamic> json) => Gallery(
        id: json["id"],
        productId: json["product_id"],
        image: json["image"],
        sortOrder: json["sort_order"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "image": image,
        "sort_order": sortOrder,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Seller {
  Seller({
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

  factory Seller.fromJson(Map<String, dynamic> json) => Seller(
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

class Rating {
  Rating({
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

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
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
