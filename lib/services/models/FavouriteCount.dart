// To parse this JSON data, do
//
//     final favouriteCount = favouriteCountFromJson(jsonString);

import 'dart:convert';

FavouriteCountModel favouriteCountFromJson(String str) =>
    FavouriteCountModel.fromJson(json.decode(str));

String favouriteCountToJson(FavouriteCountModel data) =>
    json.encode(data.toJson());

class FavouriteCountModel {
  FavouriteCountModel({
    this.active,
    this.inactive,
    this.sneakpeek,
  });

  int active;
  int inactive;
  int sneakpeek;

  factory FavouriteCountModel.fromJson(Map<String, dynamic> json) =>
      FavouriteCountModel(
        active: json["active"],
        inactive: json["inactive"],
        sneakpeek: json["sneakpeek"],
      );

  Map<String, dynamic> toJson() => {
        "active": active,
        "inactive": inactive,
        "sneakpeek": sneakpeek,
      };
}
