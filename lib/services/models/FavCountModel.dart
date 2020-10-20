import 'dart:convert';

FavCountModel favCountModelFromJson(String str) =>
    FavCountModel.fromJson(json.decode(str));

String favCountModelToJson(FavCountModel data) => json.encode(data.toJson());

class FavCountModel {
  FavCountModel({
    this.active,
    this.inactive,
    this.sneakpeek,
  });

  int active;
  int inactive;
  int sneakpeek;

  factory FavCountModel.fromJson(Map<String, dynamic> json) => FavCountModel(
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
