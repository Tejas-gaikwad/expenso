import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class GalleryListModel {
  final String? status;
  final String? message;
  final List? data;

  GalleryListModel(
    this.status,
    this.message,
    this.data,
  );

  GalleryListModel copyWith({
    String? status,
    String? message,
    List? data,
  }) {
    return GalleryListModel(
      status ?? this.status,
      message ?? this.message,
      data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'message': message,
      'data': (data ?? []),
    };
  }

  factory GalleryListModel.fromMap(Map<String, dynamic> map) {
    return GalleryListModel(
      map['status'] as String,
      map['message'] != null ? map['message'] as String : null,
      map['data'] != null ? List.from(map['data'] as Iterable) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory GalleryListModel.fromJson(String source) =>
      GalleryListModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'GalleryModel(status: $status, message: $message, data: $data)';

  @override
  bool operator ==(covariant GalleryListModel other) {
    if (identical(this, other)) return true;

    return other.status == status &&
        other.message == message &&
        other.data == data;
  }

  @override
  int get hashCode => status.hashCode ^ message.hashCode ^ data.hashCode;
}
