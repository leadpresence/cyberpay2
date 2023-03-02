// To parse this JSON data, do
//
//     final resendOtpRequest = resendOtpRequestFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/cupertino.dart';

ResendOtpRequest resendOtpRequestFromJson(String str) =>
    ResendOtpRequest.fromJson(json.decode(str));

String resendOtpRequestToJson(ResendOtpRequest data) =>
    json.encode(data.toJson());

class ResendOtpRequest {
    ResendOtpRequest({
    required this.mobileNo,
    required this.countryCode,
  });

  String mobileNo;
  String countryCode;

  factory ResendOtpRequest.fromJson(Map<String, dynamic> json) =>
      ResendOtpRequest(
        mobileNo: json["MobileNo"],
        countryCode: json["countryCode"],
      );

  Map<String, dynamic> toJson() => {
        'MobileNo': '$mobileNo',
        'countryCode': '$countryCode',
      };
}
