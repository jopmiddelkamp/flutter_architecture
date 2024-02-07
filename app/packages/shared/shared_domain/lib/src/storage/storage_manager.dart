import 'package:hydrated_bloc/hydrated_bloc.dart';

abstract class StorageManager implements Storage {
  T readGeneric<T>(
    String key, {
    required T Function(dynamic value) map,
    required T fallback,
  });

  T? readGenericOrNull<T>(
    String key, {
    required T Function(dynamic value) map,
  });

  String readString(
    String key, {
    required String fallback,
  });

  String? readStringOrNull(
    String key,
  );

  Future<void> writeGeneric<T>(
    String key,
    T value, {
    required dynamic Function(T value) map,
  });

  Future<void> writeString(
    String key,
    String value,
  );

  bool contains(
    String key,
  );
}
