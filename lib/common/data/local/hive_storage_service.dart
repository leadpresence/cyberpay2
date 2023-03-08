
import 'package:cyberpay_mobile_2/common/data/local/storage_service.dart';
import 'package:cyberpay_mobile_2/common/data/models/local/local_user.dart';
import 'package:hive/hive.dart';

/// [StorageService] interface implementation using the Hive package
///
/// See: https://pub.dev/packages/hive_flutter
class HiveStorageService implements StorageService {
  /// A Hive Box
  late Box<dynamic> hiveBox;

  /// Opens a Hive box by its name
  Future<void> openBox([String boxName = 'CYBERPAY_LOC']) async {
    hiveBox = await Hive.openBox<dynamic>(boxName);
  }

  @override
  Future<void> init() async {
    await openBox();
  }

  @override
  Future<void> remove(String key) async {
    await hiveBox.delete(key);
  }

  @override
  dynamic get(String key) {
    return hiveBox.get(key);
  }

  @override
  dynamic getAll() {
    return hiveBox.values.toList();
  }

  @override
  bool has(String key) {
    return hiveBox.containsKey(key);
  }

  @override
  Future<void> set(String? key, dynamic data) async {
    await hiveBox.put(key, data);
  }

  /// Stores User to local Storage
  @override
  Future<void> saveLocalUser(LocalUser userModel) async {
    try {
      final LocalUser localUser = userModel;
      await hiveBox.put('localUser', localUser);

      await hiveBox.close();
    } on Exception {

    }
  }

  /// Get local store user model
  @override
  Future<LocalUser?> getSavedLocalUser() async {
    try {
      final LocalUser cacheUser = hiveBox.get('user') as LocalUser;
      await hiveBox.close();

      return cacheUser;
    } on Exception {

    }

    return null;
  }

  @override
  Future<void> clear() async {
    await hiveBox.clear();
  }

  @override
  Future<void> close() async {
    await hiveBox.close();
  }


}