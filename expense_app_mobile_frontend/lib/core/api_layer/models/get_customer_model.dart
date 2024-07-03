// To parse this JSON data, do
//
//     final getCustomerOrderModel = getCustomerOrderModelFromJson(jsonString);

import 'dart:convert';

GetCustomerOrderModel getCustomerOrderModelFromJson(String str) =>
    GetCustomerOrderModel.fromJson(json.decode(str));

String getCustomerOrderModelToJson(GetCustomerOrderModel data) =>
    json.encode(data.toJson());

class GetCustomerOrderModel {
  String? status;
  List<OrderModelFromGetCustomerModel>? approved;
  List<OrderModelFromGetCustomerModel>? notApproved;
  List<OrderModelFromGetCustomerModel>? completed;
  List<OrderModelFromGetCustomerModel>? denied;

  GetCustomerOrderModel({
    required this.status,
    required this.approved,
    required this.notApproved,
    required this.completed,
    required this.denied,
  });

  factory GetCustomerOrderModel.fromJson(json) => GetCustomerOrderModel(
        status: json["status"],
        approved: List<OrderModelFromGetCustomerModel>.from(json["approved"]
            .map((x) => OrderModelFromGetCustomerModel.fromJson(x))),
        notApproved: json["not_approved"] != null
            ? List<OrderModelFromGetCustomerModel>.from(json["not_approved"]
                .map((x) => OrderModelFromGetCustomerModel.fromJson(x)))
            : [],
        completed: json["completed"] != null
            ? List<OrderModelFromGetCustomerModel>.from(json["completed"]
                .map((x) => OrderModelFromGetCustomerModel.fromJson(x)))
            : [],
        denied: json["denied"] != null
            ? List<OrderModelFromGetCustomerModel>.from(json["denied"]
                .map((x) => OrderModelFromGetCustomerModel.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "approved": List<OrderModelFromGetCustomerModel>.from(
          approved?.map((x) => x.toJson()) ?? [],
        ),
        "not_approved": List<OrderModelFromGetCustomerModel>.from(
          notApproved?.map((x) => x.toJson()) ?? [],
        ),
        "completed": List<OrderModelFromGetCustomerModel>.from(
          completed?.map((x) => x.toJson()) ?? [],
        ),
        "denied": List<OrderModelFromGetCustomerModel>.from(
          denied?.map((x) => x.toJson()) ?? [],
        ),
      };
}

class OrderModelFromGetCustomerModel {
  String? orderId;
  String? orderStatus;
  String? orderAmount;
  String? refundStatus;
  String? orderContains;

  OrderModelFromGetCustomerModel({
    required this.orderId,
    required this.orderStatus,
    required this.orderAmount,
    required this.refundStatus,
    required this.orderContains,
  });

  factory OrderModelFromGetCustomerModel.fromJson(Map<String, dynamic> json) {
    return OrderModelFromGetCustomerModel(
      orderId: json["order_id"].toString(),
      orderStatus: json["order_status"].toString(),
      orderAmount: json["order_amount"].toString(),
      refundStatus: json["refund_status"].toString(),
      orderContains: json["order_contains"].toString(),
    );
  }

  Map<String, dynamic> toJson() => {
        "order_id": orderId,
        "order_status": orderStatus,
        "order_amount": orderAmount,
        "refund_status": refundStatus,
        "order_contains": orderContains,
      };
}
