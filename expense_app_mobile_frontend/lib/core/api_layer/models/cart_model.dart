import 'dart:convert';

class CartItemModel {
  final String productId;
  final String productName;

  final String productQuantity;
  final String productImage;

  CartItemModel({
    required this.productName,
    required this.productId,
    required this.productImage,
    required this.productQuantity,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      productId: json['productId'] ?? "",
      productName: json['productName'] ?? "",
      productImage: json['productImage'] ?? "",
      productQuantity: json['productQuantity'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'productName': productName,
      'productImage': productImage,
      'productQuantity': productQuantity,
    };
  }
}
