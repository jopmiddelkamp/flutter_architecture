import 'package:shared_domain/src/routing/router_navigator.dart';

abstract class DomainRouter {
  static DomainRouterNavigator? _instance;

  static DomainRouterNavigator get instance {
    if (_instance == null) {
      throw Exception('RouterNavigator is not set');
    }
    return _instance!;
  }

  static set instance(DomainRouterNavigator value) => _instance = value;
}
