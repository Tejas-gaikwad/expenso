import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class TrainingModel {
  final String? status;
  final String? message;
  final List<TrainingVideoClass>? data;

  TrainingModel({
    this.status,
    this.message,
    this.data,
  });

  TrainingModel copyWith({
    String? status,
    String? message,
    List<TrainingVideoClass>? data,
  }) {
    return TrainingModel(
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

  factory TrainingModel.fromMap(Map<String, dynamic> map) {
    return TrainingModel(
      status: map['status'] != null ? map['status'] as String : null,
      message: map['message'] != null ? map['message'] as String : null,
      data: map['data'] != null ? List.from(map['data'] as Iterable) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TrainingModel.fromJson(String source) =>
      TrainingModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'TrainingModel(status: $status, message: $message, data: $data)';

  @override
  bool operator ==(covariant TrainingModel other) {
    if (identical(this, other)) return true;

    return other.status == status &&
        other.message == message &&
        other.data == data;
  }

  @override
  int get hashCode => status.hashCode ^ message.hashCode ^ data.hashCode;
}

class TrainingVideoClass {
  final String name;
  final String video_path;
  TrainingVideoClass(this.name, this.video_path);

  factory TrainingVideoClass.fromJson(Map<String, dynamic> json) {
    return TrainingVideoClass(
      json['name'],
      json['video_path'],
    );
  }
}
