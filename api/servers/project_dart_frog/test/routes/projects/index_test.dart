import 'package:dart_frog/dart_frog.dart';
import 'package:flutter_architecture_api_project_presentation_dart_frog/presentation.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../../routes/projects/index.dart' as projects_route;
import '../../helpers/mocks.dart';

void main() {
  late MockRequestContext context;
  late MockPostProjectController postController;
  late MockGetProjectsByUserIdController getController;

  setUpAll(() {
    registerFallbackValue(RequestContextFake());
    registerFallbackValue(ProjectFake());
  });

  setUp(() {
    context = MockRequestContext();
    postController = MockPostProjectController();
    getController = MockGetProjectsByUserIdController();

    when(
      () => context.read<PostProjectController>(),
    ).thenReturn(
      postController,
    );
    when(
      () => context.read<GetProjectsByUserIdController>(),
    ).thenReturn(
      getController,
    );
    when(
      () => postController.handle(any()),
    ).thenAnswer(
      (_) async => Response.json(
        body: {},
      ),
    );
    when(
      () => getController.handle(any()),
    ).thenAnswer(
      (_) async => Response.json(
        body: {},
      ),
    );
  });

  group('Projects Route', () {
    test('calls GetProjectsByUserIdController on GET request', () async {
      when(
        () => context.request,
      ).thenReturn(
        MockRequest(HttpMethod.get),
      );

      await projects_route.onRequest(context);

      verify(
        () => getController.handle(any()),
      ).called(1);
    });

    test('calls PostProjectController on POST request', () async {
      when(
        () => context.request,
      ).thenReturn(
        MockRequest(HttpMethod.post),
      );

      await projects_route.onRequest(context);

      verify(
        () => postController.handle(any()),
      ).called(1);
    });

    test('returns 405 if method should not exist', () async {
      final statusCodes = [
        HttpMethod.delete,
        HttpMethod.put,
        HttpMethod.head,
        HttpMethod.options,
        HttpMethod.patch,
      ];

      for (final statusCode in statusCodes) {
        when(
          () => context.request,
        ).thenReturn(
          MockRequest(statusCode),
        );

        final response = await projects_route.onRequest(context);

        expect(response.statusCode, equals(405));
      }
    });
  });
}
