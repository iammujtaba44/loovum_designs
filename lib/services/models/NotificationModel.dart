import 'dart:convert';

List<NotificationModel> notificationModelFromJson(String str) =>
    List<NotificationModel>.from(
        json.decode(str).map((x) => NotificationModel.fromJson(x)));

String notificationModelToJson(List<NotificationModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NotificationModel {
  NotificationModel({
    this.id,
    this.type,
    this.notifiableType,
    this.notifiableId,
    this.data,
    this.readAt,
    this.createdAt,
    this.updatedAt,
  });

  String id;
  Type type;
  NotifiableType notifiableType;
  int notifiableId;
  Data data;
  DateTime readAt;
  DateTime createdAt;
  DateTime updatedAt;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        id: json["id"],
        type: typeValues.map[json["type"]],
        notifiableType: notifiableTypeValues.map[json["notifiable_type"]],
        notifiableId: json["notifiable_id"],
        data: Data.fromJson(json["data"]),
        readAt:
            json["read_at"] == null ? null : DateTime.parse(json["read_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": typeValues.reverse[type],
        "notifiable_type": notifiableTypeValues.reverse[notifiableType],
        "notifiable_id": notifiableId,
        "data": data.toJson(),
        "read_at": readAt == null ? null : readAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Data {
  Data({
    this.orderId,
    this.message,
    this.action,
    this.userId,
  });

  int orderId;
  Message message;
  dynamic action;
  int userId;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        orderId: json["order_id"],
        message: messageValues.map[json["message"]],
        action: json["action"],
        userId: json["user_id"] == null ? null : json["user_id"],
      );

  Map<String, dynamic> toJson() => {
        "order_id": orderId,
        "message": messageValues.reverse[message],
        "action": action,
        "user_id": userId == null ? null : userId,
      };
}

enum Message { YOU_HAVE_GOT_AN_NEW_ORDER, YOUR_ORDER_PLACED_SUCCESSFULLY_1 }

final messageValues = EnumValues({
  "Your order placed successfully - #1":
      Message.YOUR_ORDER_PLACED_SUCCESSFULLY_1,
  "You have got an new order": Message.YOU_HAVE_GOT_AN_NEW_ORDER
});

enum NotifiableType { APP_USER }

final notifiableTypeValues = EnumValues({"App\\User": NotifiableType.APP_USER});

enum Type { APP_NOTIFICATIONS_ADMIN_GET_ORDERS, APP_NOTIFICATIONS_ORDER_PLACED }

final typeValues = EnumValues({
  "App\\Notifications\\AdminGetOrders": Type.APP_NOTIFICATIONS_ADMIN_GET_ORDERS,
  "App\\Notifications\\OrderPlaced": Type.APP_NOTIFICATIONS_ORDER_PLACED
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
