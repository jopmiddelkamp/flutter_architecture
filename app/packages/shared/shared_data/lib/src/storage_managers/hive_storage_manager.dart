import 'package:hive/hive.dart';
import 'package:shared_domain/storage.dart';

class HiveStorageManagerImpl implements StorageManager {
  const HiveStorageManagerImpl(
    Box<dynamic> box,
  ) : _box = box;

  final Box<dynamic> _box;

  @override
  dynamic read(String key) {
    return _box.get(key);
  }

  @override
  T readGeneric<T>(
    String key, {
    required T Function(dynamic value) map,
    required T fallback,
  }) {
    final value = _box.get(key);
    if (value == null) {
      return fallback;
    }
    return map(value);
  }

  @override
  T? readGenericOrNull<T>(
    String key, {
    required T Function(dynamic value) map,
  }) {
    final value = _box.get(key);
    if (value == null) {
      return null;
    }
    return map(value);
  }

  @override
  String readString(
    String key, {
    required String fallback,
  }) {
    final value = _box.get(key);
    if (value == null) {
      return fallback;
    }
    if (value is! String) {
      return fallback;
    }
    return value;
  }

  @override
  String? readStringOrNull(
    String key,
  ) {
    final value = _box.get(key);
    if (value is! String) {
      return null;
    }
    return value;
  }

  @override
  Future<void> write(String key, dynamic value) async {
    await _box.put(
      key,
      value,
    );
  }

  @override
  Future<void> writeGeneric<T>(
    String key,
    T value, {
    required dynamic Function(T value) map,
  }) async {
    await _box.put(
      key,
      map(value),
    );
  }

  @override
  Future<void> writeString(
    String key,
    String value,
  ) async {
    await _box.put(
      key,
      value,
    );
  }

  @override
  bool contains(
    String key,
  ) {
    final value = _box.containsKey(key);
    return value;
  }

  @override
  Future<void> clear() async {
    await _box.clear();
  }

  @override
  Future<void> delete(String key) async {
    await _box.delete(key);
  }

  @override
  Future<void> close() async {
    await _box.close();
  }
}
