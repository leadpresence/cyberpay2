// To parse this JSON data, do
//
//     final resetPinRequest = resetPinRequestFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/material.dart';

ResetPinRequest resetPinRequestFromJson(String str) => ResetPinRequest.fromJson(json.decode(str));

String resetPinRequestToJson(ResetPinRequest data) => json.encode(data.toJson());

class ResetPinRequest {
    ResetPinRequest({
      required  this.otpCode,
       required  this.newPin,
    });

    String otpCode;
    String newPin;

    factory ResetPinRequest.fromJson(Map<String, dynamic> json) => ResetPinRequest(
        otpCode: json["otpCode"] == null ? null : json["otpCode"],
        newPin: json["newPin"] == null ? null : json["newPin"],
    );

    Map<String, dynamic> toJson() => {
        "otpCode": otpCode == null ? null : otpCode,
        "newPin": newPin == null ? null : newPin,
    };
}
