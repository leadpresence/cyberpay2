// To parse this JSON data, do
//
//     final newCustomerWalletResponse = newCustomerWalletResponseFromJson(jsonString);

import 'dart:convert';

NewCustomerWalletResponse newCustomerWalletResponseFromJson(String str) => NewCustomerWalletResponse.fromMap(json.decode(str));

String newCustomerWalletResponseToJson(NewCustomerWalletResponse data) => json.encode(data.toMap());

class NewCustomerWalletResponse {
    NewCustomerWalletResponse({
       required this.id,
       required this.otpGeneratedDateTime,
       required this.message,
       required this.otpExpiresIn,
    });

    int id;
    String otpGeneratedDateTime;
    String message;
    int otpExpiresIn;

    factory NewCustomerWalletResponse.fromMap(Map<String, dynamic> json) => NewCustomerWalletResponse(
        id: json["id"] ??  json["id"],
        otpGeneratedDateTime: json["otpGeneratedDateTime"] ?? json["otpGeneratedDateTime"],
        message: json["message"] ?? json["message"],
        otpExpiresIn: json["otpExpiresIn"] ?? json["otpExpiresIn"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "otpGeneratedDateTime": otpGeneratedDateTime,
        "message": message,
        "otpExpiresIn": otpExpiresIn,
    };
}
