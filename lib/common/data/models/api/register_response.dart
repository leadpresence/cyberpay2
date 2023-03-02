// To parse this JSON data, do
//
//     final registerResponse = registerResponseFromMap(jsonString);

import 'dart:convert';

RegisterResponse registerResponseFromMap(String str) => RegisterResponse.fromMap(json.decode(str));

String registerResponseToMap(RegisterResponse data) => json.encode(data.toMap());

class RegisterResponse {
  RegisterResponse({
    required this.succeeded,
    required this.message,
    required this.data,
  });

  bool succeeded;
  String message;
  Data data;

  RegisterResponse copyWith({
    required bool succeeded,
    required String message,
    required Data data,
  }) =>
      RegisterResponse(
        succeeded: succeeded ?? this.succeeded,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory RegisterResponse.fromMap(Map<String, dynamic> json) => RegisterResponse(
    succeeded: json["succeeded"],
    message: json["message"],
    data: Data.fromMap(json["data"]),
  );

  Map<String, dynamic> toMap() => {
    "succeeded": succeeded,
    "message": message,
    "data": data.toMap(),
  };
}

class Data {
  Data({
    required this.id,
    required this.otpGeneratedDateTime,
    required this.message,
    required this.otpExpiresIn,
  });

  int id;
  String otpGeneratedDateTime;
  String message;
  int otpExpiresIn;

  Data copyWith({
    int? id,
    String? otpGeneratedDateTime,
    String? message,
    int? otpExpiresIn,
  }) =>
      Data(
        id: id ?? this.id,
        otpGeneratedDateTime: otpGeneratedDateTime ?? this.otpGeneratedDateTime,
        message: message ?? this.message,
        otpExpiresIn: otpExpiresIn ?? this.otpExpiresIn,
      );

  factory Data.fromMap(Map<String, dynamic> json) => Data(
    id: json["id"],
    otpGeneratedDateTime: json["otpGeneratedDateTime"],
    message: json["message"],
    otpExpiresIn: json["otpExpiresIn"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "otpGeneratedDateTime": otpGeneratedDateTime,
    "message": message,
    "otpExpiresIn": otpExpiresIn,
  };
}
