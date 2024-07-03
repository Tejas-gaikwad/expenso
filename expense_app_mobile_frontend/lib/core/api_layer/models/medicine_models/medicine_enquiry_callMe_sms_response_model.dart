// To parse this JSON data, do
//
//     final brandedMedicineEnquiryModel = brandedMedicineEnquiryModelFromJson(jsonString);

import 'dart:convert';

BrandedMedicineEnquiryModel brandedMedicineEnquiryModelFromJson(String str) =>
    BrandedMedicineEnquiryModel.fromJson(json.decode(str));

String brandedMedicineEnquiryModelToJson(BrandedMedicineEnquiryModel data) =>
    json.encode(data.toJson());

class BrandedMedicineEnquiryModel {
  String? status;
  String? message;
  String? messages;
  String? data;

  BrandedMedicineEnquiryModel({
    required this.status,
    this.message,
    this.messages,
    this.data,
  });

  BrandedMedicineEnquiryModel copyWith({
    String? status,
    String? message,
    String? messages,
    String? data,
  }) =>
      BrandedMedicineEnquiryModel(
        status: status ?? this.status,
        message: message ?? this.message,
        messages: messages ?? this.messages,
        data: data ?? this.data,
      );

  factory BrandedMedicineEnquiryModel.fromJson(Map<String, dynamic> json) =>
      BrandedMedicineEnquiryModel(
        status: json["status"],
        message: json["message"] ?? "Error, Something went wrong.",
        messages: json["messages"] ?? "Error, Something went wrong.",
        data: json["data"] ?? "Error, Something went wrong.",
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "messages": messages,
        "data": data,
      };
}
