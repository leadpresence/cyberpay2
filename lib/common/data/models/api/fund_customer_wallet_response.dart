// To parse this JSON data, do
//
//     final fundCustomerWalletResponse = fundCustomerWalletResponseFromJson(jsonString);

import 'dart:convert';

FundCustomerWalletResponse fundCustomerWalletResponseFromJson(String str) => FundCustomerWalletResponse.fromJson(json.decode(str));

String fundCustomerWalletResponseToJson(FundCustomerWalletResponse data) => json.encode(data.toJson());

class FundCustomerWalletResponse {
    FundCustomerWalletResponse({
        required this.code,
      required  this.succeeded,
      required  this.data,
    });

    String code;
    bool succeeded;
    Data data;

    factory FundCustomerWalletResponse.fromJson(Map<String, dynamic> json) => FundCustomerWalletResponse(
        code: json["code"] ?? json["code"],
        succeeded: json["succeeded"]?? json["succeeded"],
        data: json["data"]?? Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "code": code == null ? null : code,
        "succeeded": succeeded == null ? null : succeeded,
        "data": data == null ? null : data.toJson(),
    };
}

class Data {
    Data({
        required this.transactionReference,
       required  this.charge,
       required this.redirectUrl,
    });

    String transactionReference;
    int charge;
    String redirectUrl;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        transactionReference: json["transactionReference"] ?? json["transactionReference"],
        charge: json["charge"] ?? json["charge"],
        redirectUrl: json["redirectUrl"] ?? json["redirectUrl"],
    );

    Map<String, dynamic> toJson() => {
        "transactionReference": transactionReference ?? transactionReference,
        "charge": charge  ,
        "redirectUrl": redirectUrl  ,
    };
}
