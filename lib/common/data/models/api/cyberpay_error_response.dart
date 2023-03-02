// To parse this JSON data, do
//
//     final cyberpayErrorResponse = cyberpayErrorResponseFromJson(jsonString);

import 'dart:convert';

CyberpayErrorResponse cyberpayErrorResponseFromJson(String str) => CyberpayErrorResponse.fromJson(json.decode(str));

String cyberpayErrorResponseToJson(CyberpayErrorResponse data) => json.encode(data.toJson());

///
class CyberpayErrorResponse {
    ///
    CyberpayErrorResponse({
       required this.code,
        required this.message,
       required this.succeeded,
    });

    String code;
    String message;
    bool succeeded;

    factory CyberpayErrorResponse.fromJson(Map<String, dynamic> json) => CyberpayErrorResponse(
        code: json['code'],
        message: json['message'],
        succeeded: json['succeeded'],
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "succeeded": succeeded,
    };
}
