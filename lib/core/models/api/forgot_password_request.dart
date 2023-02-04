// To parse this JSON data, do
//
//     final forgotPasswordRequest = forgotPasswordRequestFromJson(jsonString);

import 'dart:convert';

ForgotPasswordRequest forgotPasswordRequestFromJson(String str) => ForgotPasswordRequest.fromJson(json.decode(str));

String forgotPasswordRequestToJson(ForgotPasswordRequest data) => json.encode(data.toJson());

class ForgotPasswordRequest {
    ForgotPasswordRequest({
      required  this.mobileNo,
      required  this.countryCode,
    });

    String mobileNo;
    String countryCode;

    factory ForgotPasswordRequest.fromJson(Map<String, dynamic> json) => ForgotPasswordRequest(
        mobileNo: json["MobileNo"],
        countryCode: json["countryCode"],
    );

    Map<String, dynamic> toJson() => {
        "MobileNo": mobileNo,
        "countryCode": countryCode,
    };
}
