class ProductListModel {
  final String? status;
  final String? messages;
  final String? pages;
  final String? count;
  final List<ProductData>? data;

  ProductListModel({
    this.status,
    this.messages,
    this.pages,
    this.count,
    this.data,
  });

  factory ProductListModel.fromJson(Map<String, dynamic> json) {
    return ProductListModel(
      status: json['status'] == "True" ? "true" : 'false',
      messages: json['messages'],
      pages: json['pages'],
      count: json['count'],
      data: json['data'] != null
          ? List<ProductData>.from(json['data'].map((x) => ProductData.fromJson(x)))
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status.toString(),
      'messages': messages,
      'pages': pages,
      'count': count,
      'data': data != null
          ? List<dynamic>.from(data!.map((x) => x.toJson()))
          : null,
    };
  }
}

class ProductData {
  final String? productId;
  final String? productName;
  final String? packingType;
  final String? productMRP;
  final String? productRate;
  final String? productImageName;
  final String? productImagePath;
  final String? prescriptionFlag;
  final String? productSKU;
  final String? productViews;
  final String? mfgName;
  final String? isNotForOnlineSale;

  ProductData({
    this.productId,
    this.productName,
    this.packingType,
    this.productMRP,
    this.productRate,
    this.productImageName,
    this.productImagePath,
    this.prescriptionFlag,
    this.productSKU,
    this.productViews,
    this.mfgName,
    this.isNotForOnlineSale,
  });

  factory ProductData.fromJson(Map<String, dynamic> json) {
    return ProductData(
      productId: json['product_id'],
      productName: json['product_name'],
      packingType: json['packing_type'],
      productMRP: json['product_MRP'],
      productRate: json['product_rate'],
      productImageName: json['product_image_name'],
      productImagePath: json['product_image_path'],
      prescriptionFlag: json['PrescriptionFlag'],
      productSKU: json['ProductSKU'],
      productViews: json['ProductViews'],
      mfgName: json['MfgName'],
      isNotForOnlineSale: json['IsNotForOnlineSale'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'product_id': productId,
      'product_name': productName,
      'packing_type': packingType,
      'product_MRP': productMRP,
      'product_rate': productRate,
      'product_image_name': productImageName,
      'product_image_path': productImagePath,
      'PrescriptionFlag': prescriptionFlag,
      'ProductSKU': productSKU,
      'ProductViews': productViews,
      'MfgName': mfgName,
      'IsNotForOnlineSale': isNotForOnlineSale,
    };
  }
}
