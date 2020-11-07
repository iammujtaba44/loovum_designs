import 'dart:convert';

OrdersModel ordersModelFromJson(String str) =>
    OrdersModel.fromJson(json.decode(str));

String ordersModelToJson(OrdersModel data) => json.encode(data.toJson());

class OrdersModel {
  String createdAt;
  int id;
  String totalAmount;
  int cardLast4;
  String customerAddress;
  List<Products> products;

  OrdersModel(
      {this.createdAt,
      this.id,
      this.totalAmount,
      this.cardLast4,
      this.customerAddress,
      this.products});

  OrdersModel.fromJson(Map<String, dynamic> json) {
    createdAt = json['created_at'];
    id = json['id'];
    totalAmount = json['total_amount'];
    cardLast4 = json['card_last4'];
    customerAddress = json['customer_address'];
    if (json['products'] != null) {
      products = new List<Products>();
      json['products'].forEach((v) {
        products.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    data['total_amount'] = this.totalAmount;
    data['card_last4'] = this.cardLast4;
    data['customer_address'] = this.customerAddress;
    if (this.products != null) {
      data['products'] = this.products.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  int id;
  int orderId;
  int productId;
  int userId;
  String productTitle;
  String productImage;
  String transactionId;
  String carrierName;
  String trackingCode;
  int quantity;
  String size;
  String color;
  String style;
  String price;
  String shippingCharge;
  int shippingTime;
  int hasRating;
  String status;
  String createdAt;
  String updatedAt;
  Product product;

  Products(
      {this.id,
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
      this.product});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'];
    productId = json['product_id'];
    userId = json['user_id'];
    productTitle = json['product_title'];
    productImage = json['product_image'];
    transactionId = json['transaction_id'];
    carrierName = json['carrier_name'];
    trackingCode = json['tracking_code'];
    quantity = json['quantity'];
    size = json['size'];
    color = json['color'];
    style = json['style'];
    price = json['price'];
    shippingCharge = json['shipping_charge'];
    shippingTime = json['shipping_time'];
    hasRating = json['has_rating'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    product =
        json['product'] != null ? new Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_id'] = this.orderId;
    data['product_id'] = this.productId;
    data['user_id'] = this.userId;
    data['product_title'] = this.productTitle;
    data['product_image'] = this.productImage;
    data['transaction_id'] = this.transactionId;
    data['carrier_name'] = this.carrierName;
    data['tracking_code'] = this.trackingCode;
    data['quantity'] = this.quantity;
    data['size'] = this.size;
    data['color'] = this.color;
    data['style'] = this.style;
    data['price'] = this.price;
    data['shipping_charge'] = this.shippingCharge;
    data['shipping_time'] = this.shippingTime;
    data['has_rating'] = this.hasRating;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.product != null) {
      data['product'] = this.product.toJson();
    }
    return data;
  }
}

class Product {
  String slug;
  String title;
  String smallImage;
  int id;

  Product({this.slug, this.title, this.smallImage, this.id});

  Product.fromJson(Map<String, dynamic> json) {
    slug = json['slug'];
    title = json['title'];
    smallImage = json['small_image'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['slug'] = this.slug;
    data['title'] = this.title;
    data['small_image'] = this.smallImage;
    data['id'] = this.id;
    return data;
  }
}
