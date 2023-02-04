// To parse this JSON data, do
//
//     final bankPayoutResponse = bankPayoutResponseFromJson(jsonString);

import 'dart:convert';

BankPayoutResponse bankPayoutResponseFromJson(String str) => BankPayoutResponse.fromJson(json.decode(str));

String bankPayoutResponseToJson(BankPayoutResponse data) => json.encode(data.toJson());

class BankPayoutResponse {
    BankPayoutResponse({
        required  this.succeeded,
        required   this.message,
        required   this.data,
    });

    bool succeeded;
    String message;
    String data;

    factory BankPayoutResponse.fromJson(Map<String, dynamic> json) => BankPayoutResponse(
        succeeded: json["succeeded"] == null ? null : json["succeeded"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : json["data"],
    );

    Map<String, dynamic> toJson() => {
        "succeeded": succeeded == null ? null : succeeded,
        "message": message == null ? null : message,
        "data": data == null ? null : data,
    };
}
