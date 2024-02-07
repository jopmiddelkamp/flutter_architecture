import 'dart:convert';

import 'package:back_end/models.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_domain/mixin.dart';
import 'package:shared_domain/storage.dart';

const _authUserKey = 'auth_user';

abstract class AuthUserMediator implements OnReadyMixin {
  Stream<AuthUserDto?> get stream;

  AuthUserDto? get value;

  void add(AuthUserDto authUser);

  void clear();
}

class AuthUserMediatorImpl with OnReadyMixin implements AuthUserMediator {
  AuthUserMediatorImpl({
    required StorageManager storageManager,
  }) : _storageManager = storageManager;

  final StorageManager _storageManager;

  final _subject = BehaviorSubject<AuthUserDto?>();

  Future<void> init() async {
    if (readyCompleter.isCompleted) {
      return;
    }
    final authUserJsonString = _storageManager.readStringOrNull(_authUserKey);
    if (authUserJsonString != null) {
      final authUser = AuthUserDto.fromJson(
        jsonDecode(authUserJsonString) as Map<String, dynamic>,
      );
      _subject.add(authUser);
    }
    readyCompleter.complete();
  }

  @override
  AuthUserDto? get value => _subject.valueOrNull;

  @override
  Stream<AuthUserDto?> get stream => _subject.stream.asBroadcastStream();

  @override
  void add(AuthUserDto authUser) {
    _subject.add(authUser);
  }

  @override
  void clear() {
    _subject.add(null);
  }
}
