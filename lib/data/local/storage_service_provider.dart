import 'package:cyberpay_mobile_2/common/sevices/local/storage_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/sevices/local/hive_storage_service.dart';

/// Provider that locates an [StorageService] interface to implementation
final storageServiceProvider = Provider<StorageService>(
      (_) => HiveStorageService(),
);