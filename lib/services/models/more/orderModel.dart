// To parse this JSON data, do
//
//     final ordersModel = ordersModelFromJson(jsonString);

import 'dart:convert';

List<OrdersModel> ordersModelFromJson(String str) => List<OrdersModel>.from(
    json.decode(str).map((x) => OrdersModel.fromJson(x)));

String ordersModelToJson(List<OrdersModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OrdersModel {
  OrdersModel({
    this.createdAt,
    this.id,
    this.totalAmount,
    this.cardLast4,
    this.customerAddress,
    this.products,
  });

  DateTime createdAt;
  int id;
  String totalAmount;
  int cardLast4;
  String customerAddress;
  List<ProductElement> products;

  factory OrdersModel.fromJson(Map<String, dynamic> json) => OrdersModel(
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
        totalAmount: json["total_amount"],
        cardLast4: json["card_last4"],
        customerAddress: json["customer_address"],
        products: List<ProductElement>.from(
            json["products"].map((x) => ProductElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "created_at": createdAt.toIso8601String(),
        "id": id,
        "total_amount": totalAmount,
        "card_last4": cardLast4,
        "customer_address": customerAddress,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class ProductElement {
  ProductElement({
    this.id,
    this.orderId,
    this.productId,
    this.userId,
    this.productTitle,
    this.productImage,
    this.transactionId,
    this.carrierName,
    this.trackingCode,
    this.quantity,
    this.size,
    this.color,
    this.style,
    this.price,
    this.shippingCharge,
    this.shippingTime,
    this.hasRating,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.product,
  });

  int id;
  int orderId;
  int productId;
  int userId;
  dynamic productTitle;
  dynamic productImage;
  String transactionId;
  String carrierName;
  String trackingCode;
  int quantity;
  String size;
  dynamic color;
  dynamic style;
  String price;
  String shippingCharge;
  int shippingTime;
  int hasRating;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  ProductProduct product;

  factory ProductElement.fromJson(Map<String, dynamic> json) => ProductElement(
        id: json["id"],
        orderId: json["order_id"],
        productId: json["product_id"],
        userId: json["user_id"],
        productTitle: json["product_title"],
        productImage: json["product_image"],
        transactionId: json["transaction_id"],
        carrierName: json["carrier_name"],
        trackingCode: json["tracking_code"],
        quantity: json["quantity"],
        size: json["size"],
        color: json["color"],
        style: json["style"],
        price: json["price"],
        shippingCharge: json["shipping_charge"],
        shippingTime: json["shipping_time"],
        hasRating: json["has_rating"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        product: ProductProduct.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "order_id": orderId,
        "product_id": productId,
        "user_id": userId,
        "product_title": productTitle,
        "product_image": productImage,
        "transaction_id": transactionId,
        "carrier_name": carrierName,
        "tracking_code": trackingCode,
        "quantity": quantity,
        "size": size,
        "color": color,
        "style": style,
        "price": price,
        "shipping_charge": shippingCharge,
        "shipping_time": shippingTime,
        "has_rating": hasRating,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "product": product.toJson(),
      };
}

class ProductProduct {
  ProductProduct({
    this.slug,
    this.title,
    this.smallImage,
    this.id,
  });

  String slug;
  String title;
  String smallImage;
  int id;

  factory ProductProduct.fromJson(Map<String, dynamic> json) => ProductProduct(
        slug: json["slug"],
        title: json["title"],
        smallImage: json["small_image"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "slug": slug,
        "title": title,
        "small_image": smallImage,
        "id": id,
      };
}
