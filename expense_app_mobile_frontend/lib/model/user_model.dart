import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable()
class UserDataModel {
  final String? uid;
  final String? imagePath;
  final String fullName;
  final String email;
  final String? mobileNo;
  final String? address;
  final String? country;
  final String? state;
  final String? city;
  final int? pinCode;
  final String? about;
  final String? userProfilePicture;

  const UserDataModel({
    this.address,
    this.country,
    this.state,
    this.city,
    this.pinCode,
    this.uid,
    this.userProfilePicture,
    this.mobileNo,
    this.imagePath,
    required this.fullName,
    required this.email,
    this.about,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) =>
      _$UserDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataModelToJson(this);
}