// To parse this JSON data, do
//
//     final getOrderDetailsResponseModel = getOrderDetailsResponseModelFromJson(jsonString);

import 'dart:convert';

GetOrderDetailsResponseModel getOrderDetailsResponseModelFromJson(String str) =>
    GetOrderDetailsResponseModel.fromJson(json.decode(str));

String getOrderDetailsResponseModelToJson(GetOrderDetailsResponseModel data) =>
    json.encode(data.toJson());

class GetOrderDetailsResponseModel {
  String? status;
  List<OrderSummary>? orderSummary;
  List<ProductDetail>? productDetails;
  List<dynamic>? prescription;

  GetOrderDetailsResponseModel({
    required this.status,
    required this.orderSummary,
    required this.productDetails,
    required this.prescription,
  });

  factory GetOrderDetailsResponseModel.fromJson(Map<String, dynamic> json) =>
      GetOrderDetailsResponseModel(
        status: json["status"] ?? "",
        orderSummary: List<OrderSummary>.from(
                json["order_summary"].map((x) => OrderSummary.fromJson(x))) ??
            [],
        productDetails: List<ProductDetail>.from(json["product_details"]
                .map((x) => ProductDetail.fromJson(x))) ??
            [],
        prescription:
            List<dynamic>.from(json["prescription"].map((x) => x)) ?? [],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "order_summary":
            List<dynamic>.from(orderSummary!.map((x) => x.toJson())),
        "product_details":
            List<dynamic>.from(productDetails!.map((x) => x.toJson())),
        "prescription": List<dynamic>.from(prescription!.map((x) => x)),
      };
}

class OrderSummary {
  String? orderId;
  DateTime? orderDate;
  String? orderAmount;
  dynamic orderShipName;
  String? orderPayMode;
  String? orderPayStatus;
  String? orderStatus;
  String? orderNote;
  dynamic estimatedDeliveryDate;
  String? orderPaymentTxnId;
  dynamic orderTrackingNo;
  String? addressName;
  String? addressFull;
  String? addressCity;
  String? addressState;
  String? addressPincode;
  String? addressCountry;
  String? customerName;
  String? customerMobile;
  String? customerEmail;
  String? orderPaymentText;

  OrderSummary({
    required this.orderId,
    required this.orderDate,
    required this.orderAmount,
    required this.orderShipName,
    required this.orderPayMode,
    required this.orderPayStatus,
    required this.orderStatus,
    required this.orderNote,
    required this.estimatedDeliveryDate,
    required this.orderPaymentTxnId,
    required this.orderTrackingNo,
    required this.addressName,
    required this.addressFull,
    required this.addressCity,
    required this.addressState,
    required this.addressPincode,
    required this.addressCountry,
    required this.customerName,
    required this.customerMobile,
    required this.customerEmail,
    required this.orderPaymentText,
  });

  factory OrderSummary.fromJson(Map<String, dynamic> json) => OrderSummary(
        orderId: json["OrderID"] ?? "",
        orderDate: DateTime.parse(json["OrderDate"]),
        orderAmount: json["OrderAmount"] ?? "",
        orderShipName: json["OrderShipName"] ?? "",
        orderPayMode: json["OrderPayMode"] ?? "",
        orderPayStatus: json["OrderPayStatus"] ?? "",
        orderStatus: json["OrderStatus"] ?? "",
        orderNote: json["OrderNote"] ?? "",
        estimatedDeliveryDate: json["EstimatedDeliveryDate"] ?? "",
        orderPaymentTxnId: json["OrderPaymentTxnId"] ?? "",
        orderTrackingNo: json["OrderTrackingNo"] ?? "",
        addressName: json["AddressName"] ?? "",
        addressFull: json["AddressFull"] ?? "",
        addressCity: json["AddressCity"] ?? "",
        addressState: json["AddressState"] ?? "",
        addressPincode: json["AddressPincode"] ?? "",
        addressCountry: json["AddressCountry"] ?? "",
        customerName: json["CustomerName"] ?? "",
        customerMobile: json["CustomerMobile"] ?? "",
        customerEmail: json["CustomerEmail"] ?? "",
        orderPaymentText: json["order_payment_text"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "OrderID": orderId,
        "OrderDate": orderDate?.toIso8601String(),
        "OrderAmount": orderAmount,
        "OrderShipName": orderShipName,
        "OrderPayMode": orderPayMode,
        "OrderPayStatus": orderPayStatus,
        "OrderStatus": orderStatus,
        "OrderNote": orderNote,
        "EstimatedDeliveryDate": estimatedDeliveryDate,
        "OrderPaymentTxnId": orderPaymentTxnId,
        "OrderTrackingNo": orderTrackingNo,
        "AddressName": addressName,
        "AddressFull": addressFull,
        "AddressCity": addressCity,
        "AddressState": addressState,
        "AddressPincode": addressPincode,
        "AddressCountry": addressCountry,
        "CustomerName": customerName,
        "CustomerMobile": customerMobile,
        "CustomerEmail": customerEmail,
        "order_payment_text": orderPaymentText,
      };
}

class ProductDetail {
  String? productId;
  String? productSku;
  String? productName;
  dynamic? productContent;
  String? packagingType;
  String? productPhoto;
  dynamic? productEntryCode;
  String? ordDetailQty;
  String? ordDetailPrice;
  String? ordDetailAmount;
  dynamic? taxPercent;
  String? taxLessAmount;
  String? productImagePath;

  ProductDetail({
    required this.productId,
    required this.productSku,
    required this.productName,
    required this.productContent,
    required this.packagingType,
    required this.productPhoto,
    required this.productEntryCode,
    required this.ordDetailQty,
    required this.ordDetailPrice,
    required this.ordDetailAmount,
    required this.taxPercent,
    required this.taxLessAmount,
    required this.productImagePath,
  });

  factory ProductDetail.fromJson(Map<String, dynamic> json) => ProductDetail(
        productId: json["ProductID"] ?? "",
        productSku: json["ProductSKU"] ?? "",
        productName: json["ProductName"] ?? "",
        productContent: json["ProductContent"] ?? "",
        packagingType: json["PackagingType"] ?? "",
        productPhoto: json["ProductPhoto"] ?? "",
        productEntryCode: json["ProductEntryCode"] ?? "",
        ordDetailQty: json["OrdDetailQTY"] ?? "",
        ordDetailPrice: json["OrdDetailPrice"] ?? "",
        ordDetailAmount: json["OrdDetailAmount"] ?? "",
        taxPercent: json["TaxPercent"] ?? "",
        taxLessAmount: json["TaxLessAmount"] ?? "",
        productImagePath: json["product_image_path"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "ProductID": productId,
        "ProductSKU": productSku,
        "ProductName": productName,
        "ProductContent": productContent,
        "PackagingType": packagingType,
        "ProductPhoto": productPhoto,
        "ProductEntryCode": productEntryCode,
        "OrdDetailQTY": ordDetailQty,
        "OrdDetailPrice": ordDetailPrice,
        "OrdDetailAmount": ordDetailAmount,
        "TaxPercent": taxPercent,
        "TaxLessAmount": taxLessAmount,
        "product_image_path": productImagePath,
      };
}
