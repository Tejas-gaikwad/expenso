// To parse this JSON data, do
//
//     final addBrandedMedicineModel = addBrandedMedicineModelFromJson(jsonString);

import 'dart:convert';

AddBrandedMedicineModel addBrandedMedicineModelFromJson(String str) =>
    AddBrandedMedicineModel.fromJson(json.decode(str));

String addBrandedMedicineModelToJson(AddBrandedMedicineModel data) =>
    json.encode(data.toJson());

class AddBrandedMedicineModel {
  String status;
  String message;
  String totalSavingAmount;
  String totalSavingPer;
  String totalBrandAmt;
  List<AddedMedicineModel>? data;

  AddBrandedMedicineModel({
    required this.status,
    required this.message,
    required this.totalSavingAmount,
    required this.totalSavingPer,
    required this.totalBrandAmt,
    required this.data,
  });

  AddBrandedMedicineModel copyWith({
    String? status,
    String? totalSavingAmount,
    String? totalSavingPer,
    String? totalBrandAmt,
    List<AddedMedicineModel>? data,
  }) =>
      AddBrandedMedicineModel(
        status: status ?? this.status,
        message: status ?? this.message,
        totalSavingAmount: totalSavingAmount ?? this.totalSavingAmount,
        totalSavingPer: totalSavingPer ?? this.totalSavingPer,
        totalBrandAmt: totalBrandAmt ?? this.totalBrandAmt,
        data: data ?? this.data,
      );

  factory AddBrandedMedicineModel.fromJson(Map<String, dynamic> json) {
    return AddBrandedMedicineModel(
      status: json['status'] ?? "",
      message: json['message'] ?? "",
      totalSavingAmount: json['total_saving_amount'] ?? "0",
      totalSavingPer: json['total_saving_per'] ?? "0",
      totalBrandAmt: json['total_brand_amt'] ?? "0",
      data: json['data'] != null
          ? (json['data'] as List)
              .map((e) => AddedMedicineModel.fromJson(e))
              .toList()
          : [],
    );
  }

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "total_saving_amount": totalSavingAmount,
        "total_saving_per": totalSavingPer,
        "total_brand_amt": totalBrandAmt,
        "data": data != null
            ? List<dynamic>.from(data!.map((x) => x.toJson()))
            : [],
      };
}

class AddedMedicineModel {
  String calcItemId;
  String brandMedicine;
  String brandPrice;
  String genericMedicine;
  String genericPrice;
  String savingAmount;
  String savingPercent;
  String genericCode;
  String packaging;
  String calcItemQty;

  AddedMedicineModel({
    required this.calcItemId,
    required this.brandMedicine,
    required this.brandPrice,
    required this.genericMedicine,
    required this.genericPrice,
    required this.savingAmount,
    required this.savingPercent,
    required this.genericCode,
    required this.packaging,
    required this.calcItemQty,
  });

  AddedMedicineModel copyWith({
    String? calcItemId,
    String? brandMedicine,
    String? brandPrice,
    String? genericMedicine,
    String? genericPrice,
    String? savingAmount,
    String? savingPercent,
    String? genericCode,
    String? packaging,
    String? calcItemQty,
  }) =>
      AddedMedicineModel(
        calcItemId: calcItemId ?? this.calcItemId,
        brandMedicine: brandMedicine ?? this.brandMedicine,
        brandPrice: brandPrice ?? this.brandPrice,
        genericMedicine: genericMedicine ?? this.genericMedicine,
        genericPrice: genericPrice ?? this.genericPrice,
        savingAmount: savingAmount ?? this.savingAmount,
        savingPercent: savingPercent ?? this.savingPercent,
        genericCode: genericCode ?? this.genericCode,
        packaging: packaging ?? this.packaging,
        calcItemQty: calcItemQty ?? this.calcItemQty,
      );

  factory AddedMedicineModel.fromJson(Map<String, dynamic> json) =>
      AddedMedicineModel(
        calcItemId: json["CalcItemID"],
        brandMedicine: json["BrandMedicine"],
        brandPrice: json["BrandPrice"],
        genericMedicine: json["GenericMedicine"],
        genericPrice: json["GenericPrice"],
        savingAmount: json["SavingAmount"],
        savingPercent: json["SavingPercent"],
        genericCode: json["GenericCode"],
        packaging: json["Packaging"],
        calcItemQty: json["CalcItemQty"],
      );

  Map<String, dynamic> toJson() => {
        "CalcItemID": calcItemId,
        "BrandMedicine": brandMedicine,
        "BrandPrice": brandPrice,
        "GenericMedicine": genericMedicine,
        "GenericPrice": genericPrice,
        "SavingAmount": savingAmount,
        "SavingPercent": savingPercent,
        "GenericCode": genericCode,
        "Packaging": packaging,
        "CalcItemQty": calcItemQty,
      };
}
