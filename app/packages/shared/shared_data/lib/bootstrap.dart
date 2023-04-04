import 'dart:convert';

import 'package:flutter_keychain/flutter_keychain.dart';
import 'package:hive/hive.dart';
import 'package:shared_data/src/storage_managers/hive_storage_manager.dart';
import 'package:shared_domain/dependency_injection.dart';
import 'package:shared_domain/storage.dart';

const String _storageEncryptionSecretKey = 'storage_encryption_secret';

Future<void> bootstrap({
  required String authMicroServiceBaseUrl,
  required String userMicroServiceBaseUrl,
  required String projectMicroServiceBaseUrl,
}) async {
  final storageManager = await _getHiveStorageManager();
  Di.instance.registerSingleton<StorageManager>(storageManager);
}

Future<StorageManager> _getHiveStorageManager() async {
  final box = await Hive.openBox<String>(
    'StorageManager',
    encryptionCipher: HiveAesCipher(
      await _getHiveSecureKey(),
    ),
  );
  final storageManager = HiveStorageManagerImpl(box);
  return storageManager;
}

Future<List<int>> _getHiveSecureKey() async {
  var storageEncryptionSecret = await FlutterKeychain.get(
    key: _storageEncryptionSecretKey,
  );
  if (storageEncryptionSecret == null) {
    storageEncryptionSecret = utf8.decode(Hive.generateSecureKey());
    await FlutterKeychain.put(
      key: _storageEncryptionSecretKey,
      value: storageEncryptionSecret,
    );
  }
  return utf8.encode(storageEncryptionSecret);
}
