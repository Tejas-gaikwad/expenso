// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'my_customer_model.dart';
import 'product_array_model.dart';
import 'profile_model.dart';

class DashboardModel {
  final String? status;
  final ProfileModel? profile;
  final MyCustomerModel? my_customer;
  final String? my_earning_visible;
  final String? gobp_member_menu;
  final String? total_earning;
  final String? this_month_earning;
  final String? delivery_charges;
  final String? COD_status;
  final String? follup_order_count;
  final String? follup_order_amount;
  final String? missed_follup_order_count;
  final String? missed_follup_order_amount;
  final List<ProductArrayModel>? product_array;

  DashboardModel({
    this.status,
    this.profile,
    this.my_customer,
    this.my_earning_visible,
    this.gobp_member_menu,
    this.total_earning,
    this.this_month_earning,
    this.delivery_charges,
    this.COD_status,
    this.follup_order_count,
    this.follup_order_amount,
    this.missed_follup_order_count,
    this.missed_follup_order_amount,
    this.product_array,
  });

  DashboardModel copyWith({
    String? status,
    ProfileModel? profile,
    MyCustomerModel? myCustomer,
    String? my_earning_visible,
    String? gobp_member_menu,
    String? total_earning,
    String? this_month_earning,
    String? delivery_charges,
    String? COD_status,
    String? follup_order_count,
    String? follup_order_amount,
    String? missed_follup_order_count,
    String? missed_follup_order_amount,
    List<ProductArrayModel>? product_array,
  }) {
    return DashboardModel(
      status: status ?? this.status,
      profile: profile ?? this.profile,
      my_customer: myCustomer ?? this.my_customer,
      my_earning_visible: my_earning_visible ?? this.my_earning_visible,
      gobp_member_menu: gobp_member_menu ?? this.gobp_member_menu,
      total_earning: total_earning ?? this.total_earning,
      this_month_earning: this_month_earning ?? this.this_month_earning,
      delivery_charges: delivery_charges ?? this.delivery_charges,
      COD_status: COD_status ?? this.COD_status,
      follup_order_count: follup_order_count ?? this.follup_order_count,
      follup_order_amount: follup_order_amount ?? this.follup_order_amount,
      missed_follup_order_count:
          missed_follup_order_count ?? this.missed_follup_order_count,
      missed_follup_order_amount:
          missed_follup_order_amount ?? this.missed_follup_order_amount,
      product_array: product_array ?? this.product_array,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'profile': profile?.toMap(),
      'myCustomer': my_customer?.toMap(),
      'my_earning_visible': my_earning_visible,
      'gobp_member_menu': gobp_member_menu,
      'total_earning': total_earning,
      'this_month_earning': this_month_earning,
      'delivery_charges': delivery_charges,
      'COD_status': COD_status,
      'follup_order_count': follup_order_count,
      'follup_order_amount': follup_order_amount,
      'missed_follup_order_count': missed_follup_order_count,
      'missed_follup_order_amount': missed_follup_order_amount,
      'product_array': product_array?.map((x) => x.toMap()).toList(),
    };
  }

  factory DashboardModel.fromMap(Map<String, dynamic> map) {
    return DashboardModel(
      status: map['status'] != null ? map['status'] as String : null,
      profile: map['profile'] != null
          ? ProfileModel.fromMap(map['profile'] as Map<String, dynamic>)
          : null,
      my_customer: map['my_customer'] != null
          ? MyCustomerModel.fromMap(map['my_customer'] as Map<String, dynamic>)
          : null,
      my_earning_visible: map['my_earning_visible'] != null
          ? map['my_earning_visible'] as String
          : null,
      gobp_member_menu: map['gobp_member_menu'] != null
          ? map['gobp_member_menu'] as String
          : null,
      total_earning:
          map['total_earning'] != null ? map['total_earning'] as String : null,
      this_month_earning: map['this_month_earning'] != null
          ? map['this_month_earning'] as String
          : null,
      delivery_charges: map['delivery_charges'] != null
          ? map['delivery_charges'] as String
          : null,
      COD_status:
          map['COD_status'] != null ? map['COD_status'] as String : null,
      follup_order_count: map['follup_order_count'] != null
          ? map['follup_order_count'] as String
          : null,
      follup_order_amount: map['follup_order_amount'] != null
          ? map['follup_order_amount'] as String
          : null,
      missed_follup_order_count: map['missed_follup_order_count'] != null
          ? map['missed_follup_order_count'] as String
          : null,
      missed_follup_order_amount: map['missed_follup_order_amount'] != null
          ? map['missed_follup_order_amount'] as String
          : null,
      product_array: map['product_array'] != null
          ? List<ProductArrayModel>.from(
              (map['product_array'] as List<dynamic>).map<ProductArrayModel?>(
                (x) => ProductArrayModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DashboardModel.fromJson(String source) =>
      DashboardModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DashboardModel(status: $status, profile: $profile, my_customer: $my_customer, my_earning_visible: $my_earning_visible, gobp_member_menu: $gobp_member_menu, total_earning: $total_earning, this_month_earning: $this_month_earning, delivery_charges: $delivery_charges, COD_status: $COD_status, follup_order_count: $follup_order_count, follup_order_amount: $follup_order_amount, missed_follup_order_count: $missed_follup_order_count, missed_follup_order_amount: $missed_follup_order_amount, product_array: $product_array)';
  }

  @override
  bool operator ==(covariant DashboardModel other) {
    if (identical(this, other)) return true;

    return other.status == status &&
        other.profile == profile &&
        other.my_customer == my_customer &&
        other.my_earning_visible == my_earning_visible &&
        other.gobp_member_menu == gobp_member_menu &&
        other.total_earning == total_earning &&
        other.this_month_earning == this_month_earning &&
        other.delivery_charges == delivery_charges &&
        other.COD_status == COD_status &&
        other.follup_order_count == follup_order_count &&
        other.follup_order_amount == follup_order_amount &&
        other.missed_follup_order_count == missed_follup_order_count &&
        other.missed_follup_order_amount == missed_follup_order_amount &&
        listEquals(other.product_array, product_array);
  }

  @override
  int get hashCode {
    return status.hashCode ^
        profile.hashCode ^
        my_customer.hashCode ^
        my_earning_visible.hashCode ^
        gobp_member_menu.hashCode ^
        total_earning.hashCode ^
        this_month_earning.hashCode ^
        delivery_charges.hashCode ^
        COD_status.hashCode ^
        follup_order_count.hashCode ^
        follup_order_amount.hashCode ^
        missed_follup_order_count.hashCode ^
        missed_follup_order_amount.hashCode ^
        product_array.hashCode;
  }
}
