import '../../config/environment.dart';
import '../dio/dio_client.dart';

class LoginApiClient extends DioClient {
  LoginApiClient()
      : super(
          baseUrl: Environment.instance.baseUrl,
          isAuthenticatorRequired: false,
        );
}
