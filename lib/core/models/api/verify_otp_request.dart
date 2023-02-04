// To parse this JSON data, do
//
//     final verifyOtpRequest = verifyOtpRequestFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/material.dart';

VerifyOtpRequest verifyOtpRequestFromJson(String str) => VerifyOtpRequest.fromJson(json.decode(str));

String verifyOtpRequestToJson(VerifyOtpRequest data) => json.encode(data.toJson());

class VerifyOtpRequest {
    VerifyOtpRequest({
       required this.mobileNo,
       required this.otp,
    });

    String mobileNo;
    String otp;

    factory VerifyOtpRequest.fromJson(Map<String, dynamic> json) => VerifyOtpRequest(
        mobileNo: json["MobileNo"],
        otp: json["otp"],
    );

    Map<String, dynamic> toJson() => {
        "MobileNo": mobileNo,
        "otp": otp,
    };
}
