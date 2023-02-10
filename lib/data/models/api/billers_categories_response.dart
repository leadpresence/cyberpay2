// To parse this JSON data, do
//
//     final billerCategoriesResponse = billerCategoriesResponseFromJson(jsonString);

import 'dart:convert';

import '../../../core/models/biller_category.dart';


BillerCategoriesResponse billerCategoriesResponseFromJson(String str) => BillerCategoriesResponse.fromJson(json.decode(str));

String billerCategoriesResponseToJson(BillerCategoriesResponse data) => json.encode(data.toJson());

class BillerCategoriesResponse {
    BillerCategoriesResponse({
        required   this.succeeded,
        required    this.data,
    });

    bool succeeded;
    BillerCategoriesData? data;

    factory BillerCategoriesResponse.fromJson(Map<String, dynamic> json) => BillerCategoriesResponse(
        succeeded: json["succeeded"] ?? json["succeeded"],
        data: json["data"] == null ? null : BillerCategoriesData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "succeeded": succeeded,
        "data": data ?? data?.toJson(),
    };
}

class BillerCategoriesData {
    BillerCategoriesData({
        required  this.pageSize,
        required   this.pageNumber,
        required  this.totalSize,
        required  this.items,
    });

    int pageSize;
    int pageNumber;
    int totalSize;
    List<BillerCategory> items;

    factory BillerCategoriesData.fromJson(Map<String, dynamic> json) => BillerCategoriesData(
        pageSize: json["pageSize"] == null ? null : json["pageSize"],
        pageNumber: json["pageNumber"] == null ? null : json["pageNumber"],
        totalSize: json["totalSize"] == null ? null : json["totalSize"],
        items: json["items"]??List<BillerCategory>.from(json["items"].map((x) => BillerCategory.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "pageSize": pageSize ,
        "pageNumber": pageNumber,
        "totalSize": totalSize,
        "items":   List<dynamic>.from(items.map((x) => x.toJson())),
    };
}

