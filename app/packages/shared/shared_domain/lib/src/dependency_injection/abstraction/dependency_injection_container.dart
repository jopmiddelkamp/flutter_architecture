abstract class DependencyInjectionContainer {
  T get<T extends Object>();

  void registerSingleton<T extends Object>(T instance);
}
