// To parse this JSON data, do
//
//     final loginRequest = loginRequestFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

LoginRequest loginRequestFromMap(String str) => LoginRequest.fromMap(json.decode(str));

String loginRequestToMap(LoginRequest data) => json.encode(data.toMap());

///
class LoginRequest {
  ///
  LoginRequest({
    required this.mobileNumber,
    required this.password,
  });

  final String mobileNumber;
  final String password;

  LoginRequest copyWith({
    required String mobileNumber,
    required String password,
  }) =>
      LoginRequest(
        mobileNumber: mobileNumber ?? this.mobileNumber,
        password: password ?? this.password,
      );

  factory LoginRequest.fromMap(Map<String, dynamic> json) => LoginRequest(
    mobileNumber: json["MobileNumber"],
    password: json["Password"],
  );

  Map<String, dynamic> toMap() => {
    "MobileNumber": mobileNumber,
    "Password": password,
  };
}
