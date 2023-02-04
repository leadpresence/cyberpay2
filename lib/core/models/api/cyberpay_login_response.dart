// To parse this JSON data, do
//
//     final cyberpayLoginResponse = cyberpayLoginResponseFromMap(jsonString);

import 'dart:convert';

CyberpayLoginResponse cyberpayLoginResponseFromMap(String str) => CyberpayLoginResponse.fromMap(json.decode(str));

String cyberpayLoginResponseToMap(CyberpayLoginResponse data) => json.encode(data.toMap());

class CyberpayLoginResponse {
    CyberpayLoginResponse({
        required this.status,
       required this.statusCode,
       required this.message,
        required this.result,
    });

    int status;
    int statusCode;
    String message;
    Result result;

    factory CyberpayLoginResponse.fromMap(Map<String, dynamic> json) => CyberpayLoginResponse(
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
      required  this.userId,
        required this.authToken,
       required this.userName,
       required this.email,
       required this.userType,
       required this.profilePicture,
        required this.mobileNo,
        required this.walletAmount,
       required this.dateOfBirth,
        required this.firstName,
        required this.lastName,
       required  this.gender,
       required this.userChatId,
       required this.countryCode,
       required this.walletCode,
       required this.adminChatId,
        required this.isRegister,
       required this.businessCode,
    });

    int userId;
    String authToken;
    String userName;
    String email;
    int userType;
    String profilePicture;
    String mobileNo;
    int walletAmount;
    String dateOfBirth;
    String firstName;
    String lastName;
    int gender;
    String userChatId;
    String countryCode;
    String walletCode;
    String adminChatId;
    bool isRegister;
    String businessCode;

    factory Result.fromMap(Map<String, dynamic> json) => Result(
        userId: json["userId"],
        authToken: json["authToken"],
        userName: json["userName"],
        email: json["email"],
        userType: json["userType"],
        profilePicture: json["profilePicture"],
        mobileNo: json["mobileNo"],
        walletAmount: json["walletAmount"],
        dateOfBirth: json["dateOfBirth"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        gender: json["gender"],
        userChatId: json["userChatId"],
        countryCode: json["countryCode"],
        walletCode: json["walletCode"],
        adminChatId: json["adminChatId"],
        isRegister: json["isRegister"],
        businessCode: json["businessCode"],
    );

    Map<String, dynamic> toMap() => {
        "userId": userId,
        "authToken": authToken,
        "userName": userName,
        "email": email,
        "userType": userType,
        "profilePicture": profilePicture,
        "mobileNo": mobileNo,
        "walletAmount": walletAmount,
        "dateOfBirth": dateOfBirth,
        "firstName": firstName,
        "lastName": lastName,
        "gender": gender,
        "userChatId": userChatId,
        "countryCode": countryCode,
        "walletCode": walletCode,
        "adminChatId": adminChatId,
        "isRegister": isRegister,
        "businessCode": businessCode,
    };
}
