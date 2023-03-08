import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

part 'local_user.g.dart';

/// LocalUser
 @HiveType(typeId: 1)
class LocalUser {
   @HiveField(0)
  String id;
   @HiveField(1)
  final String firstName;
   @HiveField(2)
  final String lastName;
   @HiveField(3)
  final String email;
   @HiveField(4)
  final String phoneDialCode;
   @HiveField(5)
  final String phoneNumber;
   @HiveField(6)
  final String userRole;
   @HiveField(7)
  final String bvnNumber;

  // final bool isBvnVerified;
   @HiveField(8)
  final bool isPhoneNumberVerified;
   @HiveField(9)
  final String walletId;
  final String walletAccountNumberId;
   @HiveField(10)
  final String businessCode;
   @HiveField(11)
  final int walletAmount;
   @HiveField(12)
  final int cyberpayUserId;
   @HiveField(13)
  final String referralCode;
   @HiveField(14)
  final String authToken;

  /// constructor LocalUser
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
    this.walletAccountNumberId = '',
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
        walletAccountNumberId = data['walletAccountNumberId'],
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
    return 'LocalUser{email: $email, phoneNumber: $phoneNumber, email:$email}';
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
