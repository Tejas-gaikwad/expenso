// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class MyCustomerModel {
  final String? latest_cust_join_date;
  final String? total_customer;
  final String? this_month_customer;
  final String? active_customer;

  MyCustomerModel({
    this.latest_cust_join_date,
    this.total_customer,
    this.this_month_customer,
    this.active_customer,
  });

  MyCustomerModel copyWith({
    String? latest_cust_join_date,
    String? total_customer,
    String? this_month_customer,
    String? active_customer,
  }) {
    return MyCustomerModel(
      latest_cust_join_date:
          latest_cust_join_date ?? this.latest_cust_join_date,
      total_customer: total_customer ?? this.total_customer,
      this_month_customer: this_month_customer ?? this.this_month_customer,
      active_customer: active_customer ?? this.active_customer,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'latest_cust_join_date': latest_cust_join_date,
      'total_customer': total_customer,
      'this_month_customer': this_month_customer,
      'active_customer': active_customer,
    };
  }

  factory MyCustomerModel.fromMap(Map<String, dynamic> map) {
    return MyCustomerModel(
      latest_cust_join_date: map['latest_cust_join_date'] != null
          ? map['latest_cust_join_date'] as String
          : null,
      total_customer: map['total_customer'] != null
          ? map['total_customer'] as String
          : null,
      this_month_customer: map['this_month_customer'] != null
          ? map['this_month_customer'] as String
          : null,
      active_customer: map['active_customer'] != null
          ? map['active_customer'] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MyCustomerModel.fromJson(String source) =>
      MyCustomerModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MyCustomer(latest_cust_join_date: $latest_cust_join_date, total_customer: $total_customer, this_month_customer: $this_month_customer, active_customer: $active_customer)';
  }

  @override
  bool operator ==(covariant MyCustomerModel other) {
    if (identical(this, other)) return true;

    return other.latest_cust_join_date == latest_cust_join_date &&
        other.total_customer == total_customer &&
        other.this_month_customer == this_month_customer &&
        other.active_customer == active_customer;
  }

  @override
  int get hashCode {
    return latest_cust_join_date.hashCode ^
        total_customer.hashCode ^
        this_month_customer.hashCode ^
        active_customer.hashCode;
  }
}
