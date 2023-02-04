import 'package:cyberpay_mobile_2/core/sevices/storage/storage_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'hive_storage_service.dart';

/// Provider that locates an [StorageService] interface to implementation
final storageServiceProvider = Provider<StorageService>(
      (_) => HiveStorageService(),
);