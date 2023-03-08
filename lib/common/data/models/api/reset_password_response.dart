// To parse this JSON data, do
//
//     final resetPasswordResponse = resetPasswordResponseFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ResetPasswordResponse resetPasswordResponseFromMap(String str) =>
    ResetPasswordResponse.fromMap(json.decode(str));

String resetPasswordResponseToMap(ResetPasswordResponse data) =>
    json.encode(data.toMap());

///  ResetPasswordResponse
class ResetPasswordResponse {
  /// Constructor [ResetPasswordResponse] 
  ResetPasswordResponse({
    required this.succeeded,
    required this.message,
    required this.data,
  });

  final bool succeeded;
  final String message;
  final dynamic data;

  ResetPasswordResponse copyWith({
    required bool succeeded,
    required String message,
    dynamic data,
  }) =>
      ResetPasswordResponse(
        succeeded: succeeded ?? this.succeeded,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory ResetPasswordResponse.fromMap(Map<String, dynamic> json) =>
      ResetPasswordResponse(
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
