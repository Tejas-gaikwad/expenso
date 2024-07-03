import 'package:dio/dio.dart';
import '../models/exceptions.dart/base.dart';
import '../models/exceptions.dart/timeout.dart';

extension ApiExceptionParser on DioException {
  ApiException parse() {
    final headers = requestOptions.headers.map(
      (key, value) => MapEntry<String, String>(key, value.toString()),
    );
    switch (type) {
      case DioExceptionType.receiveTimeout:
        return RequestTimeoutException(
          method: requestOptions.method,
          url: requestOptions.uri,
          data: requestOptions.data,
          headers: headers,
          timeout: Duration(milliseconds: 20000),
        );

      case DioExceptionType.sendTimeout:
        return SendTimeoutException(
          method: requestOptions.method,
          url: requestOptions.uri,
          data: requestOptions.data,
          headers: headers,
          timeout: Duration(milliseconds: 20000),
        );

      case DioExceptionType.cancel:
        return SendTimeoutException(
          method: requestOptions.method,
          url: requestOptions.uri,
          data: requestOptions.data,
          headers: headers,
          timeout: Duration(milliseconds: 20000),
        );

      default:
        return SendTimeoutException(
            method: requestOptions.method,
            url: requestOptions.uri,
            data: requestOptions.data,
            headers: headers,
            timeout: Duration(milliseconds: 20000));
    }
  }
}
