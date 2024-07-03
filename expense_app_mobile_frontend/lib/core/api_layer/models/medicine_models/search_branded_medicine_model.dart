// To parse this JSON data, do
//
//     final searchBrandedMedicineModel = searchBrandedMedicineModelFromJson(jsonString);

import 'dart:convert';

SearchBrandedMedicineModel searchBrandedMedicineModelFromJson(String str) =>
    SearchBrandedMedicineModel.fromJson(json.decode(str));

String searchBrandedMedicineModelToJson(SearchBrandedMedicineModel data) =>
    json.encode(data.toJson());

class SearchBrandedMedicineModel {
  String status;
  List<MedicineModel> data;

  SearchBrandedMedicineModel({
    required this.status,
    required this.data,
  });

  SearchBrandedMedicineModel copyWith({
    String? status,
    List<MedicineModel>? data,
  }) =>
      SearchBrandedMedicineModel(
        status: status ?? this.status,
        data: data ?? this.data,
      );

  factory SearchBrandedMedicineModel.fromJson(Map<String, dynamic> json) =>
      SearchBrandedMedicineModel(
        status: json["status"],
        data: List<MedicineModel>.from(
            json["data"].map((x) => MedicineModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class MedicineModel {
  String medicineRowId;
  String contentName;
  String brandName;
  String companyName;
  String packaging;
  String priceBrand;
  String genericCode;
  String priceGeneric;

  MedicineModel({
    required this.medicineRowId,
    required this.contentName,
    required this.brandName,
    required this.companyName,
    required this.packaging,
    required this.priceBrand,
    required this.genericCode,
    required this.priceGeneric,
  });

  MedicineModel copyWith({
    String? medicineRowId,
    String? contentName,
    String? brandName,
    String? companyName,
    String? packaging,
    String? priceBrand,
    String? genericCode,
    String? priceGeneric,
  }) =>
      MedicineModel(
        medicineRowId: medicineRowId ?? this.medicineRowId,
        contentName: contentName ?? this.contentName,
        brandName: brandName ?? this.brandName,
        companyName: companyName ?? this.companyName,
        packaging: packaging ?? this.packaging,
        priceBrand: priceBrand ?? this.priceBrand,
        genericCode: genericCode ?? this.genericCode,
        priceGeneric: priceGeneric ?? this.priceGeneric,
      );

  factory MedicineModel.fromJson(Map<String, dynamic> json) => MedicineModel(
        medicineRowId: json["MedicineRowID"],
        contentName: json["ContentName"],
        brandName: json["BrandName"],
        companyName: json["CompanyName"],
        packaging: json["Packaging"],
        priceBrand: json["PriceBrand"],
        genericCode: json["GenericCode"],
        priceGeneric: json["PriceGeneric"],
      );

  Map<String, dynamic> toJson() => {
        "MedicineRowID": medicineRowId,
        "ContentName": contentName,
        "BrandName": brandName,
        "CompanyName": companyName,
        "Packaging": packaging,
        "PriceBrand": priceBrand,
        "GenericCode": genericCode,
        "PriceGeneric": priceGeneric,
      };
}
