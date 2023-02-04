// To parse this JSON data, do
//
//     final payBillRequest = payBillRequestFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/cupertino.dart';

PayBillRequest payBillRequestFromJson(String str) => PayBillRequest.fromJson(json.decode(str));

String payBillRequestToJson(PayBillRequest data) => json.encode(data.toJson());

class PayBillRequest {
    PayBillRequest({
       required this.paymentCode,
        required  this.amount,
        required  this.customerId,
        required  this.customerMobile,
        required this.customerEmail,
        required   this.businessWalletId,
        required this.customerWalletId,
        required  this.merchantRef,
    });

    String paymentCode;
    int amount;
    String customerId;
    String customerMobile;
    String customerEmail;
    String businessWalletId;
    String customerWalletId;
    String merchantRef;

    factory PayBillRequest.fromJson(Map<String, dynamic> json) => PayBillRequest(
        paymentCode: json["paymentCode"],
        amount: json["amount"],
        customerId: json["customerId"],
        customerMobile: json["customerMobile"],
        customerEmail: json["customerEmail"],
        businessWalletId: json["businessWalletId"],
        customerWalletId: json["customerWalletId"],
        merchantRef: json["merchantRef"],
    );

    Map<String, dynamic> toJson() => {
        "paymentCode": paymentCode,
        "amount": amount,
        "customerId": customerId,
        "customerMobile": customerMobile,
        "customerEmail": customerEmail,
        "businessWalletId": businessWalletId,
        "customerWalletId": customerWalletId,
        "merchantRef": merchantRef,
    };
}
