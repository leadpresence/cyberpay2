// To parse this JSON data, do
//
//     final initiateWalletToWalletResponse = initiateWalletToWalletResponseFromMap(jsonString);

import 'dart:convert';

InitiateWalletToWalletResponse initiateWalletToWalletResponseFromMap(String str) => InitiateWalletToWalletResponse.fromMap(json.decode(str));

String initiateWalletToWalletResponseToMap(InitiateWalletToWalletResponse data) => json.encode(data.toMap());

class InitiateWalletToWalletResponse {
    InitiateWalletToWalletResponse({
     required   this.status,
     required   this.statusCode,
      required  this.message,
      required  this.result,
    });

    int status;
    int statusCode;
    String message;
    Result result;

    factory InitiateWalletToWalletResponse.fromMap(Map<String, dynamic> json) => InitiateWalletToWalletResponse(
        status: json["status"],
        statusCode: json["statusCode"],
        message: json["message"],
        result: Result.fromMap(json["result"]),
    );

    Map<String, dynamic> toMap() => {
        "status": status,
        "statusCode": statusCode,
        "message": message,
        "result": result.toMap(),
    };
}

class Result {
    Result({
      required  this.reference,
     required   this.message,
    });

    String reference;
    String message;

    factory Result.fromMap(Map<String, dynamic> json) => Result(
        reference: json["reference"],
        message: json["message"],
    );

    Map<String, dynamic> toMap() => {
        "reference": reference,
        "message": message,
    };
}
