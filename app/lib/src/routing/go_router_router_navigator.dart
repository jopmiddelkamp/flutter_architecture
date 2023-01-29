import 'package:go_router/go_router.dart';
import 'package:shared_domain/routing.dart';

class GoRouterRouterNavigator implements DomainRouterNavigator {
  GoRouterRouterNavigator({
    required GoRouter router,
  }) : _router = router;

  final GoRouter _router;

  @override
  void goPath(
    String path, {
    Map<String, String> params = const <String, String>{},
    Map<String, dynamic> queryParams = const <String, dynamic>{},
    Object? extra,
  }) {
    _router.go(
      path,
      extra: extra,
    );
  }

  @override
  void go<T>({
    Map<String, String> params = const <String, String>{},
    Map<String, dynamic> queryParams = const <String, dynamic>{},
    Object? extra,
  }) {
    _router.goNamed(
      T.toString(),
      params: params,
      queryParams: queryParams,
      extra: extra,
    );
  }

  @override
  void goNamed<T>(
    String name, {
    Map<String, String> params = const <String, String>{},
    Map<String, dynamic> queryParams = const <String, dynamic>{},
    Object? extra,
  }) {
    _router.goNamed(
      name,
      params: params,
      queryParams: queryParams,
      extra: extra,
    );
  }

  @override
  void pop<T extends Object?>([T? result]) {
    _router.pop(result);
  }

  @override
  void popUntilRoot<T extends Object?>([T? result]) {
    while (_router.canPop()) {
      pop(result);
    }
  }

  @override
  void pushPath(
    String path, {
    Object? extra,
  }) {
    _router.push(
      path,
      extra: extra,
    );
  }

  @override
  void push<T>({
    Map<String, String> params = const <String, String>{},
    Map<String, dynamic> queryParams = const <String, dynamic>{},
    Object? extra,
  }) {
    _router.pushNamed(
      T.toString(),
      params: params,
      queryParams: queryParams,
      extra: extra,
    );
  }

  @override
  void pushNamed<T>(
    String name, {
    Map<String, String> params = const <String, String>{},
    Map<String, dynamic> queryParams = const <String, dynamic>{},
    Object? extra,
  }) {
    _router.pushNamed(
      name,
      params: params,
      queryParams: queryParams,
      extra: extra,
    );
  }
}
