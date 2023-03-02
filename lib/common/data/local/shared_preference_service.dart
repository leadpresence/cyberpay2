
import 'package:cyberpay_mobile_2/common/data/local/shared_pref_constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// shared preferences service
final sharedPreferencesServiceProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});


///  SharePreferenceService
extension  SharePreferenceService on SharedPreferences{
  /// Save  preference Methods

  void _saveToPreferences<T>(String key, T content) {
    if (content is String) {
      setString(key, content);
    }
    if (content is bool) {
      setBool(key, content);
    }
    if (content is int) {
      setInt(key, content);
    }
    if (content is double) {
      setDouble(key, content);
    }
    if (content is List<String>) {
      setStringList(key, content);
    }
  }

  /// Retrieve Items
  dynamic _getFromDisk(String key) {
    final value = get(key);

    return value;
  }

  /// ----------------------------METHODS----------------------------------------
  /// Save User number
  void saveUserPhoneNumber(String? phoneNumber){
    if(phoneNumber!=null){
      _saveToPreferences(SharedPrefKeys.phoneNumber, phoneNumber);
    }
  }
  /// Get User Phone Number
  String get phoneNumber{
    final userPhoneNumber = _getFromDisk(SharedPrefKeys.phoneNumber);
    if(userPhoneNumber !=null ){
       return userPhoneNumber;
    }

    return '';
  }



}