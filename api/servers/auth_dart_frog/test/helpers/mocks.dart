import 'package:dart_frog/dart_frog.dart';
import 'package:flutter_architecture_api_auth_presentation_dart_frog/presentation.dart';
import 'package:mocktail/mocktail.dart';

// presentation
class MockPostLoginController extends Mock implements PostLoginController {}

class MockPostLogoutController extends Mock implements PostLogoutController {}

class MockGetProfileController extends Mock implements GetProfileController {}

class MockPostRegisterController extends Mock
    implements PostRegisterController {}

// dart_frog
class MockRequestContext extends Mock implements RequestContext {}

class MockRequest extends Mock implements Request {
  MockRequest(
    HttpMethod method, {
    Map<String, dynamic>? body,
  })  : _method = method,
        _body = body;

  late final HttpMethod _method;
  late final Map<String, dynamic>? _body;

  @override
  HttpMethod get method => _method;

  @override
  Future<Map<String, dynamic>?> json() async => _body;
}

class RequestContextFake extends Fake implements RequestContext {}
