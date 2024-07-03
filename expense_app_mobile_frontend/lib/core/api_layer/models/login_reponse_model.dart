class LoginResponseModel {
  final String status;
  final String? messages;
  final List<CustomerData>? custData;

  LoginResponseModel({
    required this.status,
     this.messages,
     this.custData,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      status: json['status'].toString() == "True" ? "true" : "false" ,
      messages: json['messages'],
      custData: List<CustomerData>.from(json['cust_data'].map((x) => CustomerData.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status.toString(),
      'messages': messages,
      'cust_data': List<dynamic>.from(custData?.map((x) => x.toJson()) ?? []),
    };
  }
}

class CustomerData {
  final String customrtID;
  final String customerJoinDate;
  final String customerName;
  final String customerMobile;
  final String customerEmail;
  final String customerDOB;
  final String customerPassword;
  final String customerAddress;
  final String customerCity;
  final String customerState;
  final String customerPincode;
  final String customerCountry;
  final String mobileVerify;
  final String emailVerify;
  final String customerActive;
  final dynamic customerLastLogin;
  final String delMark;
  final dynamic customerFacebookId;
  final dynamic customerGmailId;
  final String customerToken;
  final String customerPhoto;
  final String customerFavShop;
  final dynamic deviceType;
  final dynamic fkGenMitraID;
  final dynamic customerReferrerCode;
  final String customerReferalCode;
  final String wallet;
  final String coins;
  final String version;
  final dynamic fkObpID;
  final String callBusyFlag;
  final dynamic callBusyBy;
  final String rbnoNextFollowup;
  final dynamic fkTeamMemberId;
  final dynamic customerWebKey;
  final dynamic callGoodTime;

  CustomerData({
    required this.customrtID,
    required this.customerJoinDate,
    required this.customerName,
    required this.customerMobile,
    required this.customerEmail,
    required this.customerDOB,
    required this.customerPassword,
    required this.customerAddress,
    required this.customerCity,
    required this.customerState,
    required this.customerPincode,
    required this.customerCountry,
    required this.mobileVerify,
    required this.emailVerify,
    required this.customerActive,
    this.customerLastLogin,
    required this.delMark,
    this.customerFacebookId,
    this.customerGmailId,
    required this.customerToken,
    required this.customerPhoto,
    required this.customerFavShop,
    this.deviceType,
    this.fkGenMitraID,
    this.customerReferrerCode,
    required this.customerReferalCode,
    required this.wallet,
    required this.coins,
    required this.version,
    this.fkObpID,
    required this.callBusyFlag,
    this.callBusyBy,
    required this.rbnoNextFollowup,
    this.fkTeamMemberId,
    this.customerWebKey,
    this.callGoodTime,
  });

  factory CustomerData.fromJson(Map<String, dynamic> json) {
    return CustomerData(
      customrtID: json['CustomrtID'],
      customerJoinDate: json['CustomerJoinDate'],
      customerName: json['CustomerName'],
      customerMobile: json['CustomerMobile'],
      customerEmail: json['CustomerEmail'],
      customerDOB: json['CustomerDOB'],
      customerPassword: json['CustomerPassword'],
      customerAddress: json['CustomerAddress'],
      customerCity: json['CustomerCity'],
      customerState: json['CustomerState'],
      customerPincode: json['CustomerPincode'],
      customerCountry: json['CustomerCountry'],
      mobileVerify: json['MobileVerify'],
      emailVerify: json['EmailVerify'],
      customerActive: json['CustomerActive'],
      customerLastLogin: json['CustomerLastLogin'],
      delMark: json['delMark'],
      customerFacebookId: json['CustomerFacebookId'],
      customerGmailId: json['CustomerGmailId'],
      customerToken: json['CustomerToken'],
      customerPhoto: json['CustomerPhoto'],
      customerFavShop: json['CustomerFavShop'],
      deviceType: json['DeviceType'],
      fkGenMitraID: json['FK_GenMitraID'],
      customerReferrerCode: json['Customer_referrer_code'],
      customerReferalCode: json['Customer_referal_code'],
      wallet: json['Wallet'],
      coins: json['Coins'],
      version: json['Version'],
      fkObpID: json['FK_ObpID'],
      callBusyFlag: json['CallBusyFlag'],
      callBusyBy: json['CallBusyBy'],
      rbnoNextFollowup: json['RBNO_NextFollowup'],
      fkTeamMemberId: json['FK_TeamMemberId'],
      customerWebKey: json['Customer_WebKey'],
      callGoodTime: json['CallGoodTime'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'CustomrtID': customrtID,
      'CustomerJoinDate': customerJoinDate,
      'CustomerName': customerName,
      'CustomerMobile': customerMobile,
      'CustomerEmail': customerEmail,
      'CustomerDOB': customerDOB,
      'CustomerPassword': customerPassword,
      'CustomerAddress': customerAddress,
      'CustomerCity': customerCity,
      'CustomerState': customerState,
      'CustomerPincode': customerPincode,
      'CustomerCountry': customerCountry,
      'MobileVerify': mobileVerify,
      'EmailVerify': emailVerify,
      'CustomerActive': customerActive,
      'CustomerLastLogin': customerLastLogin,
      'delMark': delMark,
      'CustomerFacebookId': customerFacebookId,
      'CustomerGmailId': customerGmailId,
      'CustomerToken': customerToken,
      'CustomerPhoto': customerPhoto,
      'CustomerFavShop': customerFavShop,
      'DeviceType': deviceType,
      'FK_GenMitraID': fkGenMitraID,
      'Customer_referrer_code': customerReferrerCode,
      'Customer_referal_code': customerReferalCode,
      'Wallet': wallet,
      'Coins': coins,
      'Version': version,
      'FK_ObpID': fkObpID,
      'CallBusyFlag': callBusyFlag,
      'CallBusyBy': callBusyBy,
      'RBNO_NextFollowup': rbnoNextFollowup,
      'FK_TeamMemberId': fkTeamMemberId,
      'Customer_WebKey': customerWebKey,
      'CallGoodTime': callGoodTime,
    };
  }
}
