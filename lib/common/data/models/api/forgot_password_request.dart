// To parse this JSON data, do
//
//     final forgotPasswordRequest = forgotPasswordRequestFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ForgotPasswordRequest forgotPasswordRequestFromMap(String str) => ForgotPasswordRequest.fromMap(json.decode(str));

String forgotPasswordRequestToMap(ForgotPasswordRequest data) => json.encode(data.toMap());

/// ForgotPasswordRequest
class ForgotPasswordRequest {
  /// Constructor for ForgotPasswordRequest

  ForgotPasswordRequest({
    required this.mobileNo,
    required this.countryCode,
  });

  final String mobileNo;
  final String countryCode;

  ForgotPasswordRequest copyWith({
    required String mobileNo,
    required String countryCode,
  }) =>
      ForgotPasswordRequest(
        mobileNo: mobileNo ?? this.mobileNo,
        countryCode: countryCode ?? this.countryCode,
      );

  factory ForgotPasswordRequest.fromMap(Map<String, dynamic> json) => ForgotPasswordRequest(
    mobileNo: json["MobileNo"],
    countryCode: json["countryCode"],
  );

  Map<String, dynamic> toMap() => {
    "MobileNo": mobileNo,
    "countryCode": countryCode,
  };
}
