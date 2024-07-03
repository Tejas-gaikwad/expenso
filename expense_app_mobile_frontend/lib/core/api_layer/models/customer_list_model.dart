// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class CustomerListModel {
  final String? status;
  final List<CustomerModel>? data;
  final String? messages;

  CustomerListModel({
    this.status,
    this.data,
    this.messages,
  });

  CustomerListModel copyWith({
    String? status,
    List<CustomerModel>? data,
    String? messages,
  }) {
    return CustomerListModel(
      status: status ?? this.status,
      data: data ?? this.data,
      messages: messages ?? this.messages,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'data': data?.map((x) => x.toMap()).toList(),
      'messages': messages,
    };
  }

  factory CustomerListModel.fromMap(Map<String, dynamic> map) {
    return CustomerListModel(
      status: map['status'] != null ? map['status'] as String : null,
      data: map['data'] != null
          ? List<CustomerModel>.from(
              (map['data'] as List<dynamic>).map<CustomerModel?>(
                (x) => CustomerModel?.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      messages: map['messages'] != null ? map['messages'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomerListModel.fromJson(String source) =>
      CustomerListModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'CustomerListModel(status: $status, data: $data, messages: $messages)';

  @override
  bool operator ==(covariant CustomerListModel other) {
    if (identical(this, other)) return true;

    return other.status == status &&
        listEquals(other.data, data) &&
        other.messages == messages;
  }
}

class CustomerModel {
  final String? cust_id;
  final String? cust_name;
  final String? cust_mobile_number;

  CustomerModel({
    this.cust_id,
    this.cust_name,
    this.cust_mobile_number,
  });

  CustomerModel copyWith({
    String? cust_id,
    String? cust_name,
    String? cust_mobile_number,
  }) {
    return CustomerModel(
      cust_id: cust_id ?? this.cust_id,
      cust_name: cust_name ?? this.cust_name,
      cust_mobile_number: cust_mobile_number ?? this.cust_mobile_number,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cust_id': cust_id,
      'cust_name': cust_name,
      'cust_mobile_number': cust_mobile_number,
    };
  }

  factory CustomerModel.fromMap(Map<String, dynamic> map) {
    return CustomerModel(
      cust_id: map['cust_id'] != null ? map['cust_id'] as String : null,
      cust_name: map['cust_name'] != null ? map['cust_name'] as String : null,
      cust_mobile_number: map['cust_mobile_number'] != null
          ? map['cust_mobile_number'] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomerModel.fromJson(String source) =>
      CustomerModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'CustomerModel(cust_id: $cust_id, cust_name: $cust_name, cust_mobile_number: $cust_mobile_number)';

  @override
  bool operator ==(covariant CustomerModel other) {
    if (identical(this, other)) return true;

    return other.cust_id == cust_id &&
        other.cust_name == cust_name &&
        other.cust_mobile_number == cust_mobile_number;
  }
}
