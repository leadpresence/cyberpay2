// To parse this JSON data, do
//
//     final walletDetailsRequest = walletDetailsRequestFromMap(jsonString);

import 'dart:convert';

import 'package:flutter/cupertino.dart';

WalletDetailsRequest walletDetailsRequestFromMap(String str) => WalletDetailsRequest.fromMap(json.decode(str));

String walletDetailsRequestToMap(WalletDetailsRequest data) => json.encode(data.toMap());

class WalletDetailsRequest {
    WalletDetailsRequest({
       required this.walletId,
    });

    String walletId;

    factory WalletDetailsRequest.fromMap(Map<String, dynamic> json) => WalletDetailsRequest(
        walletId: json["WalletId"],
    );

    Map<String, dynamic> toMap() => {
        "WalletId": walletId,
    };
}
