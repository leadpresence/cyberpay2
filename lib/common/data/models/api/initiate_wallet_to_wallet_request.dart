// To parse this JSON data, do
//
//     final initiateWalletToWalletRequest = initiateWalletToWalletRequestFromMap(jsonString);

import 'dart:convert';

import 'package:flutter/foundation.dart';


InitiateWalletToWalletRequest initiateWalletToWalletRequestFromMap(
        String str) =>
    InitiateWalletToWalletRequest.fromMap(json.decode(str));

String initiateWalletToWalletRequestToMap(InitiateWalletToWalletRequest data) =>
    json.encode(data.toMap());

class InitiateWalletToWalletRequest {
  InitiateWalletToWalletRequest({
    required this.senderWalletId,
    required this.receiverWalletId,
    required this.merchantRef,
    required this.amount,
    required this.description,
    required this.businessCode,
  });

  String senderWalletId;
  String receiverWalletId;
  String merchantRef;
  int amount;
  String description;
  String businessCode;

  factory InitiateWalletToWalletRequest.fromMap(Map<String, dynamic> json) =>
      InitiateWalletToWalletRequest(
        senderWalletId: json["SenderWalletId"],
        receiverWalletId: json["ReceiverWalletId"],
        merchantRef: json["MerchantRef"],
        amount: json["Amount"],
        description: json["Description"],
        businessCode: json["BusinessCode"],
      );

  Map<String, dynamic> toMap() => {
        "SenderWalletId": senderWalletId,
        "ReceiverWalletId": receiverWalletId,
        "MerchantRef": merchantRef,
        "Amount": amount,
        "Description": description,
        "BusinessCode": businessCode,
      };
}
