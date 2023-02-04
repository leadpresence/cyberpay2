// To parse this JSON data, do
//
//     final forgotPinResponse = forgotPinResponseFromJson(jsonString);

import 'dart:convert';

ForgotPinResponse forgotPinResponseFromJson(String str) => ForgotPinResponse.fromJson(json.decode(str));

String forgotPinResponseToJson(ForgotPinResponse data) => json.encode(data.toJson());

class ForgotPinResponse {
    ForgotPinResponse({
       required this.status,
        required  this.statusCode,
        required  this.message,
        required  this.result,
    });

    int status;
    int statusCode;
    String message;
    bool result;

    factory ForgotPinResponse.fromJson(Map<String, dynamic> json) => ForgotPinResponse(
        status: json["status"] == null ? null : json["status"],
        statusCode: json["statusCode"] == null ? null : json["statusCode"],
        message: json["message"] == null ? null : json["message"],
        result: json["result"] == null ? null : json["result"],
    );

    Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "statusCode": statusCode == null ? null : statusCode,
        "message": message == null ? null : message,
        "result": result == null ? null : result,
    };
}
