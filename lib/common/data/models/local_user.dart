import 'package:flutter/cupertino.dart';

class LocalUser {
  String id;
  final String firstName;
  final String lastName;
  final String email;
  final String phoneDialCode;
  final String phoneNumber;
  final String userRole;
  final String bvnNumber;
  // final bool isBvnVerified;
  final bool isPhoneNumberVerified;
  final String walletId;
  final String businessCode;
  final int walletAmount;
  final int cyberpayUserId;
  final String referralCode;
  final String authToken;

  LocalUser({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneDialCode,
    required this.phoneNumber,
    required this.userRole,
    required this.walletId,
    this.authToken = "",
    this.businessCode = "",
    this.walletAmount = 0,
    this.cyberpayUserId = 0,
    this.bvnNumber = "",
    // this.isBvnVerified = false,
    this.isPhoneNumberVerified = false,
    this.referralCode = "",
  });

  LocalUser.fromData(Map<String, dynamic> data)
      : id = data['id'],
        firstName = data['firstName'],
        lastName = data['lastName'],
        email = data['email'],
        phoneDialCode = data['phoneDialCode'],
        phoneNumber = data['phoneNumber'],
        userRole = data['userRole'],
        bvnNumber = data['bvnNumber'],
        // isBvnVerified = data['isBvnVerified'],
        walletAmount = data['walletAmount'],
        businessCode = data['businessCode'],
        isPhoneNumberVerified = data['isPhoneNumberVerified'],
        cyberpayUserId = data['cyberpayUserId'],
        authToken = data['authToken'],
        referralCode = data['referralCode'],
        walletId = data['walletId'];

  @override
  String toString() {
    return 'LocalUser{email: $email, phoneNumber: $phoneNumber}';
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phoneDialCode': phoneDialCode,
      'phoneNumber': phoneNumber,
      'userRole': userRole,
      'bvnNumber': bvnNumber,
      'businessCode': businessCode,
      // 'isBvnVerified': isBvnVerified,
      'isPhoneNumberVerified': isPhoneNumberVerified,
      'walletId': walletId,
      'walletAmount': walletAmount,
      'cyberpayUserId': cyberpayUserId,
      'referralCode': referralCode,
      'authToken': authToken,

    };
  }
}
