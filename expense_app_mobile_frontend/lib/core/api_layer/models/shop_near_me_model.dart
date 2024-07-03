// To parse this JSON data, do
//
//     final shopNearMeModel = shopNearMeModelFromMap(jsonString);

import 'dart:convert';

ShopNearMeModel shopNearMeModelFromMap(String str) => ShopNearMeModel.fromMap(json.decode(str));

String shopNearMeModelToMap(ShopNearMeModel data) => json.encode(data.toMap());

class ShopNearMeModel {
    String? status;
    List<Datum>? data;

    ShopNearMeModel({
        this.status,
        this.data,
    });

    factory ShopNearMeModel.fromMap(Map<String, dynamic> json) => ShopNearMeModel(
        status: json["status"],
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "status": status,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
    };
}

class Datum {
    String? id;
    String? name;
    String? address;
    String? latlang;
    String? mobileNumber;
    String? distance;

    Datum({
        this.id,
        this.name,
        this.address,
        this.latlang,
        this.mobileNumber,
        this.distance,
    });

    factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        address: json["address"],
        latlang: json["latlang"],
        mobileNumber: json["mobile_number"],
        distance: json["distance"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "address": address,
        "latlang": latlang,
        "mobile_number": mobileNumber,
        "distance": distance,
    };
}
