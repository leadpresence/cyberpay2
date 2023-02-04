// To parse this JSON data, do
//
//     final cyberpayLoginRequest = cyberpayLoginRequestFromMap(jsonString);

import 'dart:convert';

import 'package:flutter/cupertino.dart';

CyberpayLoginRequest cyberpayLoginRequestFromMap(String str) => CyberpayLoginRequest.fromMap(json.decode(str));

String cyberpayLoginRequestToMap(CyberpayLoginRequest data) => json.encode(data.toMap());

class CyberpayLoginRequest {
    CyberpayLoginRequest({
       required this.mobileNumber,
        required this.password,
    });

    String mobileNumber;
    String password;

    factory CyberpayLoginRequest.fromMap(Map<String, dynamic> json) => CyberpayLoginRequest(
        mobileNumber: json["MobileNumber"],
        password: json["Password"],
    );

    Map<String, dynamic> toMap() => {
        "MobileNumber": mobileNumber,
        "Password": password,
    };
}
