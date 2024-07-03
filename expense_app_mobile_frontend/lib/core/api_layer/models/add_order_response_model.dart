// To parse this JSON data, do
//
//     final addOrderResponseModel = addOrderResponseModelFromJson(jsonString);

import 'dart:convert';

AddOrderResponseModel addOrderResponseModelFromJson(String str) =>
    AddOrderResponseModel.fromJson(json.decode(str));

String addOrderResponseModelToJson(AddOrderResponseModel data) =>
    json.encode(data.toJson());

class AddOrderResponseModel {
  String? status;
  String? messages;
  String? orderId;

  AddOrderResponseModel({
    this.status,
    this.messages,
    this.orderId,
  });

  factory AddOrderResponseModel.fromJson(Map<String, dynamic> json) =>
      AddOrderResponseModel(
        status: json["status"] ?? "",
        messages: json["messages"] ?? "",
        orderId: json["order_id"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "messages": messages,
        "order_id": orderId.toString(),
      };
}
