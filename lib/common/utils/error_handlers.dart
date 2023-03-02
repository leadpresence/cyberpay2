import 'package:dio/dio.dart';

/// A [DioError] handler that returns user friendly error message.
String handleApiError(DioError error) {
  // The request was made and the server responded with a status code
  // that falls out of the range of 2xx and is also not 304.
  if (error.response != null &&
      error.response?.data != null &&
      error.response?.data != '' &&
      error.response?.data['message'] != null) {
    return error.response?.data['message'];
  } else {
    // Something happened in setting up or sending the request that triggered an Error
    switch (error.type) {
      case DioErrorType.connectTimeout:
        return 'Connection timeout with API server';
      case DioErrorType.sendTimeout:
        return 'Send timeout in with API server';
      case DioErrorType.receiveTimeout:
        return 'Received timeout in connection with API server';
      case DioErrorType.response:
        return error.response?.statusCode == 401
            ? 'Unauthorized. Session expired. Kindly login again.'
            : 'Received invalid status code: ${error.response!.statusCode}';
      case DioErrorType.cancel:
        return 'Request to API server was cancelled';
      case DioErrorType.other:
        return 'Connection to API server failed due to internet connection';
      default:
        return 'Unexpected error occurred';
    }
  }
}
