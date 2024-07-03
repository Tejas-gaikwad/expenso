// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class ProductArrayModel {
  final String id;
  final String name;
  final List<ProductModel>? list;

  ProductArrayModel(
    this.id,
    this.name,
    this.list,
  );

  ProductArrayModel copyWith({
    String? id,
    String? name,
    List<ProductModel>? list,
  }) {
    return ProductArrayModel(
      id ?? this.id,
      name ?? this.name,
      list ?? this.list,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'list': list?.map((x) => x.toMap()).toList(),
    };
  }

  factory ProductArrayModel.fromMap(Map<String, dynamic> map) {
    return ProductArrayModel(
      map['id'] as String,
      map['name'] as String,
      map['list'] != null
          ? List<ProductModel>.from(
              (map['list'] as List<dynamic>).map<ProductModel?>(
                (x) => ProductModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductArrayModel.fromJson(String source) =>
      ProductArrayModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ProductArrayModel(id: $id, name: $name, list: $list)';

  @override
  bool operator ==(covariant ProductArrayModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name && listEquals(other.list, list);
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ list.hashCode;
}

class ProductModel {
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

  ProductModel(
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
  );

  ProductModel copyWith({
    String? product_id,
    String? product_name,
    String? product_MRP,
    String? product_rate,
    String? product_image,
    String? prescription_stauts,
    String? product_sku,
    String? product_total_views,
    String? product_mfg_name,
    String? online_sale_status,
  }) {
    return ProductModel(
      product_id ?? this.product_id,
      product_name ?? this.product_name,
      product_MRP ?? this.product_MRP,
      product_rate ?? this.product_rate,
      product_image ?? this.product_image,
      prescription_stauts ?? this.prescription_stauts,
      product_sku ?? this.product_sku,
      product_total_views ?? this.product_total_views,
      product_mfg_name ?? this.product_mfg_name,
      online_sale_status ?? this.online_sale_status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'product_id': product_id,
      'product_name': product_name,
      'product_MRP': product_MRP,
      'product_rate': product_rate,
      'product_image': product_image,
      'prescription_stauts': prescription_stauts,
      'product_sku': product_sku,
      'product_total_views': product_total_views,
      'product_mfg_name': product_mfg_name,
      'online_sale_status': online_sale_status,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      map['product_id'] != null ? map['product_id'] as String : null,
      map['product_name'] != null ? map['product_name'] as String : null,
      map['product_MRP'] != null ? map['product_MRP'] as String : null,
      map['product_rate'] != null ? map['product_rate'] as String : null,
      map['product_image'] != null ? map['product_image'] as String : null,
      map['online_sale_status'] != null
          ? map['online_sale_status'] as String
          : null,
      map['product_sku'] != null ? map['product_sku'] as String : null,
      map['product_total_views'] != null
          ? map['product_total_views'] as String
          : null,
      map['product_mfg_name'] != null
          ? map['product_mfg_name'] as String
          : null,
      map['product_sku'] != null ? map['product_sku'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductModel(product_id: $product_id, product_name: $product_name, product_MRP: $product_MRP, product_rate: $product_rate, product_image: $product_image)';
  }
}
