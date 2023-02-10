// To parse this JSON data, do
//
//     final bankCustomerVerificationResponse = bankCustomerVerificationResponseFromJson(jsonString);

import 'dart:convert';

BankCustomerVerificationResponse bankCustomerVerificationResponseFromJson(String str) => BankCustomerVerificationResponse.fromJson(json.decode(str));

String bankCustomerVerificationResponseToJson(BankCustomerVerificationResponse data) => json.encode(data.toJson());

class BankCustomerVerificationResponse {
    BankCustomerVerificationResponse({
        required   this.code,
        required   this.succeeded,
        required   this.data,
    });

    String code;
    bool succeeded;
    BankCustomerVerificationData? data;

    factory BankCustomerVerificationResponse.fromJson(Map<String, dynamic> json) => BankCustomerVerificationResponse(
        code: json["code"] == null ? null : json["code"],
        succeeded: json["succeeded"] == null ? null : json["succeeded"],
        data: json["data"] == null ? null : BankCustomerVerificationData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "code": code == null ? null : code,
        "succeeded": succeeded == null ? null : succeeded,
        "data": data == null ? null : data?.toJson(),
    };
}

class BankCustomerVerificationData {
    BankCustomerVerificationData({
        required this.accountName,
    });

    String accountName;

    factory BankCustomerVerificationData.fromJson(Map<String, dynamic> json) => BankCustomerVerificationData(
        accountName: json["accountName"] == null ? null : json["accountName"],
    );

    Map<String, dynamic> toJson() => {
        "accountName": accountName == null ? null : accountName,
    };
}
