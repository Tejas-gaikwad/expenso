// To parse this JSON data, do
//
//     final orderCancelSuccessfullyModel = orderCancelSuccessfullyModelFromJson(jsonString);

import 'dart:convert';

OrderCancelSuccessfullyModel orderCancelSuccessfullyModelFromJson(String str) =>
    OrderCancelSuccessfullyModel.fromJson(json.decode(str));

String orderCancelSuccessfullyModelToJson(OrderCancelSuccessfullyModel data) =>
    json.encode(data.toJson());

class OrderCancelSuccessfullyModel {
  String status;
  String messages;

  OrderCancelSuccessfullyModel({
    required this.status,
    required this.messages,
  });

  factory OrderCancelSuccessfullyModel.fromJson(Map<String, dynamic> json) =>
      OrderCancelSuccessfullyModel(
        status: json["status"],
        messages: json["messages"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "messages": messages,
      };
}
