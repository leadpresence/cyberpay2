// To parse this JSON data, do
//
//     final bankPayoutRequest = bankPayoutRequestFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/material.dart';

BankPayoutRequest bankPayoutRequestFromJson(String str) =>
    BankPayoutRequest.fromJson(json.decode(str));

String bankPayoutRequestToJson(BankPayoutRequest data) =>
    json.encode(data.toJson());

class BankPayoutRequest {
  BankPayoutRequest({
    required  this.userPin,
    required  this.customerWalletCode,
    required  this.businessCode,
    required  this.beneficiaryLastName,
    required  this.beneficiaryOtherName,
    required  this.senderLastName,
    required  this.senderOtherName,
    required  this.amount,
    required  this.accountNumber,
    required  this.bankCode,
    this.webHook = '',
    required  this.merchantRef,
    required  this.narration,
  });

  String userPin;
  String customerWalletCode;
  String businessCode;
  String beneficiaryLastName;
  String beneficiaryOtherName;
  String senderLastName;
  String senderOtherName;
  int amount;
  String accountNumber;
  String bankCode;
  String webHook;
  String merchantRef;
  String narration;

  factory BankPayoutRequest.fromJson(Map<String, dynamic> json) =>
      BankPayoutRequest(
        userPin: json["userPin"] == null ? null : json["userPin"],
        customerWalletCode: json["customerWalletCode"] == null
            ? null
            : json["customerWalletCode"],
        businessCode:
            json["businessCode"] == null ? null : json["businessCode"],
        beneficiaryLastName: json["beneficiaryLastName"] == null
            ? null
            : json["beneficiaryLastName"],
        beneficiaryOtherName: json["beneficiaryOtherName"] == null
            ? null
            : json["beneficiaryOtherName"],
        senderLastName:
            json["senderLastName"] == null ? null : json["senderLastName"],
        senderOtherName:
            json["senderOtherName"] == null ? null : json["senderOtherName"],
        amount: json["amount"] == null ? null : json["amount"],
        accountNumber:
            json["accountNumber"] == null ? null : json["accountNumber"],
        bankCode: json["bankCode"] == null ? null : json["bankCode"],
        webHook: json["webHook"] == null ? null : json["webHook"],
        merchantRef: json["merchantRef"] == null ? null : json["merchantRef"],
        narration: json["narration"] == null ? null : json["narration"],
      );

  Map<String, dynamic> toJson() => {
        "userPin": userPin == null ? null : userPin,
        "customerWalletCode":
            customerWalletCode == null ? null : customerWalletCode,
        "businessCode": businessCode == null ? null : businessCode,
        "beneficiaryLastName":
            beneficiaryLastName == null ? null : beneficiaryLastName,
        "beneficiaryOtherName":
            beneficiaryOtherName == null ? null : beneficiaryOtherName,
        "senderLastName": senderLastName == null ? null : senderLastName,
        "senderOtherName": senderOtherName == null ? null : senderOtherName,
        "amount": amount == null ? null : amount,
        "accountNumber": accountNumber == null ? null : accountNumber,
        "bankCode": bankCode == null ? null : bankCode,
        "webHook": webHook == null ? null : webHook,
        "merchantRef": merchantRef == null ? null : merchantRef,
        "narration": narration == null ? null : narration,
      };
}
