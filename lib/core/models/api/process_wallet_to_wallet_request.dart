// To parse this JSON data, do
//
//     final processWalletToWalletRequest = processWalletToWalletRequestFromMap(jsonString);

import 'dart:convert';

import 'package:flutter/cupertino.dart';

ProcessWalletToWalletRequest processWalletToWalletRequestFromMap(String str) => ProcessWalletToWalletRequest.fromMap(json.decode(str));

String processWalletToWalletRequestToMap(ProcessWalletToWalletRequest data) => json.encode(data.toMap());

class ProcessWalletToWalletRequest {
    ProcessWalletToWalletRequest({
       required this.reference,
        required this.pin,
    });

    String reference;
    String pin;

    factory ProcessWalletToWalletRequest.fromMap(Map<String, dynamic> json) => ProcessWalletToWalletRequest(
        reference: json["Reference"],
        pin: json["PIN"],
    );

    Map<String, dynamic> toMap() => {
        "Reference": reference,
        "PIN": pin,
    };
}
