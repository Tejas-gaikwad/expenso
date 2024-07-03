class CustomerInfoData {
  final String status;
  final String? messages;
  final CustomerData? data;

  CustomerInfoData({
    required this.status,
     this.messages,
     this.data,
  });

  factory CustomerInfoData.fromJson(Map<String, dynamic> json) {
    return CustomerInfoData(
      status: json['status'] == "True" ? "true" : "false",
      messages: json['messages'],
      data: CustomerData.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status.toString(),
      'messages': messages,
      'data': data?.toJson(),
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
  final String? customerCity;
  final String? customerState;
  final String? customerPincode;
  final String? customerCountry;
  final String? mobileVerify;
  final String? emailVerify;
  final String? customerActive;
  final String? customerLastLogin;
  final String? delMark;
  final String? customerFacebookId;
  final String? customerGmailId;
  final String? customerToken;
  final String? customerPhoto;
  final String? customerFavShop;
  final String? deviceType;
  final String? fkGenMitraID;
  final String? customerReferrerCode;
  final String? customerReferalCode;
  final String? wallet;
  final String? coins;
  final String? version;
  final String? fkObpID;
  final String? callBusyFlag;
  final String? callBusyBy;
  final String? rbnoNextFollowup;
  final String? fkTeamMemberId;
  final String? customerWebKey;
  final String? callGoodTime;
  final String? franchID;
  final String? franchRegDate;
  final String? franchShopCode;
  final String? franchName;
  final String? franchOwnerName;
  final String? fkFranchStateId;
  final String? fkFranchCityId;
  final String? franchPinCode;
  final String? franchAddress;
  final String? franchLatLong;
  final String? franchEmail;
  final String? franchMobile;
  final String? franchPassword;
  final String? franchLastLogin;
  final String? franchAadharCard;
  final String? franchPanCard;
  final String? franchBankName;
  final String? franchBankBranch;
  final String? franchBankAccName;
  final String? franchBankAccNum;
  final String? franchBankIFSC;
  final String? franchActive;
  final String? franchLegalBlock;
  final String? fkFranchDistId;
  final String? fkDistHdId;
  final String? fkZonalHdId;
  final String? referalCode;
  final String? fkFranchTypeID;
  final String? isOBP;

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
    this.franchID,
    this.franchRegDate,
    this.franchShopCode,
    this.franchName,
    this.franchOwnerName,
    this.fkFranchStateId,
    this.fkFranchCityId,
    this.franchPinCode,
    this.franchAddress,
    this.franchLatLong,
    this.franchEmail,
    this.franchMobile,
    this.franchPassword,
    this.franchLastLogin,
    this.franchAadharCard,
    this.franchPanCard,
    this.franchBankName,
    this.franchBankBranch,
    this.franchBankAccName,
    this.franchBankAccNum,
    this.franchBankIFSC,
    this.franchActive,
    this.franchLegalBlock,
    this.fkFranchDistId,
    this.fkDistHdId,
    this.fkZonalHdId,
    this.referalCode,
    this.fkFranchTypeID,
    this.isOBP,
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
      franchID: json['FranchID'],
      franchRegDate: json['FranchRegDate'],
      franchShopCode: json['FranchShopCode'],
      franchName: json['FranchName'],
      franchOwnerName: json['FranchOwnerName'],
      fkFranchStateId: json['FK_FranchStateId'],
      fkFranchCityId: json['FK_FranchCityId'],
      franchPinCode: json['FranchPinCode'],
      franchAddress: json['FranchAddress'],
      franchLatLong: json['FranchLatLong'],
      franchEmail: json['FranchEmail'],
      franchMobile: json['FranchMobile'],
      franchPassword: json['FranchPassword'],
      franchLastLogin: json['FranchLastLogin'],
      franchAadharCard: json['FranchAadharCard'],
      franchPanCard: json['FranchPanCard'],
      franchBankName: json['FranchBankName'],
      franchBankBranch: json['FranchBankBranch'],
      franchBankAccName: json['FranchBankAccName'],
      franchBankAccNum: json['FranchBankAccNum'],
      franchBankIFSC: json['FranchBankIFSC'],
      franchActive: json['FranchActive'],
      franchLegalBlock: json['FranchLegalBlock'],
      fkFranchDistId: json['FK_FranchDistId'],
      fkDistHdId: json['FK_DistHdId'],
      fkZonalHdId: json['FK_ZonalHdId'],
      referalCode: json['referal_code'],
      fkFranchTypeID: json['FK_FranchTypeID'],
      isOBP: json['IsOBP'],
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
    };
  }
}