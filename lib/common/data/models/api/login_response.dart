// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

LoginResponse loginResponseFromMap(String str) => LoginResponse.fromMap(json.decode(str));

String loginResponseToMap(LoginResponse data) => json.encode(data.toMap());

/// LoginResponse
class LoginResponse {
  /// Constructor LoginResponse
  LoginResponse({
    required this.status,
    required this.statusCode,
    required this.message,
    required this.result,
  });

  final int? status;
  final int? statusCode;
  final String? message;
  final Result? result;

  LoginResponse copyWith({
    required  int status,
    required int statusCode,
    required  String message,
    required  Result result,
  }) =>
      LoginResponse(
        status: status ?? this.status,
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message,
        result: result ?? this.result,
      );

  factory LoginResponse.fromMap(Map<String, dynamic> json) => LoginResponse(
    status: json['status'],
    statusCode: json['statusCode'],
    message: json['message'],
    result: Result.fromMap(json['result']),
  );

  Map<String, dynamic> toMap() => {
    'status': status,
    'statusCode': statusCode,
    'message': message,
    'result': result?.toMap(),
  };
}
///
class Result {
  ///
  Result({
    required this.userId,
    required this.authToken,
    required this.userName,
    required this.email,
    required this.userType,
    required this.profilePicture,
    required this.mobileNo,
    required this.walletAmount,
    required this.dateOfBirth,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.userChatId,
    required this.countryCode,
    required this.walletCode,
    required this.adminChatId,
    required this.isRegister,
    required this.businessCode,
  });

  final int userId;
  final String authToken;
  final String userName;
  final String email;
  final int userType;
  final String profilePicture;
  final String mobileNo;
  final int walletAmount;
  final DateTime dateOfBirth;
  final String firstName;
  final String lastName;
  final int gender;
  final String userChatId;
  final String countryCode;
  final String walletCode;
  final String adminChatId;
  final bool isRegister;
  final String businessCode;

  Result copyWith({
    required int userId,
    required String authToken,
    required String userName,
    required  String email,
    required  int userType,
    required  String profilePicture,
    required String mobileNo,
    required  int walletAmount,
    required  DateTime dateOfBirth,
    required String firstName,
    required String lastName,
    required int gender,
    required  String userChatId,
    required  String countryCode,
    required String walletCode,
    required  String adminChatId,
    required  bool isRegister,
    required  String businessCode,
  }) =>
      Result(
        userId: userId ?? this.userId,
        authToken: authToken ?? this.authToken,
        userName: userName ?? this.userName,
        email: email ?? this.email,
        userType: userType ?? this.userType,
        profilePicture: profilePicture ?? this.profilePicture,
        mobileNo: mobileNo ?? this.mobileNo,
        walletAmount: walletAmount ?? this.walletAmount,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        gender: gender ?? this.gender,
        userChatId: userChatId ?? this.userChatId,
        countryCode: countryCode ?? this.countryCode,
        walletCode: walletCode ?? this.walletCode,
        adminChatId: adminChatId ?? this.adminChatId,
        isRegister: isRegister ?? this.isRegister,
        businessCode: businessCode ?? this.businessCode,
      );

  factory Result.fromMap(Map<String, dynamic> json) => Result(
    userId: json['userId'],
    authToken: json['authToken'],
    userName: json['userName'],
    email: json['email'],
    userType: json['userType'],
    profilePicture: json['profilePicture'],
    mobileNo: json['mobileNo'],
    walletAmount: json['walletAmount'],
    dateOfBirth: DateTime.parse(json['dateOfBirth']),
    firstName: json['firstName'],
    lastName: json['lastName'],
    gender: json['gender'],
    userChatId: json['userChatId'],
    countryCode: json['countryCode'],
    walletCode: json['walletCode'],
    adminChatId: json['adminChatId'],
    isRegister: json['isRegister'],
    businessCode: json['businessCode'],
  );

  Map<String, dynamic> toMap() => {
    'userId': userId,
    'authToken': authToken,
    'userName': userName,
    'email': email,
    'userType': userType,
    'profilePicture': profilePicture,
    'mobileNo': mobileNo,
    'walletAmount': walletAmount,
    'dateOfBirth': dateOfBirth.toIso8601String(),
    'firstName': firstName,
    'lastName': lastName,
    'gender': gender,
    'userChatId': userChatId,
    'countryCode': countryCode,
    'walletCode': walletCode,
    'adminChatId': adminChatId,
    'isRegister': isRegister,
    'businessCode': businessCode,
  };
}
