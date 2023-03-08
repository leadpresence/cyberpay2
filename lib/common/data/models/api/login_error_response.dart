// To parse this JSON data, do
//
//     final loginErrorResponse = loginErrorResponseFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

LoginErrorResponse loginErrorResponseFromMap(String str) => LoginErrorResponse.fromMap(json.decode(str));

String loginErrorResponseToMap(LoginErrorResponse data) => json.encode(data.toMap());
/// LoginErrorResponse
class LoginErrorResponse {
  /// LoginErrorResponse
  LoginErrorResponse({
    required this.succeeded,
    required this.message,
    required this.data,
  });

  final bool succeeded;
  final String message;
  final dynamic data;

  LoginErrorResponse copyWith({
    required bool succeeded,
    required String message,
    dynamic data,
  }) =>
      LoginErrorResponse(
        succeeded: succeeded ?? this.succeeded,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory LoginErrorResponse.fromMap(Map<String, dynamic> json) => LoginErrorResponse(
    succeeded: json["succeeded"],
    message: json["message"],
    data: json["data"],
  );

  Map<String, dynamic> toMap() => {
    "succeeded": succeeded,
    "message": message,
    "data": data,
  };
}
