abstract class DomainRouterNavigator {
  void goPath(
    String path, {
    Object? extra,
  });
  void goNamed<T>(
    String name, {
    Map<String, String> params = const <String, String>{},
    Map<String, dynamic> queryParams = const <String, dynamic>{},
    Object? extra,
  });
  void go<T>({
    Map<String, String> params = const <String, String>{},
    Map<String, dynamic> queryParams = const <String, dynamic>{},
    Object? extra,
  });
  void pushPath(
    String path, {
    Object? extra,
  });
  void pushNamed<T>(
    String name, {
    Map<String, String> params = const <String, String>{},
    Map<String, dynamic> queryParams = const <String, dynamic>{},
    Object? extra,
  });
  void push<T>({
    Map<String, String> params = const <String, String>{},
    Map<String, dynamic> queryParams = const <String, dynamic>{},
    Object? extra,
  });
  void pop<T extends Object?>([T? result]);
  void popUntilRoot<T extends Object?>([T? result]);
}
