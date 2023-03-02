import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../local/shared_pref_constants.dart';

/// Interceptor for the Asset Management API.
  class CyberPayApiInterceptor extends Interceptor {
  /// Constructor.

    CyberPayApiInterceptor(this._apiKey,this._secret);

  final String _apiKey;
  final String _secret;

  @override
  Future onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers['Apikey'] = _apiKey;
    options.headers['Secret'] = _secret;
    options.headers['Content-Type'] = 'application/json';

    if (!options.path.startsWith('/Authentication')) {
      final sp = await SharedPreferences.getInstance();
      final json = sp.getString(SharedPrefKeys.cyberPayUserKey);
      if (json != null) {
        final user = '';//CyberPayLocalUser.fromJson(jsonDecode(json));
        final token = 'user.authToken';
        options.headers['Authorization'] = 'Bearer $token';
      }
    }

    return super.onRequest(options, handler);
  }
}
