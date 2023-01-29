import 'dart:async';

import 'package:rxdart/subjects.dart';

typedef Fetcher<T> = Future<T> Function();

class ReactiveCache<T> {
  ReactiveCache({
    required this.ttl,
  }) : _behaviorSubject = BehaviorSubject<T?>() {
    _behaviorSubject.onListen = _onListen;
  }

  final Duration ttl;
  final BehaviorSubject<T?> _behaviorSubject;
  Timer? _timer;

  Stream<T?> get stream => _behaviorSubject.stream.asBroadcastStream();

  T? get value => _behaviorSubject.value;

  void setData(T value) {
    _behaviorSubject.add(value);
  }

  Future<void> _onListen() async {
    _timer?.cancel();
    if (value != null) {
      _timer = Timer(ttl, () {
        _behaviorSubject.add(null);
      });
    }
  }

  Future<void> fetchData(
    Fetcher<T> fetcher, {
    bool force = false,
  }) async {
    if (force || value == null) {
      final fetchedValue = await fetcher();
      setData(fetchedValue);
    }
  }

  Future<dynamic> close() async {
    await _behaviorSubject.close();
  }
}
