import 'package:dart_frog/dart_frog.dart';
import 'package:flutter_architecture_api_project_domain/domain.dart';
import 'package:flutter_architecture_api_project_presentation_dart_frog/presentation.dart';
import 'package:mocktail/mocktail.dart';

// domain
class ProjectFake extends Fake implements Project {}

// presentation
class MockPostProjectController extends Mock implements PostProjectController {}

class MockGetProjectController extends Mock implements GetProjectController {}

class MockGetProjectsByUserIdController extends Mock
    implements GetProjectsByUserIdController {}

class MockPutProjectController extends Mock implements PutProjectController {}

class MockDeleteProjectController extends Mock
    implements DeleteProjectController {}

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
