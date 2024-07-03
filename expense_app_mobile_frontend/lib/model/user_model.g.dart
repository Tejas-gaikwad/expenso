// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDataModel _$UserDataModelFromJson(Map<String, dynamic> json) =>
    UserDataModel(
      address: json['address'] as String?,
      country: json['country'] as String?,
      state: json['state'] as String?,
      city: json['city'] as String?,
      pinCode: (json['pinCode'] as num?)?.toInt(),
      uid: json['uid'] as String?,
      userProfilePicture: json['userProfilePicture'] as String?,
      mobileNo: json['mobileNo'] as String?,
      imagePath: json['imagePath'] as String?,
      fullName: json['fullName'] as String,
      email: json['email'] as String,
      about: json['about'] as String?,
    );

Map<String, dynamic> _$UserDataModelToJson(UserDataModel instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'imagePath': instance.imagePath,
      'fullName': instance.fullName,
      'email': instance.email,
      'mobileNo': instance.mobileNo,
      'address': instance.address,
      'country': instance.country,
      'state': instance.state,
      'city': instance.city,
      'pinCode': instance.pinCode,
      'about': instance.about,
      'userProfilePicture': instance.userProfilePicture,
    };
