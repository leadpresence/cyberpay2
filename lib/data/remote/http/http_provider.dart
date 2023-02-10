import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/sevices/storage/storage_service_provider.dart';
import 'http_service.dart';
import 'http_service_impl.dart';

/// Provider that maps an [HttpService] interface to implementation
final httpServiceProvider = Provider<HttpService>((ref) {
  final storageService = ref.watch(storageServiceProvider);

  return DioHttpService(storageService);
});
