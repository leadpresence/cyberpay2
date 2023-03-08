// To parse this JSON data, do
//
//     final resetPasswordRequest = resetPasswordRequestFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ResetPasswordRequest resetPasswordRequestFromMap(String str) => ResetPasswordRequest.fromMap(json.decode(str));

String resetPasswordRequestToMap(ResetPasswordRequest data) => json.encode(data.toMap());

class ResetPasswordRequest {
  ResetPasswordRequest({
    required this.mobileNo,
    required this.newPassword,
    required this.resetCode,
  });

  final String mobileNo;
  final String newPassword;
  final String resetCode;

  ResetPasswordRequest copyWith({
    required String mobileNo,
    required String newPassword,
    required String resetCode,
  }) =>
      ResetPasswordRequest(
        mobileNo: mobileNo ?? this.mobileNo,
        newPassword: newPassword ?? this.newPassword,
        resetCode: resetCode ?? this.resetCode,
      );

  factory ResetPasswordRequest.fromMap(Map<String, dynamic> json) => ResetPasswordRequest(
    mobileNo: json["mobileNo"],
    newPassword: json["newPassword"],
    resetCode: json["resetCode"],
  );

  Map<String, dynamic> toMap() => {
    "mobileNo": mobileNo,
    "newPassword": newPassword,
    "resetCode": resetCode,
  };
}
