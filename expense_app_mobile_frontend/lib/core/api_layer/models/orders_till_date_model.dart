// To parse this JSON data, do
//
//     final ordersTillDateScreenModel = ordersTillDateScreenModelFromJson(jsonString);

import 'dart:convert';

OrdersTillDateScreenModel ordersTillDateScreenModelFromJson(String str) => OrdersTillDateScreenModel.fromJson(json.decode(str));

String ordersTillDateScreenModelToJson(OrdersTillDateScreenModel data) => json.encode(data.toJson());

class OrdersTillDateScreenModel {
    String status;
    List<Completed> initialised;
    List<Completed> completed;
    List<Completed> decline;
    List<OrderTillDateCustomerModel> data;

    OrdersTillDateScreenModel({
        required this.status,
        required this.initialised,
        required this.completed,
        required this.decline,
        required this.data,
    });

    factory OrdersTillDateScreenModel.fromJson(Map<String, dynamic> json) => OrdersTillDateScreenModel(
        status: json["status"],
        initialised: List<Completed>.from(json["initialised"].map((x) => Completed.fromJson(x))),
        completed: List<Completed>.from(json["completed"].map((x) => Completed.fromJson(x))),
        decline: List<Completed>.from(json["decline"].map((x) => Completed.fromJson(x))),
        data: List<OrderTillDateCustomerModel>.from(json["data"].map((x) => OrderTillDateCustomerModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "initialised": List<dynamic>.from(initialised.map((x) => x.toJson())),
        "completed": List<dynamic>.from(completed.map((x) => x.toJson())),
        "decline": List<dynamic>.from(decline.map((x) => x.toJson())),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Completed {
    String totalOrder;
    String totalAmount;
    String totalComission;

    Completed({
        required this.totalOrder,
        required this.totalAmount,
        required this.totalComission,
    });

    factory Completed.fromJson(Map<String, dynamic> json) => Completed(
        totalOrder: json["total_order"],
        totalAmount: json["total_amount"],
        totalComission: json["total_comission"],
    );

    Map<String, dynamic> toJson() => {
        "total_order": totalOrder,
        "total_amount": totalAmount,
        "total_comission": totalComission,
    };
}

class OrderTillDateCustomerModel {
    String customrtId;
    String customerName;
    String customerMobile;
    String totalOrder;
    String totalAmount;

    OrderTillDateCustomerModel({
        required this.customrtId,
        required this.customerName,
        required this.customerMobile,
        required this.totalOrder,
        required this.totalAmount,
    });

    factory OrderTillDateCustomerModel.fromJson(Map<String, dynamic> json) => OrderTillDateCustomerModel(
        customrtId: json["CustomrtID"],
        customerName: json["CustomerName"],
        customerMobile: json["CustomerMobile"],
        totalOrder: json["total_order"],
        totalAmount: json["total_amount"],
    );

    Map<String, dynamic> toJson() => {
        "CustomrtID": customrtId,
        "CustomerName": customerName,
        "CustomerMobile": customerMobile,
        "total_order": totalOrder,
        "total_amount": totalAmount,
    };
}
