// To parse this JSON data, do
//
//     final payBillResponse = payBillResponseFromJson(jsonString);

import 'dart:convert';

PayBillResponse payBillResponseFromJson(String str) =>
    PayBillResponse.fromJson(json.decode(str));

String payBillResponseToJson(PayBillResponse data) =>
    json.encode(data.toJson());

class PayBillResponse {
  PayBillResponse({
    required this.succeeded,
   required this.message,
  });

  bool succeeded;
  String message;

  factory PayBillResponse.fromJson(Map<String, dynamic> json) =>
      PayBillResponse(
        succeeded: json["succeeded"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "succeeded": succeeded,
        "message": message,
      };
}
