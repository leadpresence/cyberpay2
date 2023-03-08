// To parse this JSON data, do
//
//     final changePasswordRequest = changePasswordRequestFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ChangePasswordRequest changePasswordRequestFromMap(String str) => ChangePasswordRequest.fromMap(json.decode(str));

String changePasswordRequestToMap(ChangePasswordRequest data) => json.encode(data.toMap());

/// ChangePasswordRequest
class ChangePasswordRequest {
  /// constructor [ChangePasswordRequest]
  ChangePasswordRequest({
    required this.userId,
    required this.oldPassword,
    required this.newPassword,
  });

  final int userId;
  final String oldPassword;
  final String newPassword;

  ChangePasswordRequest copyWith({
    required int userId,
    required String oldPassword,
    required String newPassword,
  }) =>
      ChangePasswordRequest(
        userId: userId ?? this.userId,
        oldPassword: oldPassword ?? this.oldPassword,
        newPassword: newPassword ?? this.newPassword,
      );

  factory ChangePasswordRequest.fromMap(Map<String, dynamic> json) => ChangePasswordRequest(
    userId: json["userId"],
    oldPassword: json["oldPassword"],
    newPassword: json["newPassword"],
  );

  Map<String, dynamic> toMap() => {
    "userId": userId,
    "oldPassword": oldPassword,
    "newPassword": newPassword,
  };
}
