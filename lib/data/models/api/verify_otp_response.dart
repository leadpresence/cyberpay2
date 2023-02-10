// To parse this JSON data, do
//
//     final verifyOtpResponse = verifyOtpResponseFromJson(jsonString);

import 'dart:convert';

VerifyOtpResponse verifyOtpResponseFromJson(String str) => VerifyOtpResponse.fromJson(json.decode(str));

String verifyOtpResponseToJson(VerifyOtpResponse data) => json.encode(data.toJson());

class VerifyOtpResponse {
    VerifyOtpResponse({
       required this.succeeded,
       required this.message,
    });

    bool succeeded;
    String message;

    factory VerifyOtpResponse.fromJson(Map<String, dynamic> json) => VerifyOtpResponse(
        succeeded: json["succeeded"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "succeeded": succeeded,
        "message": message,
    };
}
