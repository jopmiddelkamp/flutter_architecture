import 'package:shared_domain/src/dependency_injection/dependency_injection_container.dart';

abstract class Di {
  static DependencyInjectionContainer? _instance;

  static DependencyInjectionContainer get instance {
    if (_instance == null) {
      throw Exception('DependencyInjectionContainer is not set');
    }
    return _instance!;
  }

  static bool get isInitialized => _instance != null;

  static set instance(DependencyInjectionContainer value) => _instance = value;
}
