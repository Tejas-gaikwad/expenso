// To parse this JSON data, do
//
//     final productsByCategoryModel = productsByCategoryModelFromJson(jsonString);

import 'dart:convert';

ProductsByCategoryModel productsByCategoryModelFromJson(String str) =>
    ProductsByCategoryModel.fromJson(json.decode(str));

String productsByCategoryModelToJson(ProductsByCategoryModel data) =>
    json.encode(data.toJson());

class ProductsByCategoryModel {
  String status;
  String pages;
  String count;
  List<ProductModelFromAllProductServicesModel> data;

  ProductsByCategoryModel({
    required this.status,
    required this.pages,
    required this.count,
    required this.data,
  });

  factory ProductsByCategoryModel.fromJson(Map<String, dynamic> json) =>
      ProductsByCategoryModel(
        status: json["status"],
        pages: json["pages"],
        count: json["count"],
        data: List<ProductModelFromAllProductServicesModel>.from(json["data"]
            .map((x) => ProductModelFromAllProductServicesModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "pages": pages,
        "count": count,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class ProductModelFromAllProductServicesModel {
  final String? product_id;
  final String? product_name;
  final String? product_MRP;
  final String? product_rate;
  final String? product_image;
  final String? prescription_stauts;
  final String? product_sku;
  final String? product_total_views;
  final String? product_mfg_name;
  final String? online_sale_status;

  ProductModelFromAllProductServicesModel({
    this.product_id,
    this.product_name,
    this.product_MRP,
    this.product_rate,
    this.product_image,
    this.prescription_stauts,
    this.product_sku,
    this.product_total_views,
    this.product_mfg_name,
    this.online_sale_status,
  });

  factory ProductModelFromAllProductServicesModel.fromJson(
          Map<String, dynamic> json) =>
      ProductModelFromAllProductServicesModel(
        product_id: json["product_id"],
        product_name: json["product_name"],
        product_MRP: json["product_MRP"],
        product_rate: json["product_rate"],
        product_image: json["product_image"],
        prescription_stauts: json["prescription_stauts"],
        product_total_views: json["product_total_views"],
        product_sku: json["product_mfg_name"],
        product_mfg_name: json["product_mfg_name"],
        online_sale_status: json["online_sale_status"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": product_id,
        "product_name": product_name,
        "product_MRP": product_MRP,
        "product_rate": product_rate,
        "product_image": product_image,
        "prescription_stauts": prescription_stauts,
        "product_total_views": product_total_views,
        "product_sku": product_sku,
        "product_mfg_name": product_mfg_name,
        "online_sale_status": online_sale_status,
      };
}
