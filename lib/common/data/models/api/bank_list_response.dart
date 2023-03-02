// To parse this JSON data, do
//
//     final bankListResponse = bankListResponseFromJson(jsonString);

import 'dart:convert';

BankListResponse bankListResponseFromJson(String str) => BankListResponse.fromJson(json.decode(str));

String bankListResponseToJson(BankListResponse data) => json.encode(data.toJson());

class BankListResponse {
    BankListResponse({
        required   this.code,
        required   this.succeeded,
        required   this.data,
    });

    String code;
    bool succeeded;
    List<BankItemData> data;

    factory BankListResponse.fromJson(Map<String, dynamic> json) => BankListResponse(
        code: json["code"] == null ? null : json["code"],
        succeeded: json["succeeded"] == null ? null : json["succeeded"],
        data: json["data"] = List<BankItemData>.from(json["data"].map((x) => BankItemData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "code": code == null ? null : code,
        "succeeded": succeeded == null ? null : succeeded,
        "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class BankItemData {
    BankItemData({
        required   this.bankCode,
        required   this.bankName,
        required  this.id,
    });

    String bankCode;
    String bankName;
    int id;

    factory BankItemData.fromJson(Map<String, dynamic> json) => BankItemData(
        bankCode: json["bankCode"] == null ? null : json["bankCode"],
        bankName: json["bankName"] == null ? null : json["bankName"],
        id: json["id"] == null ? null : json["id"],
    );

    Map<String, dynamic> toJson() => {
        "bankCode": bankCode == null ? null : bankCode,
        "bankName": bankName == null ? null : bankName,
        "id": id == null ? null : id,
    };
}
