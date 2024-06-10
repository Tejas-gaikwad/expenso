import 'dart:convert';

class MyExpenseModel {
  String? id;
  int? type;
  double? amount;
  DateTime? dateTime;
  String? note;
  String? category;
  String? accountType;

  MyExpenseModel({
    this.id,
    this.type,
    this.amount,
    this.dateTime,
    this.note,
    this.category,
    this.accountType,
  });

  factory MyExpenseModel.fromJson(Map<String, dynamic> json) {
    return MyExpenseModel(
      id: json['id'] ?? "",
      type: json['type'] ,
      amount: double.parse(json['amount'].toString()),
      dateTime:   DateTime.parse(json['dateTime']) ,
      note: json['note'] ?? "",
      category: json['category'] ?? "",
      accountType: json['account_type'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'amount': amount,
      'dateTime':  dateTime?.toIso8601String(),
      'note': note,
      'category': category,
      'account_type': accountType,
    };
  }

  static List<MyExpenseModel> decode(String expenses) =>
      (json.decode(expenses) as List<dynamic>)
          .map<MyExpenseModel>((item) => MyExpenseModel.fromJson(item))
          .toList();

  static String encode(List<MyExpenseModel> expenses) => json.encode(
        expenses
            .map<Map<String, dynamic>>((expense) => expense.toJson())
            .toList(),
      );
}
