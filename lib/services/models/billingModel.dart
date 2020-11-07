import 'dart:convert';

BillingModel billingModelFromJson(String str) =>
    BillingModel.fromJson(json.decode(str));

String billingModelToJson(BillingModel data) => json.encode(data.toJson());

class BillingModel {
  int id;
  int userId;
  String customerId;
  String nameOnCard;
  String cardId;
  String brand;
  int last4;
  int expMonth;
  int expYear;
  int defaultCard;
  String createdAt;
  String updatedAt;

  BillingModel(
      {this.id,
      this.userId,
      this.customerId,
      this.nameOnCard,
      this.cardId,
      this.brand,
      this.last4,
      this.expMonth,
      this.expYear,
      this.defaultCard,
      this.createdAt,
      this.updatedAt});

  BillingModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    customerId = json['customer_id'];
    nameOnCard = json['name_on_card'];
    cardId = json['card_id'];
    brand = json['brand'];
    last4 = json['last4'];
    expMonth = json['exp_month'];
    expYear = json['exp_year'];
    defaultCard = json['default_card'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['customer_id'] = this.customerId;
    data['name_on_card'] = this.nameOnCard;
    data['card_id'] = this.cardId;
    data['brand'] = this.brand;
    data['last4'] = this.last4;
    data['exp_month'] = this.expMonth;
    data['exp_year'] = this.expYear;
    data['default_card'] = this.defaultCard;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
