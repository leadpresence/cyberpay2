// To parse this JSON data, do
//
//     final newCustomerWalletRequest = newCustomerWalletRequestFromMap(jsonString);

import 'dart:convert';

import 'package:flutter/cupertino.dart';

NewCustomerWalletRequest newCustomerWalletRequestFromMap(String str) =>
    NewCustomerWalletRequest.fromMap(json.decode(str));

String newCustomerWalletRequestToMap(NewCustomerWalletRequest data) =>
    json.encode(data.toMap());

class NewCustomerWalletRequest {
  NewCustomerWalletRequest({
    required this.mobileNo,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.countryCode,
    required this.pin,
  });

  String mobileNo;
  String firstName;
  String lastName;
  String email;
  String password;
  String countryCode;
  String pin;

  factory NewCustomerWalletRequest.fromMap(Map<String, dynamic> json) =>
      NewCustomerWalletRequest(
        mobileNo: json["MobileNo"] ?? json["MobileNo"],
        firstName: json["FirstName"] ??  json["FirstName"],
        lastName: json["LastName"] ?? json["LastName"],
        email: json["Email"] ?? json["Email"],
        password: json["Password"] ?? json["Password"],
        countryCode: json["CountryCode"] ?? json["CountryCode"],
        pin: json["Pin"] ?? json["Pin"],
      );

  Map<String, dynamic> toMap() => {
        "MobileNo": mobileNo,
        "FirstName": firstName,
        "LastName": lastName,
        "Email": email,
        "Password": password,
        "CountryCode": countryCode,
        "Pin": pin,
      };
}
