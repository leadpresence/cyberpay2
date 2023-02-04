import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class CyberpayContactModel extends Equatable {
  final String displayName;

  final String phoneNumber;

  final String userName;

  final bool isUserCyberpayMember;

  final String walletId;

  final String avatarUrl;

  @override
  String toString() {
    return 'CyberpayContactModel{displayName: $displayName, isUserCyberpayMember: $isUserCyberpayMember, phoneNumber: $phoneNumber}';
  }

  // @override
  // bool operator ==(o) =>
  //     o is CyberpayContactModel &&
  //     displayName == o.displayName;
  //
  // @override
  // int get hashCode => hash2(displayName.hashCode, walletId.hashCode);

  CyberpayContactModel(
      {required this.displayName,
      required this.phoneNumber,
      required this.userName,
      required this.isUserCyberpayMember,
      required this.walletId,
      required this.avatarUrl});



  @override
  List<Object> get props => [displayName];


}
