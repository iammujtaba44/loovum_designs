import 'dart:convert';

List<ContactSupportFaqDataModel> contactSupportFaqDataModelFromJson(
        String str) =>
    List<ContactSupportFaqDataModel>.from(
        json.decode(str).map((x) => ContactSupportFaqDataModel.fromJson(x)));

String contactSupportFaqDataModelToJson(
        List<ContactSupportFaqDataModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ContactSupportFaqDataModel {
  ContactSupportFaqDataModel({
    this.id,
    this.question,
    this.faqCategoryId,
    this.answer,
    this.categorySlug,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String question;
  int faqCategoryId;
  String answer;
  String categorySlug;
  DateTime createdAt;
  DateTime updatedAt;

  factory ContactSupportFaqDataModel.fromJson(Map<String, dynamic> json) =>
      ContactSupportFaqDataModel(
        id: json["id"],
        question: json["question"],
        faqCategoryId: json["faq_category_id"],
        answer: json["answer"],
        categorySlug: json["category_slug"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "question": question,
        "faq_category_id": faqCategoryId,
        "answer": answer,
        "category_slug": categorySlug,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
