class AppConfigs{
  /// Base API URL of The CyberPay API
  static const apiBaseUrl='';

  /// Encrypt Key
  static  const String ENCRYPT_KEY = "CYBERPAY_V2";

  /// Vector Key
  static const String INITIALISING_VECTOR_KEY = "f7431c8d00b85a6d";

  /// The max allowed age duration for the http cache
  static const Duration maxCacheAge = Duration(hours: 1);

  /// Key used in dio options to indicate whether
  /// cache should be force refreshed
  static const String dioCacheForceRefreshKey = 'dio_cache_force_refresh_key';
}