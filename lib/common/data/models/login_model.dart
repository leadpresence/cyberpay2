import 'package:flutter/foundation.dart';

import '../../utils/cryto_helper.dart';

class LoginModel {
  late String _userName; //phone Number
  late String _password;

  LoginModel({required userName, required password}) {
    _userName = CryptoHelper.encrypt(userName);
    _password = CryptoHelper.encrypt(password);
  }

  String get decryptedUserName => CryptoHelper.decrypt(_userName);
  String get decryptedPassword => CryptoHelper.decrypt(_password);

  Map<String, dynamic> toJson() {
      return {
          'userName': _userName,
          'password': _password,
      };
  }

  LoginModel.fromData(Map<String, dynamic> data)
      : _userName = data['userName'],
          _password = data['password'];

  @override
  String toString() {
    return "username: $_userName, password: $_password";
  }
}
