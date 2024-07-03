// To parse this JSON data, do
//
//     final followUpCustomerModel = followUpCustomerModelFromMap(jsonString);

import 'dart:convert';

FollowUpCustomerModel followUpCustomerModelFromMap(String str) => FollowUpCustomerModel.fromMap(json.decode(str));

String followUpCustomerModelToMap(FollowUpCustomerModel data) => json.encode(data.toMap());

class FollowUpCustomerModel {
    String? status;
    List<CustomerResModel>? data;

    FollowUpCustomerModel({
        this.status,
        this.data,
    });

    factory FollowUpCustomerModel.fromMap(Map<String, dynamic> json) => FollowUpCustomerModel(
        status: json["status"],
        data: json["data"] == null ? [] : List<CustomerResModel>.from(json["data"]!.map((x) => CustomerResModel.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "status": status,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
    };
}

class CustomerResModel {
    String? customerId;
    String? customerName;
    String? customerMobileNumber;
    String? orderAmount;
    String? orderId;
    String? daysPass;
    String? gobpComission;

    CustomerResModel({
        this.customerId,
        this.customerName,
        this.customerMobileNumber,
        this.orderAmount,
        this.orderId,
        this.daysPass,
        this.gobpComission,
    });

    factory CustomerResModel.fromMap(Map<String, dynamic> json) => CustomerResModel(
        customerId: json["customer_id"],
        customerName: json["customer_name"],
        customerMobileNumber: json["customer_mobile_number"],
        orderAmount: json["order_amount"],
        orderId: json["order_id"],
        daysPass: json["days_pass"],
        gobpComission: json["gobp_comission"],
    );

    Map<String, dynamic> toMap() => {
        "customer_id": customerId,
        "customer_name": customerName,
        "customer_mobile_number": customerMobileNumber,
        "order_amount": orderAmount,
        "order_id": orderId,
        "days_pass": daysPass,
        "gobp_comission": gobpComission,
    };
}
