import 'package:rxdart/rxdart.dart';
import 'package:shared_domain/mixin.dart';
import 'package:shared_domain/storage.dart';

const _tokenKey = 'token';

abstract class TokenMediator implements OnReadyMixin {
  Stream<String?> get stream;

  String? get value;

  void add(String token);

  void clear();
}

class TokenMediatorImpl with OnReadyMixin implements TokenMediator {
  TokenMediatorImpl({
    required StorageManager storageManager,
  }) : _storageManager = storageManager;

  final StorageManager _storageManager;

  final _subject = BehaviorSubject<String?>();

  Future<void> init() async {
    if (readyCompleter.isCompleted) {
      return;
    }
    final token = _storageManager.readStringOrNull(_tokenKey);
    if (token != null) {
      _subject.add(token);
    }
    readyCompleter.complete();
  }

  @override
  String? get value => _subject.valueOrNull;

  @override
  Stream<String?> get stream => _subject.stream.asBroadcastStream();

  @override
  void add(String token) {
    _subject.add(token);
  }

  @override
  void clear() {
    _subject.add(null);
  }
}
