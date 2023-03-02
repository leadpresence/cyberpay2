import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
///
class ApiError {
  final int? errorCode;
  final String errorDescription;
  final dynamic data;
  final DioErrorType dioErrorType;
  static const _unknownError = 'Something went wrong. Please try again later';
  static const _internetError = 'Internet connection error, please try again';

  ApiError(
      {required this.errorCode,
      required this.errorDescription,
      this.data,
      required this.dioErrorType});

  factory ApiError.fromDioError(DioError error) {
    String description = '';
    switch (error.type) {
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        description = _unknownError;
        break;
      case DioErrorType.response:
        description = extractDescriptionFromResponse(error.response)!;
        break;
      case DioErrorType.cancel:
        description = 'API request canceled, please try again';
        break;
      case DioErrorType.other:
        description = _unknownError;
        if (error.error is SocketException) {
          description = _internetError;
        }
        break;
    }
    try {
      print('Final error desc: $description');

      return ApiError(
          errorCode: error.response?.statusCode!,
          errorDescription: description,
          dioErrorType: error.type,
          data: error?.response?.data != null
              ? error?.response?.data['data']
              : null,);
    } catch (error) {
      throw _unknownError;
    }
  }

  static String? extractDescriptionFromResponse(Response? response) {
    int? statusCode;
    try {
      if(response?.statusCode != null) {
        statusCode = response?.statusCode;
        if (statusCode! >= 500) {
          return _unknownError;
        }
      }
      if (response?.data != null && response?.data['message'] != null) {
        return response?.data['message'] as String;
      } else {
        return response?.statusMessage;
      }
    } catch (error) {
      throw _unknownError;
    }
  }

  @override
  String toString() => errorDescription;
}
