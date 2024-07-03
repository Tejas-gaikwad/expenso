// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class GalleryGroupModel {
  final String? status;
  final String? message;
  final List? data;
  GalleryGroupModel({
    this.status,
    this.message,
    this.data,
  });

  GalleryGroupModel copyWith({
    String? status,
    String? message,
    List? data,
  }) {
    return GalleryGroupModel(
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'message': message,
      'data': (data ?? []),
    };
  }

  factory GalleryGroupModel.fromMap(Map<String, dynamic> map) {
    return GalleryGroupModel(
      status: map['status'] != null ? map['status'] as String : null,
      message: map['message'] != null ? map['message'] as String : null,
      data: map['data'] != null ? List.from(map['data'] as Iterable) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory GalleryGroupModel.fromJson(String source) =>
      GalleryGroupModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'GalleryGroupModel(status: $status, message: $message, data: $data)';

  @override
  bool operator ==(covariant GalleryGroupModel other) {
    if (identical(this, other)) return true;

    return other.status == status &&
        other.message == message &&
        other.data == data;
  }

  @override
  int get hashCode => status.hashCode ^ message.hashCode ^ data.hashCode;
}
