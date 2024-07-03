
import 'package:expense_app/services/auth_services.dart';

import '../core/logs/logger/app_logger.dart';
import '../model/api_response.dart';


class AuthRepository {

  final AuthService authServices;
  final AppLogger appLogger;

  AuthRepository({required this.authServices, required this.appLogger});




  Future<ApiResponse> googleLogin() async {
    return authServices.googleLogin();
  }

  Future<ApiResponse> googleLogout() async {
    return authServices.googleLogout();
  }

  Future<ApiResponse> getUserInformationService({
    required String userId,
  }) async {
    return authServices.getUserInformation(
        userId: userId);
  }

  Future<ApiResponse> registerUser({
    required String email,
    required String password,
    required String fullName,
    required String mobileNo,
  }) async {
    return authServices.registerUser(
        email: email,
        password: password,
        fullName: fullName,
        mobileNo: mobileNo);
  }

  Future<ApiResponse> updateUser({
    String? email,
    required String fullName,
    required String mobileNo,
    required String state,
    required int pinCode,
    required String city,
    required String address,
    required String country,
  }) async {
    return authServices.updateUser(
      email: email,
      fullName: fullName,
      mobileNo: mobileNo,
      state: state,
      pinCode: pinCode,
      city: city,
      address: address,
      country: country,
    );
  }

  Future<ApiResponse> changeUserType(
      {required String? societyId,
        required String? userId,
        required String userType}) async {
    return authServices.changeUserType(
      userType: userType,
      societyId: societyId ?? '',
      userId: userId ?? '',
    );
  }

}