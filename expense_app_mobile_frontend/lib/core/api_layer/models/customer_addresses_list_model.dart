// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class CustomerAddressListModel {
  final String? status;
  final List<CustomerAddressModel>? data;
  final String? messages;

  CustomerAddressListModel({
    this.status,
    this.data,
    this.messages,
  });

  CustomerAddressListModel copyWith({
    String? status,
    List<CustomerAddressModel>? data,
    String? messages,
  }) {
    return CustomerAddressListModel(
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

  factory CustomerAddressListModel.fromMap(Map<String, dynamic> map) {
    return CustomerAddressListModel(
      status: map['status'] != null ? map['status'] as String : null,
      data: map['data'] != null
          ? List<CustomerAddressModel>.from(
              (map['data'] as List<dynamic>).map<CustomerAddressModel?>(
                (x) => CustomerAddressModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      messages: map['messages'] != null ? map['messages'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomerAddressListModel.fromJson(String source) =>
      CustomerAddressListModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'CustomerAddressListModel(status: $status, data: $data, messages: $messages)';

  @override
  bool operator ==(covariant CustomerAddressListModel other) {
    if (identical(this, other)) return true;

    return other.status == status &&
        listEquals(other.data, data) &&
        other.messages == messages;
  }

  @override
  int get hashCode => status.hashCode ^ data.hashCode ^ messages.hashCode;
}

class CustomerAddressModel {
  final String? address_id;
  final String? address_title;
  final String? address_detail;

  CustomerAddressModel({
    this.address_id,
    this.address_title,
    this.address_detail,
  });

  CustomerAddressModel copyWith({
    String? address_id,
    String? address_title,
    String? address_detail,
  }) {
    return CustomerAddressModel(
      address_id: address_id ?? this.address_id,
      address_title: address_title ?? this.address_title,
      address_detail: address_detail ?? this.address_detail,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'address_id': address_id,
      'address_title': address_title,
      'address_detail': address_detail,
    };
  }

  factory CustomerAddressModel.fromMap(Map<String, dynamic> map) {
    return CustomerAddressModel(
      address_id:
          map['address_id'] != null ? map['address_id'] as String : null,
      address_title:
          map['address_title'] != null ? map['address_title'] as String : null,
      address_detail: map['address_detail'] != null
          ? map['address_detail'] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomerAddressModel.fromJson(String source) =>
      CustomerAddressModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'CustomerAddressModel(address_id: $address_id, address_title: $address_title, address_detail: $address_detail)';

  @override
  bool operator ==(covariant CustomerAddressModel other) {
    if (identical(this, other)) return true;

    return other.address_id == address_id &&
        other.address_title == address_title &&
        other.address_detail == address_detail;
  }

  @override
  int get hashCode =>
      address_id.hashCode ^ address_title.hashCode ^ address_detail.hashCode;
}
