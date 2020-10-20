import 'dart:convert';

List<AuthenticateUserBillingModel> authenticateUserBillingModelFromJson(
    String str) =>
    List<AuthenticateUserBillingModel>.from(
        json.decode(str).map((x) => AuthenticateUserBillingModel.fromJson(x)));

String authenticateUserBillingModelToJson(
    List<AuthenticateUserBillingModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AuthenticateUserBillingModel {
  AuthenticateUserBillingModel({
    this.id,
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
    this.updatedAt,
  });

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
  DateTime createdAt;
  DateTime updatedAt;

  factory AuthenticateUserBillingModel.fromJson(Map<String, dynamic> json) =>
      AuthenticateUserBillingModel(
        id: json["id"],
        userId: json["user_id"],
        customerId: json["customer_id"],
        nameOnCard: json["name_on_card"],
        cardId: json["card_id"],
        brand: json["brand"],
        last4: json["last4"],
        expMonth: json["exp_month"],
        expYear: json["exp_year"],
        defaultCard: json["default_card"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "customer_id": customerId,
    "name_on_card": nameOnCard,
    "card_id": cardId,
    "brand": brand,
    "last4": last4,
    "exp_month": expMonth,
    "exp_year": expYear,
    "default_card": defaultCard,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
