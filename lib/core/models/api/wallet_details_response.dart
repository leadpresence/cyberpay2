// To parse this JSON data, do
//
//     final walletDetailsResponse = walletDetailsResponseFromMap(jsonString);

import 'dart:convert';

WalletDetailsResponse walletDetailsResponseFromMap(String str) =>
    WalletDetailsResponse.fromMap(json.decode(str));

String walletDetailsResponseToMap(WalletDetailsResponse data) =>
    json.encode(data.toMap());

class WalletDetailsResponse {
  WalletDetailsResponse({
    required this.status,
    required this.statusCode,
    required this.message,
    required this.result,
  });

  int status;
  int statusCode;
  String message;
  WalletDetails result;

  factory WalletDetailsResponse.fromMap(Map<String, dynamic> json) =>
      WalletDetailsResponse(
        status: json["status"],
        statusCode: json["statusCode"],
        message: json["message"],
        result: WalletDetails.fromMap(json["result"]),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "statusCode": statusCode,
        "message": message,
        "result": result.toMap(),
      };
}

class WalletDetails {
  WalletDetails({
    required this.walletId,
    required this.createdOn,
    required this.walletStatus,
    this.balance = 0,
    required this.mobileNo,
    required this.businessCode,
  });

  String walletId;
  DateTime createdOn;
  int walletStatus;
  int balance;
  String mobileNo;
  String businessCode;

  factory WalletDetails.fromMap(Map<String, dynamic> json) => WalletDetails(
        walletId: json["walletId"],
        createdOn: DateTime.parse(json["createdOn"]),
        walletStatus: json["walletStatus"],
        balance: json["balance"],
        mobileNo: json["mobileNo"],
        businessCode: json["businessCode"],
      );

  Map<String, dynamic> toMap() => {
        "walletId": walletId,
        "createdOn": createdOn.toIso8601String(),
        "walletStatus": walletStatus,
        "balance": balance,
        "mobileNo": mobileNo,
        "businessCode": businessCode,
      };
}
