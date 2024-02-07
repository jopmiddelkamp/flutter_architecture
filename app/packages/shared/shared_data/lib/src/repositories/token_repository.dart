import 'package:shared_domain/mixin.dart';
import 'package:shared_domain/repositories.dart';

import '../../mediators.dart';

class TokenRepositoryImpl with OnReadyMixin implements TokenRepository {
  TokenRepositoryImpl({
    required TokenMediator tokenMediator,
  }) : _tokenMediator = tokenMediator;

  final TokenMediator _tokenMediator;

  Future<void> init() async {
    if (readyCompleter.isCompleted) {
      return;
    }
    await _tokenMediator.onReady;
    readyCompleter.complete();
  }

  @override
  String? get token => _tokenMediator.value;

  @override
  Stream<String?> get tokenStream => _tokenMediator.stream;
}
