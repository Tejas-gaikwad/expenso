// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProfileModel {
  final String? code;
  final String? name;
  final String? mobile_number;
  final String? whatsapp_number;
  final String? email_id;
  final String? address;
  final String? bank_acc_type;
  final String? bank_name;
  final String? bank_acc_number;
  final String? bank_ifsc;
  final String? bank_verify;
  final String? pan_card;
  final String? pan_verify;
  final String? pan_imae;
  final String? aadhar_card;
  final String? aadhar_verify;
  final String? aadhar_front_image;
  final String? aadhar_back_image;
  final String? occupation;
  final String? firm_type;
  final String? education;
  final String? legal_matter;
  final String? marital_status;
  final String? residency_from;
  final String? profile_pic;
  final String? resume;
  final String? aggrement_verify;
  final String? aggrement_copy;
  final String? kyc_wallet;

  ProfileModel({
    this.code,
    this.name,
    this.mobile_number,
    this.whatsapp_number,
    this.email_id,
    this.address,
    this.bank_acc_type,
    this.bank_name,
    this.bank_acc_number,
    this.bank_ifsc,
    this.bank_verify,
    this.pan_card,
    this.pan_verify,
    this.pan_imae,
    this.aadhar_card,
    this.aadhar_verify,
    this.aadhar_front_image,
    this.aadhar_back_image,
    this.occupation,
    this.firm_type,
    this.education,
    this.legal_matter,
    this.marital_status,
    this.residency_from,
    this.profile_pic,
    this.resume,
    this.aggrement_verify,
    this.aggrement_copy,
    this.kyc_wallet,
  });

  ProfileModel copyWith({
    String? code,
    String? name,
    String? mobile_number,
    String? whatsapp_number,
    String? email_id,
    String? address,
    String? bank_acc_type,
    String? bank_name,
    String? bank_acc_number,
    String? bank_ifsc,
    String? bank_verify,
    String? pan_card,
    String? pan_verify,
    String? pan_imae,
    String? aadhar_card,
    String? aadhar_verify,
    String? aadhar_front_image,
    String? aadhar_back_image,
    String? occupation,
    String? firm_type,
    String? education,
    String? legal_matter,
    String? marital_status,
    String? residency_from,
    String? profile_pic,
    String? resume,
    String? aggrement_verify,
    String? aggrement_copy,
    String? kyc_wallet,
  }) {
    return ProfileModel(
      code: code ?? this.code,
      name: name ?? this.name,
      mobile_number: mobile_number ?? this.mobile_number,
      whatsapp_number: whatsapp_number ?? this.whatsapp_number,
      email_id: email_id ?? this.email_id,
      address: address ?? this.address,
      bank_acc_type: bank_acc_type ?? this.bank_acc_type,
      bank_name: bank_name ?? this.bank_name,
      bank_acc_number: bank_acc_number ?? this.bank_acc_number,
      bank_ifsc: bank_ifsc ?? this.bank_ifsc,
      bank_verify: bank_verify ?? this.bank_verify,
      pan_card: pan_card ?? this.pan_card,
      pan_verify: pan_verify ?? this.pan_verify,
      pan_imae: pan_imae ?? this.pan_imae,
      aadhar_card: aadhar_card ?? this.aadhar_card,
      aadhar_verify: aadhar_verify ?? this.aadhar_verify,
      aadhar_front_image: aadhar_front_image ?? this.aadhar_front_image,
      aadhar_back_image: aadhar_back_image ?? this.aadhar_back_image,
      occupation: occupation ?? this.occupation,
      firm_type: firm_type ?? this.firm_type,
      education: education ?? this.education,
      legal_matter: legal_matter ?? this.legal_matter,
      marital_status: marital_status ?? this.marital_status,
      residency_from: residency_from ?? this.residency_from,
      profile_pic: profile_pic ?? this.profile_pic,
      resume: resume ?? this.resume,
      aggrement_verify: aggrement_verify ?? this.aggrement_verify,
      aggrement_copy: aggrement_copy ?? this.aggrement_copy,
      kyc_wallet: kyc_wallet ?? this.kyc_wallet,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'code': code,
      'name': name,
      'mobile_number': mobile_number,
      'whatsapp_number': whatsapp_number,
      'email_id': email_id,
      'address': address,
      'bank_acc_type': bank_acc_type,
      'bank_name': bank_name,
      'bank_acc_number': bank_acc_number,
      'bank_ifsc': bank_ifsc,
      'bank_verify': bank_verify,
      'pan_card': pan_card,
      'pan_verify': pan_verify,
      'pan_imae': pan_imae,
      'aadhar_card': aadhar_card,
      'aadhar_verify': aadhar_verify,
      'aadhar_front_image': aadhar_front_image,
      'aadhar_back_image': aadhar_back_image,
      'occupation': occupation,
      'firm_type': firm_type,
      'education': education,
      'legal_matter': legal_matter,
      'marital_status': marital_status,
      'residency_from': residency_from,
      'profile_pic': profile_pic,
      'resume': resume,
      'aggrement_verify': aggrement_verify,
      'aggrement_copy': aggrement_copy,
      'kyc_wallet': kyc_wallet,
    };
  }

  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(
      code: map['code'] != null ? map['code'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      mobile_number:
          map['mobile_number'] != null ? map['mobile_number'] as String : null,
      whatsapp_number: map['whatsapp_number'] != null
          ? map['whatsapp_number'] as String
          : null,
      email_id: map['email_id'] != null ? map['email_id'] as String : null,
      address: map['address'] != null ? map['address'] as String : null,
      bank_acc_type:
          map['bank_acc_type'] != null ? map['bank_acc_type'] as String : null,
      bank_name: map['bank_name'] != null ? map['bank_name'] as String : null,
      bank_acc_number: map['bank_acc_number'] != null
          ? map['bank_acc_number'] as String
          : null,
      bank_ifsc: map['bank_ifsc'] != null ? map['bank_ifsc'] as String : null,
      bank_verify:
          map['bank_verify'] != null ? map['bank_verify'] as String : null,
      pan_card: map['pan_card'] != null ? map['pan_card'] as String : null,
      pan_verify:
          map['pan_verify'] != null ? map['pan_verify'] as String : null,
      pan_imae: map['pan_imae'] != null ? map['pan_imae'] as String : null,
      aadhar_card:
          map['aadhar_card'] != null ? map['aadhar_card'] as String : null,
      aadhar_verify:
          map['aadhar_verify'] != null ? map['aadhar_verify'] as String : null,
      aadhar_front_image: map['aadhar_front_image'] != null
          ? map['aadhar_front_image'] as String
          : null,
      aadhar_back_image: map['aadhar_back_image'] != null
          ? map['aadhar_back_image'] as String
          : null,
      occupation:
          map['occupation'] != null ? map['occupation'] as String : null,
      firm_type: map['firm_type'] != null ? map['firm_type'] as String : null,
      education: map['education'] != null ? map['education'] as String : null,
      legal_matter:
          map['legal_matter'] != null ? map['legal_matter'] as String : null,
      marital_status: map['marital_status'] != null
          ? map['marital_status'] as String
          : null,
      residency_from: map['residency_from'] != null
          ? map['residency_from'] as String
          : null,
      profile_pic:
          map['profile_pic'] != null ? map['profile_pic'] as String : null,
      resume: map['resume'] != null ? map['resume'] as String : null,
      aggrement_verify: map['aggrement_verify'] != null
          ? map['aggrement_verify'] as String
          : null,
      aggrement_copy: map['aggrement_copy'] != null
          ? map['aggrement_copy'] as String
          : null,
      kyc_wallet:
          map['kyc_wallet'] != null ? map['kyc_wallet'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfileModel.fromJson(String source) =>
      ProfileModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProfileModel(code: $code, name: $name, mobile_number: $mobile_number, whatsapp_number: $whatsapp_number, email_id: $email_id, address: $address, bank_acc_type: $bank_acc_type, bank_name: $bank_name, bank_acc_number: $bank_acc_number, bank_ifsc: $bank_ifsc, bank_verify: $bank_verify, pan_card: $pan_card, pan_verify: $pan_verify, pan_imae: $pan_imae, aadhar_card: $aadhar_card, aadhar_verify: $aadhar_verify, aadhar_front_image: $aadhar_front_image, aadhar_back_image: $aadhar_back_image, occupation: $occupation, firm_type: $firm_type, education: $education, legal_matter: $legal_matter, marital_status: $marital_status, residency_from: $residency_from, profile_pic: $profile_pic, resume: $resume, aggrement_verify: $aggrement_verify, aggrement_copy: $aggrement_copy, kyc_wallet: $kyc_wallet)';
  }

  @override
  bool operator ==(covariant ProfileModel other) {
    if (identical(this, other)) return true;

    return other.code == code &&
        other.name == name &&
        other.mobile_number == mobile_number &&
        other.whatsapp_number == whatsapp_number &&
        other.email_id == email_id &&
        other.address == address &&
        other.bank_acc_type == bank_acc_type &&
        other.bank_name == bank_name &&
        other.bank_acc_number == bank_acc_number &&
        other.bank_ifsc == bank_ifsc &&
        other.bank_verify == bank_verify &&
        other.pan_card == pan_card &&
        other.pan_verify == pan_verify &&
        other.pan_imae == pan_imae &&
        other.aadhar_card == aadhar_card &&
        other.aadhar_verify == aadhar_verify &&
        other.aadhar_front_image == aadhar_front_image &&
        other.aadhar_back_image == aadhar_back_image &&
        other.occupation == occupation &&
        other.firm_type == firm_type &&
        other.education == education &&
        other.legal_matter == legal_matter &&
        other.marital_status == marital_status &&
        other.residency_from == residency_from &&
        other.profile_pic == profile_pic &&
        other.resume == resume &&
        other.aggrement_verify == aggrement_verify &&
        other.aggrement_copy == aggrement_copy &&
        other.kyc_wallet == kyc_wallet;
  }

  @override
  int get hashCode {
    return code.hashCode ^
        name.hashCode ^
        mobile_number.hashCode ^
        whatsapp_number.hashCode ^
        email_id.hashCode ^
        address.hashCode ^
        bank_acc_type.hashCode ^
        bank_name.hashCode ^
        bank_acc_number.hashCode ^
        bank_ifsc.hashCode ^
        bank_verify.hashCode ^
        pan_card.hashCode ^
        pan_verify.hashCode ^
        pan_imae.hashCode ^
        aadhar_card.hashCode ^
        aadhar_verify.hashCode ^
        aadhar_front_image.hashCode ^
        aadhar_back_image.hashCode ^
        occupation.hashCode ^
        firm_type.hashCode ^
        education.hashCode ^
        legal_matter.hashCode ^
        marital_status.hashCode ^
        residency_from.hashCode ^
        profile_pic.hashCode ^
        resume.hashCode ^
        aggrement_verify.hashCode ^
        aggrement_copy.hashCode ^
        kyc_wallet.hashCode;
  }
}
