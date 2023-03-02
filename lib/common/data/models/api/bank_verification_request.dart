// To parse this JSON data, do
//
//     final bankCustomerVerificationRequest = bankCustomerVerificationRequestFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/foundation.dart';

BankCustomerVerificationRequest bankCustomerVerificationRequestFromJson(String str) => BankCustomerVerificationRequest.fromJson(json.decode(str));

String bankCustomerVerificationRequestToJson(BankCustomerVerificationRequest data) => json.encode(data.toJson());

class BankCustomerVerificationRequest {
    BankCustomerVerificationRequest({
        required  this.bankCode,
        required  this.accountId,
    });

    String bankCode;
    String accountId;

    factory BankCustomerVerificationRequest.fromJson(Map<String, dynamic> json) => BankCustomerVerificationRequest(
        bankCode: json["bankCode"] == null ? null : json["bankCode"],
        accountId: json["accountId"] == null ? null : json["accountId"],
    );

    Map<String, dynamic> toJson() => {
        "bankCode": bankCode == null ? null : bankCode,
        "accountId": accountId == null ? null : accountId,
    };
}
