import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'common/data/local/hive_storage_service.dart';
import 'common/data/local/storage_service.dart';
import 'common/data/local/storage_service_provider.dart';
import 'cyberpay_mobile.dart';

void main() async {
  // runApp(const MyApp());
  await runZonedGuarded<Future<void>>(
        () async {
      // Hive-specific initialization
      await Hive.initFlutter();
      final StorageService initializedStorageService = HiveStorageService();
      await initializedStorageService.init();

      runApp(
        ProviderScope(
          overrides: [
            storageServiceProvider.overrideWithValue(initializedStorageService),
          ],
          child:   CyberPayApp(),
        ),
      );

      // * This code will present some error UI if any uncaught exception happens
      FlutterError.onError = (FlutterErrorDetails details) {
        FlutterError.presentError(details);
      };

      ErrorWidget.builder = (FlutterErrorDetails details) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
            title: const Text('An error occurred'),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Center(child: Text(details.toString())),
              ],
            ),
          ),
        );
      };
        },
        (Object error, StackTrace stack) {
      // * Log any errors to console
      debugPrint(error.toString());
    },
  );

}


