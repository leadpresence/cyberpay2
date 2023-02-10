// To parse this JSON data, do
//
//     final resetPasswordRequest = resetPasswordRequestFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/cupertino.dart';

ResetPasswordRequest resetPasswordRequestFromJson(String str) =>
    ResetPasswordRequest.fromJson(json.decode(str));

String resetPasswordRequestToJson(ResetPasswordRequest data) =>
    json.encode(data.toJson());

class ResetPasswordRequest {
  ResetPasswordRequest({
    required this.mobileNo,
    required this.newPassword,
    required this.resetCode,
  });

  String mobileNo;
  String newPassword;
  String resetCode;

  factory ResetPasswordRequest.fromJson(Map<String, dynamic> json) =>
      ResetPasswordRequest(
        mobileNo: json["mobileNo"],
        newPassword: json["newPassword"],
        resetCode: json["resetCode"],
      );

  Map<String, dynamic> toJson() => {
        "mobileNo": mobileNo,
        "newPassword": newPassword,
        "resetCode": resetCode,
      };
}
