import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:rxdart/rxdart.dart';

class TokenMediator extends HydratedCubit<String?> {
  // Private named constructor
  TokenMediator._internal() : super(null);

  // Singleton instance
  static TokenMediator instance = TokenMediator._internal();

  Stream<String?> get tokenStream => stream.startWith(token);

  String? get token => state;

  void updateToken(String? token) {
    emit(token);
  }

  @override
  String? fromJson(Map<String, dynamic> json) {
    return json['token'] as String?;
  }

  @override
  Map<String, dynamic>? toJson(String? state) {
    return state != null ? {'token': state} : null;
  }
}
