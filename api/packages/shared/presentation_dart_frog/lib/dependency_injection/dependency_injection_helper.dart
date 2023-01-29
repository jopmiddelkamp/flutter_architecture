import 'package:dart_frog/dart_frog.dart';

class DependencyInjectionHelper {
  DependencyInjectionHelper(
    this.handler,
  );

  final Handler handler;

  final _objects = <Type, Object>{};

  void register<T>(T object) {
    _objects[T] = object as Object;

    handler.use(provider<T>((_) => object));
  }

  T resolve<T>() {
    final factory = _objects[T];
    if (factory == null) {
      throw Exception('No factory registered for type $T');
    }
    return factory as T;
  }
}
