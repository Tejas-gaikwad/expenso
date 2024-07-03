// To parse this JSON data, do
//
//     final gobpMemberModel = gobpMemberModelFromJson(jsonString);

import 'dart:convert';

GobpMemberModel gobpMemberModelFromJson(String str) =>
    GobpMemberModel.fromJson(json.decode(str));

String gobpMemberModelToJson(GobpMemberModel data) =>
    json.encode(data.toJson());

class GobpMemberModel {
  String status;
  String messages;
  List<GobpMemmber> data;

  GobpMemberModel({
    required this.status,
    required this.messages,
    required this.data,
  });

  factory GobpMemberModel.fromJson(Map<String, dynamic> json) =>
      GobpMemberModel(
        status: json["status"] ?? "",
        messages: json["messages"] ?? "",
        data: List<GobpMemmber>.from(
          json["data"].map((x) => GobpMemmber.fromJson(x)),
        ),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "messages": messages,
        "data": List<dynamic>.from(data.map((x) => x.toJson())) ?? [],
      };
}

class GobpMemmber {
  String obpId;
  String obpName;
  String obpMobileNumber;
  String obpWhatsappNumber;
  String totalCustCount;
  String currMonthCustCount;
  String lastMonthCustCount;
  String totalComission;
  String currMonthComission;
  String lastMonthComission;

  GobpMemmber({
    required this.obpId,
    required this.obpName,
    required this.obpMobileNumber,
    required this.obpWhatsappNumber,
    required this.totalCustCount,
    required this.currMonthCustCount,
    required this.lastMonthCustCount,
    required this.totalComission,
    required this.currMonthComission,
    required this.lastMonthComission,
  });

  factory GobpMemmber.fromJson(Map<String, dynamic> json) => GobpMemmber(
        obpId: json["obp_id"] ?? "",
        obpName: json["obp_name"] ?? "",
        obpMobileNumber: json["obp_mobile_number"] ?? "",
        obpWhatsappNumber: json["obp_whatsapp_number"] ?? "",
        totalCustCount: json["total_cust_count"] ?? "",
        currMonthCustCount: json["curr_month_cust_count"] ?? "",
        lastMonthCustCount: json["last_month_cust_count"] ?? "",
        totalComission: json["total_comission"] ?? "",
        currMonthComission: json["curr_month_comission"] ?? "",
        lastMonthComission: json["last_month_comission"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "obp_id": obpId,
        "obp_name": obpName,
        "obp_mobile_number": obpMobileNumber,
        "obp_whatsapp_number": obpWhatsappNumber,
        "total_cust_count": totalCustCount,
        "curr_month_cust_count": currMonthCustCount,
        "last_month_cust_count": lastMonthCustCount,
        "total_comission": totalComission,
        "curr_month_comission": currMonthComission,
        "last_month_comission": lastMonthComission,
      };
}
