import 'package:get_it/get_it.dart';
import 'package:shared_domain/src/dependency_injection/dependency_injection_container.dart';

class GetItDependencyInjectionContainerImpl
    implements DependencyInjectionContainer {
  @override
  T get<T extends Object>() {
    return GetIt.instance<T>();
  }

  @override
  void registerSingleton<T extends Object>(
    T instance,
  ) {
    GetIt.instance.registerSingleton<T>(instance);
  }

  @override
  void registerSingletonAsync<T extends Object>(
    Future<T> Function() factoryFunc,
  ) {
    GetIt.instance.registerSingletonAsync<T>(factoryFunc);
  }
}
