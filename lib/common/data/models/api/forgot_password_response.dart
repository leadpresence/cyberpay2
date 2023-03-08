// To parse this JSON data, do
//
//     final forgotPasswordResponse = forgotPasswordResponseFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ForgotPasswordResponse forgotPasswordResponseFromMap(String str) => ForgotPasswordResponse.fromMap(json.decode(str));

String forgotPasswordResponseToMap(ForgotPasswordResponse data) => json.encode(data.toMap());

///  ForgotPasswordResponse
class ForgotPasswordResponse {
  /// Constructor ForgotPasswordResponse
  ForgotPasswordResponse({
    required this.succeeded,
    required this.message,
    required this.data,
  });

  final bool succeeded;
  final String message;
  final dynamic data;

  ForgotPasswordResponse copyWith({
    required bool succeeded,
    required String message,
    dynamic data,
  }) =>
      ForgotPasswordResponse(
        succeeded: succeeded ?? this.succeeded,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory ForgotPasswordResponse.fromMap(Map<String, dynamic> json) => ForgotPasswordResponse(
    succeeded: json['succeeded'],
    message: json['message'],
    data: json['data'],
  );

  Map<String, dynamic> toMap() => {
    'succeeded': succeeded,
    'message': message,
    'data': data,
  };
}
