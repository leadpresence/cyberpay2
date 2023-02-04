// To parse this JSON data, do
//
//     final billersCustomerVerificationResponse = billersCustomerVerificationResponseFromJson(jsonString);

import 'dart:convert';

BillersCustomerVerificationResponse billersCustomerVerificationResponseFromJson(String str) => BillersCustomerVerificationResponse.fromJson(json.decode(str));

String billersCustomerVerificationResponseToJson(BillersCustomerVerificationResponse data) => json.encode(data.toJson());

class BillersCustomerVerificationResponse {
    BillersCustomerVerificationResponse({
        required    this.succeeded,
        required     this.message,
        required     this.data,
    });

    bool succeeded;
    String message;
    BillersCustomerVerificationData? data;

    factory BillersCustomerVerificationResponse.fromJson(Map<String, dynamic> json) => BillersCustomerVerificationResponse(
        succeeded: json["succeeded"] == null ? null : json["succeeded"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : BillersCustomerVerificationData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "succeeded": succeeded == null ? null : succeeded,
        "message": message == null ? null : message,
        "data": data == null ? null : data?.toJson(),
    };
}

class BillersCustomerVerificationData {
    BillersCustomerVerificationData({
        required  this.responseCode,
        required  this.responseMessage,
        required  this.name,
        required  this.balance,
        required   this.address,
        required   this.contactNo,
        required   this.minAmount,
        required  this.id,
        required  this.accountNo,
        required  this.businessUnitId,
        required  this.businessUnit,
        required  this.accountTypeDesc,
        required  this.accountType,
        required  this.meterNo,
        required  this.payentCode,
        required this.customerId,
        required  this.amount,
    });

    String responseCode;
    String responseMessage;
    String name;
    double balance;
    String address;
    String contactNo;
    double minAmount;
    String id;
    String accountNo;
    String businessUnitId;
    String businessUnit;
    String accountTypeDesc;
    String accountType;
    String meterNo;
    String payentCode;
    String customerId;
    double amount;

    factory BillersCustomerVerificationData.fromJson(Map<String, dynamic> json) => BillersCustomerVerificationData(
        responseCode: json["responseCode"] == null ? null : json["responseCode"],
        responseMessage: json["responseMessage"] == null ? null : json["responseMessage"],
        name: json["name"] == null ? null : json["name"],
        balance: json["balance"] == null ? null : json["balance"],
        address: json["address"] == null ? null : json["address"],
        contactNo: json["contactNo"] == null ? null : json["contactNo"],
        minAmount: json["minAmount"] == null ? null : json["minAmount"],
        id: json["id"] == null ? null : json["id"],
        accountNo: json["accountNo"] == null ? null : json["accountNo"],
        businessUnitId: json["businessUnitID"] == null ? null : json["businessUnitID"],
        businessUnit: json["businessUnit"] == null ? null : json["businessUnit"],
        accountTypeDesc: json["accountTypeDesc"] == null ? null : json["accountTypeDesc"],
        accountType: json["accountType"] == null ? null : json["accountType"],
        meterNo: json["meterNo"] == null ? null : json["meterNo"],
        payentCode: json["payentCode"] == null ? null : json["payentCode"],
        customerId: json["customerId"] == null ? null : json["customerId"],
        amount: json["amount"] == null ? null : json["amount"],
    );

    Map<String, dynamic> toJson() => {
        "responseCode": responseCode == null ? null : responseCode,
        "responseMessage": responseMessage == null ? null : responseMessage,
        "name": name == null ? null : name,
        "balance": balance == null ? null : balance,
        "address": address == null ? null : address,
        "contactNo": contactNo == null ? null : contactNo,
        "minAmount": minAmount == null ? null : minAmount,
        "id": id == null ? null : id,
        "accountNo": accountNo == null ? null : accountNo,
        "businessUnitID": businessUnitId == null ? null : businessUnitId,
        "businessUnit": businessUnit == null ? null : businessUnit,
        "accountTypeDesc": accountTypeDesc == null ? null : accountTypeDesc,
        "accountType": accountType == null ? null : accountType,
        "meterNo": meterNo == null ? null : meterNo,
        "payentCode": payentCode == null ? null : payentCode,
        "customerId": customerId == null ? null : customerId,
        "amount": amount == null ? null : amount,
    };
}
