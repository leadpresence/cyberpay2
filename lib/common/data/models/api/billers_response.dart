// To parse this JSON data, do
//
//     final billersRespone = billersResponeFromJson(jsonString);

import 'dart:convert';

import '../biller.dart';



BillersResponse billersResponseFromJson(String str) => BillersResponse.fromJson(json.decode(str));

String billersResponseToJson(BillersResponse data) => json.encode(data.toJson());

class BillersResponse {
    BillersResponse({
        required   this.succeeded,
        required   this.data,
    });

    bool succeeded = false;
    BillersData data;

    factory BillersResponse.fromJson(Map<String, dynamic> json) => BillersResponse(
        succeeded: json["succeeded"] == null ? null : json["succeeded"],
        data: json["data"] ?? BillersData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "succeeded": succeeded,
        "data": data  ,
    };
}

class BillersData {
    BillersData({
       required this.pageSize,
       required this.pageNumber,
       required this.totalSize,
       required this.items,
    });

    int pageSize;
    int pageNumber;
    int totalSize;
    List<Biller> items;

    factory BillersData.fromJson(Map<String, dynamic> json) => BillersData(
        pageSize: json["pageSize"],
        pageNumber: json["pageNumber"] ,
        totalSize: json["totalSize"] ,
        items: json["items"] ?? List<Biller>.from(json["items"].map((x) => Biller.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "pageSize": pageSize,
        "pageNumber": pageNumber ,
        "totalSize": totalSize  ,
        "items": items ?? List<dynamic>.from(items.map((x) => x.toJson())),
    };
}

