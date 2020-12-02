class ShopingBagModel {
  ShopingBagModel({
    this.id,
    this.name,
    this.image,
    this.slug,
    this.price,
    this.qty,
    this.size,
    this.color,
    this.style,
    this.shippingTime,
    this.shippingCharge,
    this.shippingChargeTwo,
    this.sellerName,
    this.errors,
  });

  int id;
  String name;
  String image;
  String slug;
  String price;
  int qty;
  String size;
  String color;
  String style;
  int shippingTime;
  String shippingCharge;
  String shippingChargeTwo;
  String sellerName;
  Errors errors;
}

class Errors {
  Errors({
    this.size,
    this.style,
    this.color,
  });

  bool size;
  bool style;
  bool color;
}
