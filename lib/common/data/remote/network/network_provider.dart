import 'package:dio/dio.dart';
import '../../../../env/app_env.dart';
import 'cyber_pay_api_interceptor.dart';
import 'api_error.dart';

/// Class  NetworkProvider for all network Methods
class NetworkProvider {
  static const int CONNECT_TIME_OUT = 30000;
  static const int SEND_TIME_OUT = 30000;
  static const int RECEIVE_TIME_OUT = 30000;
  Dio _dio;

  /// Constructor for  NetworkProvider
  NetworkProvider({Dio? dio})
      : _dio = dio ?? Dio(_defaultOptions)
          ..interceptors.addAll([
            CyberPayApiInterceptor(
                CybAppEnvironment.apiKey,
                CybAppEnvironment.walletApiSecret,),
            LogInterceptor(requestBody: true, responseBody: true),

          ]);

  factory NetworkProvider.fromBaseUrl(String baseUrl) {
    return NetworkProvider(
      dio: Dio(
        BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: CONNECT_TIME_OUT,
          receiveTimeout: RECEIVE_TIME_OUT,
          sendTimeout: SEND_TIME_OUT,
        ),
      )..interceptors.addAll([
          CyberPayApiInterceptor(
              CybAppEnvironment.apiKey,
            CybAppEnvironment.walletApiSecret,),
        ]),
    );
  }

  static BaseOptions get _defaultOptions {
    return BaseOptions(
      baseUrl: CybAppEnvironment.billersBaseUrl,
      connectTimeout: CONNECT_TIME_OUT,
      sendTimeout: SEND_TIME_OUT,
      receiveTimeout: RECEIVE_TIME_OUT,
    );
  }

  Future<Response> post(
    String path, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      return await _dio.post(path,
          data: body, queryParameters: queryParameters,);
    } on DioError catch (error) {
      throw ApiError.fromDioError(error);
    }
  }

  Future<Response> postFormData(
    String path, {
    body,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      return await _dio.post(path,
          data: body, queryParameters: queryParameters,);
    } on DioError catch (error) {
      throw ApiError.fromDioError(error);
    }
  }

  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      return await _dio.get(path, queryParameters: queryParameters);
    } on DioError catch (error) {
      throw ApiError.fromDioError(error);
    }
  }

  Future<Response> put(
    String path, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      return await _dio.put(path, data: body, queryParameters: queryParameters);
    } on DioError catch (error) {
      throw ApiError.fromDioError(error);
    }
  }

  Future<Response> patch(
    String path, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      return await _dio.patch(
        path,
        data: body,
        queryParameters: queryParameters,
      );
    } on DioError catch (error) {
      throw ApiError.fromDioError(error);
    }
  }

  Future<Response> delete(
    String path, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      return await _dio.delete(path,
          data: body, queryParameters: queryParameters);
    } on DioError catch (error) {
      throw ApiError.fromDioError(error);
    }
  }
}


