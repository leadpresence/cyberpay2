// To parse this JSON data, do
//
//     final billerPaymentItemsResponse = billerPaymentItemsResponseFromJson(jsonString);

import 'dart:convert';

import '../biller_payment_items.dart';

BillerPaymentItemsResponse billerPaymentItemsResponseFromJson(String str) => BillerPaymentItemsResponse.fromJson(json.decode(str));

String billerPaymentItemsResponseToJson(BillerPaymentItemsResponse data) => json.encode(data.toJson());

class BillerPaymentItemsResponse {
    BillerPaymentItemsResponse({
       required this.succeeded,
        required this.data,
    });

    bool succeeded;
    BillerPaymentItemsData data;

    factory BillerPaymentItemsResponse.fromJson(Map<String, dynamic> json) => BillerPaymentItemsResponse(
        succeeded: json["succeeded"],
        data: json["data"] ?? BillerPaymentItemsData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "succeeded": succeeded  ,
        "data": data ,
    };
}

class BillerPaymentItemsData {
    BillerPaymentItemsData({
       required this.pageSize,
        required this.pageNumber,
       required this.totalSize,
       required this.items,
    });

    int pageSize;
    int pageNumber;
    int totalSize;
    List<BillerPaymentItems> items;

    factory BillerPaymentItemsData.fromJson(Map<String, dynamic> json) => BillerPaymentItemsData(
        pageSize: json["pageSize"] == null ? null : json["pageSize"],
        pageNumber: json["pageNumber"] == null ? null : json["pageNumber"],
        totalSize: json["totalSize"] == null ? null : json["totalSize"],
        items: json["items"] ?? List<BillerPaymentItems>.from(json["items"].map((x) => BillerPaymentItems.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "pageSize": pageSize == null ? null : pageSize,
        "pageNumber": pageNumber == null ? null : pageNumber,
        "totalSize": totalSize == null ? null : totalSize,
        "items": items == null ? null : List<dynamic>.from(items.map((x) => x.toJson())),
    };
}


