// To parse this JSON data, do
//
//     final verifyOtpResponse = verifyOtpResponseFromMap(jsonString);

import 'dart:convert';

VerifyOtpResponse verifyOtpResponseFromMap(String str) => VerifyOtpResponse.fromMap(json.decode(str));

String verifyOtpResponseToMap(VerifyOtpResponse data) => json.encode(data.toMap());

///
class VerifyOtpResponse {
    ///
    VerifyOtpResponse({
        required this.succeeded,
        required this.message,
        this.data,
    });

    bool succeeded;
    String message;
    dynamic data;

    VerifyOtpResponse copyWith({
        required bool succeeded,
        required String message,
        dynamic data,
    }) =>
        VerifyOtpResponse(
            succeeded: succeeded ?? this.succeeded,
            message: message ?? this.message,
            data: data ?? this.data,
        );

    factory VerifyOtpResponse.fromMap(Map<String, dynamic> json) => VerifyOtpResponse(
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
