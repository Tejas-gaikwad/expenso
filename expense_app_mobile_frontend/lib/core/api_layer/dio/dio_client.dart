import 'dart:developer';
import 'package:dio/dio.dart';
import '../../db/shared_prefs_manager.dart';
import '../../utils/constants.dart';
import '../models/api.dart';
import '../models/exceptions.dart/unsecured_error.dart';

abstract class DioClient extends API {
  final Dio _dio;

  DioClient({
    required String baseUrl,
    Iterable<Interceptor>? interceptors,
    bool isAuthenticatorRequired = false,
    Duration timeout = const Duration(seconds: 120),
  }) : _dio = Dio(
          BaseOptions(
            baseUrl: baseUrl,
            receiveDataWhenStatusError: true,
            contentType: HeaderConstants.jsonContentType,
            followRedirects: true,
            sendTimeout: timeout,
            connectTimeout: timeout,
            receiveTimeout: timeout,
          ),
        ) {
    final url = Uri.tryParse(baseUrl);
    if (url != null && (!url.isScheme("HTTPS") || !url.isScheme("HTTP"))) {
      throw UnsecuredUrlException(url: baseUrl);
    }
  }

  Future<String?> getMKeyToken() async {
    String authToken = SharedPreferencesManager.getToken();
    return authToken;
  }

  @override
  Future<Response<dynamic>> get(
    String path, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    ResponseType responseType = ResponseType.json,
  }) async {
    try {
      final String? token = await getMKeyToken();

      headers ??= {};
      if (token != null) {
        headers['Authorization'] = 'Bearer $token';
      }

      final Response<dynamic> response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: Options(
            headers: headers,
            responseType: responseType,
            followRedirects: true),
      );
      return response;
    } on DioException catch (e) {
      throw e;
    }
  }

  @override
  Future<Response<dynamic>> post(
    String path, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    dynamic body = const {},
  }) async {
    try {
      final String? token = await getMKeyToken();
      log(token.toString());

      headers ??= {};
      if (token != null) {
        headers['Authorization'] = 'Bearer $token';
      }

      final Response<dynamic> response = await _dio.post(
        path,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
          responseType: ResponseType.json,
          followRedirects: true,
        ),
        data: body,
      );
      return response;
    } on DioException catch (e) {
      throw e;
    }
  }

  Future<Response<dynamic>> postWithoutJwt(String path,
      {dynamic body = const {}}) async {
    try {
      final Response<dynamic> response = await _dio.post(path,
          options:
              Options(responseType: ResponseType.json, followRedirects: true),
          data: body);
      return response;
    } on DioException catch (e) {
      throw e;
    }
  }

  @override
  Future<Response<dynamic>> patch(
    String path, {
    Map<String, dynamic>? headers,
    dynamic body = const {},
  }) async {
    try {
      final String? token = await getMKeyToken();

      headers ??= {};
      if (token != null) {
        headers['Authorization'] = 'Bearer $token';
      }

      final Response<dynamic> response = await _dio.patch(
        path,
        options: Options(
            headers: headers,
            responseType: ResponseType.json,
            followRedirects: true),
        data: body,
      );
      return response;
    } on DioException catch (e) {
      throw e;
    }
  }

  @override
  Future<Response<dynamic>> download(String path, String savePath) async {
    try {
      final response = await _dio.download(path, savePath);
      return response;
    } on DioException catch (e) {
      throw e;
    }
  }

  @override
  Future<Response<dynamic>> put(
    String path, {
    Map<String, dynamic>? headers,
    dynamic body = const {},
  }) async {
    try {
      final String? token = await getMKeyToken();

      headers ??= {};
      if (token != null) {
        headers['Authorization'] = 'Bearer $token';
      }

      final Response<dynamic> response = await _dio.put(
        path,
        options: Options(
            headers: headers,
            responseType: ResponseType.json,
            followRedirects: true),
        data: body,
      );
      return response;
    } on DioException catch (e) {
      throw e;
    }
  }

  @override
  Future<Response<dynamic>> delete(
    String path, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    ResponseType responseType = ResponseType.json,
    dynamic body = const {},
  }) async {
    try {
      final String? mKey = await getMKeyToken();

      headers ??= {};
      if (mKey != null) {
        headers['Authorization'] = 'Bearer $mKey';
      }

      final Response<dynamic> response = await _dio.delete(
        path,
        queryParameters: queryParameters,
        options: Options(
            headers: headers,
            responseType: responseType,
            followRedirects: true),
        data: body,
      );
      return response;
    } on DioException catch (e) {
      throw e;
    }
  }
}
