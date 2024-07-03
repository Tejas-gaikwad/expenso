// To parse this JSON data, do
//
//     final deleteBrandedMedicineModel = deleteBrandedMedicineModelFromJson(jsonString);

import 'dart:convert';

DeleteBrandedMedicineModel deleteBrandedMedicineModelFromJson(String str) => DeleteBrandedMedicineModel.fromJson(json.decode(str));

String deleteBrandedMedicineModelToJson(DeleteBrandedMedicineModel data) => json.encode(data.toJson());

class DeleteBrandedMedicineModel {
    String status;
    String totalSavingAmount;
    String totalSavingPer;
    String totalBrandAmt;
    List<DeletedMedicineModel> data;

    DeleteBrandedMedicineModel({
        required this.status,
        required this.totalSavingAmount,
        required this.totalSavingPer,
        required this.totalBrandAmt,
        required this.data,
    });

    DeleteBrandedMedicineModel copyWith({
        String? status,
        String? totalSavingAmount,
        String? totalSavingPer,
        String? totalBrandAmt,
        List<DeletedMedicineModel>? data,
    }) => 
        DeleteBrandedMedicineModel(
            status: status ?? this.status,
            totalSavingAmount: totalSavingAmount ?? this.totalSavingAmount,
            totalSavingPer: totalSavingPer ?? this.totalSavingPer,
            totalBrandAmt: totalBrandAmt ?? this.totalBrandAmt,
            data: data ?? this.data,
        );

    factory DeleteBrandedMedicineModel.fromJson(Map<String, dynamic> json) => DeleteBrandedMedicineModel(
        status: json["status"],
        totalSavingAmount: json["total_saving_amount"],
        totalSavingPer: json["total_saving_per"],
        totalBrandAmt: json["total_brand_amt"],
        data: List<DeletedMedicineModel>.from(json["data"].map((x) => DeletedMedicineModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "total_saving_amount": totalSavingAmount,
        "total_saving_per": totalSavingPer,
        "total_brand_amt": totalBrandAmt,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class DeletedMedicineModel {
    String calcItemId;
    String fkCalcId;
    String brandMedicine;
    String brandPrice;
    String genericMedicine;
    String genericPrice;
    String savingAmount;
    String savingPercent;
    String genericCode;
    String packaging;

    DeletedMedicineModel({
        required this.calcItemId,
        required this.fkCalcId,
        required this.brandMedicine,
        required this.brandPrice,
        required this.genericMedicine,
        required this.genericPrice,
        required this.savingAmount,
        required this.savingPercent,
        required this.genericCode,
        required this.packaging,
    });

    DeletedMedicineModel copyWith({
        String? calcItemId,
        String? fkCalcId,
        String? brandMedicine,
        String? brandPrice,
        String? genericMedicine,
        String? genericPrice,
        String? savingAmount,
        String? savingPercent,
        String? genericCode,
        String? packaging,
    }) => 
        DeletedMedicineModel(
            calcItemId: calcItemId ?? this.calcItemId,
            fkCalcId: fkCalcId ?? this.fkCalcId,
            brandMedicine: brandMedicine ?? this.brandMedicine,
            brandPrice: brandPrice ?? this.brandPrice,
            genericMedicine: genericMedicine ?? this.genericMedicine,
            genericPrice: genericPrice ?? this.genericPrice,
            savingAmount: savingAmount ?? this.savingAmount,
            savingPercent: savingPercent ?? this.savingPercent,
            genericCode: genericCode ?? this.genericCode,
            packaging: packaging ?? this.packaging,
        );

    factory DeletedMedicineModel.fromJson(Map<String, dynamic> json) => DeletedMedicineModel(
        calcItemId: json["CalcItemID"],
        fkCalcId: json["FK_CalcID"],
        brandMedicine: json["BrandMedicine"],
        brandPrice: json["BrandPrice"],
        genericMedicine: json["GenericMedicine"],
        genericPrice: json["GenericPrice"],
        savingAmount: json["SavingAmount"],
        savingPercent: json["SavingPercent"],
        genericCode: json["GenericCode"],
        packaging: json["Packaging"],
    );

    Map<String, dynamic> toJson() => {
        "CalcItemID": calcItemId,
        "FK_CalcID": fkCalcId,
        "BrandMedicine": brandMedicine,
        "BrandPrice": brandPrice,
        "GenericMedicine": genericMedicine,
        "GenericPrice": genericPrice,
        "SavingAmount": savingAmount,
        "SavingPercent": savingPercent,
        "GenericCode": genericCode,
        "Packaging": packaging,
    };
}
