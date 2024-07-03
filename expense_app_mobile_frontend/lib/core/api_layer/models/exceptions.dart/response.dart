import 'base.dart';

class ResponseApiException extends ApiException {
  ResponseApiException({
    required String method,
    required Uri url,
    required dynamic data,
    required Map<String, String>? headers,
  }) : super(
          method: method,
          url: url,
          data: data,
          headers: headers,
        );
}
