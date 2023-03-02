// To parse this JSON data, do
//
//     final fundCustomerWalletRequest = fundCustomerWalletRequestFromMap(jsonString);

import 'dart:convert';

import 'package:flutter/cupertino.dart';

FundCustomerWalletRequest fundCustomerWalletRequestFromMap(String str) =>
    FundCustomerWalletRequest.fromMap(json.decode(str));

String fundCustomerWalletRequestToMap(FundCustomerWalletRequest data) =>
    json.encode(data.toMap());

class FundCustomerWalletRequest {
  FundCustomerWalletRequest({
    required  this.walletId,
    required  this.merchantRef,
    required  this.amount,
    required  this.description,
    required  this.customerName,
    required  this.customerEmail,
    required  this.customerMobile,
    required  this.returnUrl,
  });

  String walletId;
  String merchantRef;
  int amount;
  String description;
  String customerName;
  String customerEmail;
  String customerMobile;
  String returnUrl;

  factory FundCustomerWalletRequest.fromMap(Map<String, dynamic> json) =>
      FundCustomerWalletRequest(
        walletId: json["walletId"] == null ? null : json["walletId"],
        merchantRef: json["merchantRef"] == null ? null : json["merchantRef"],
        amount: json["amount"] == null ? null : json["amount"],
        description: json["description"] == null ? null : json["description"],
        customerName:
            json["customerName"] == null ? null : json["customerName"],
        customerEmail:
            json["customerEmail"] == null ? null : json["customerEmail"],
        customerMobile:
            json["customerMobile"] == null ? null : json["customerMobile"],
        returnUrl: json["returnUrl"] == null ? null : json["returnUrl"],
      );

  Map<String, dynamic> toMap() => {
        "walletId": walletId == null ? null : walletId,
        "merchantRef": merchantRef == null ? null : merchantRef,
        "amount": amount == null ? null : amount,
        "description": description == null ? null : description,
        "customerName": customerName == null ? null : customerName,
        "customerEmail": customerEmail == null ? null : customerEmail,
        "customerMobile": customerMobile == null ? null : customerMobile,
        "returnUrl": returnUrl == null ? null : returnUrl,
      };
}
