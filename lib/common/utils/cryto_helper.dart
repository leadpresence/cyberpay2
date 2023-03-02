import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart';

import '../configs/configs.dart';

class CryptoHelper {

  static String _getShaHashOfKey({int length = 32}) {
    List<int> bytes = utf8.encode(AppConfigs.ENCRYPT_KEY);

    String result;

    String hashKey = sha256.convert(bytes).toString();

    if (length > hashKey.toString().length) {
      result = hashKey.toString();
    } else {
      result = hashKey.toString().substring(0, length);
    }

    return result;
  }

  static String encrypt(String value) {
    try {
      final key = Key.fromUtf8(_getShaHashOfKey());
      final iv = IV.fromUtf8(AppConfigs.INITIALISING_VECTOR_KEY);

      final encrypter =
      Encrypter(AES(key, mode: AESMode.cbc, padding: 'PKCS7'));

      return encrypter.encrypt(value, iv: iv).base64;
    } catch (error) {
//      print(error);
      return '';
    }
  }

  static String decrypt(String secret) {
    try {

      final key = Key.fromUtf8(_getShaHashOfKey());
      final iv = IV.fromUtf8(AppConfigs.INITIALISING_VECTOR_KEY);

      final encrypter =
      Encrypter(AES(key, mode: AESMode.cbc, padding: 'PKCS7'));

      return encrypter.decrypt64(secret, iv: iv);
    } catch (error) {
      return '';
    }
  }
}
