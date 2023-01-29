import 'package:dart_frog/dart_frog.dart';
import 'package:flutter_architecture_api_project_presentation_dart_frog/presentation.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../../routes/projects/[id].dart' as project_route;
import '../../helpers/mocks.dart';

void main() {
  late MockRequestContext context;
  late MockGetProjectController getProjectController;
  late MockPutProjectController putProjectController;
  late MockDeleteProjectController deleteProjectController;

  setUpAll(() {
    registerFallbackValue(RequestContextFake());
    registerFallbackValue(ProjectFake());
  });

  setUp(() {
    context = MockRequestContext();
    getProjectController = MockGetProjectController();
    putProjectController = MockPutProjectController();
    deleteProjectController = MockDeleteProjectController();

    when(
      () => context.read<GetProjectController>(),
    ).thenReturn(
      getProjectController,
    );
    when(
      () => context.read<PutProjectController>(),
    ).thenReturn(
      putProjectController,
    );
    when(
      () => context.read<DeleteProjectController>(),
    ).thenReturn(
      deleteProjectController,
    );
    when(
      () => getProjectController.handle(any(), any()),
    ).thenAnswer(
      (_) async => Response.json(
        body: {},
      ),
    );
    when(
      () => putProjectController.handle(any(), any()),
    ).thenAnswer(
      (_) async => Response.json(
        body: {},
      ),
    );
    when(
      () => deleteProjectController.handle(any(), any()),
    ).thenAnswer(
      (_) async => Response.json(
        body: {},
      ),
    );
  });

  group('Project Route', () {
    test('calls GetProjectController on GET request', () async {
      const id = '1';

      when(
        () => context.request,
      ).thenReturn(
        MockRequest(HttpMethod.get),
      );

      await project_route.onRequest(context, id);

      verify(
        () => getProjectController.handle(any(), id),
      ).called(1);
    });

    test('calls PutProjectController on PUT request', () async {
      const id = '1';

      when(
        () => context.request,
      ).thenReturn(
        MockRequest(HttpMethod.put),
      );

      await project_route.onRequest(context, id);

      verify(
        () => putProjectController.handle(any(), id),
      ).called(1);
    });

    test('calls DeleteProjectController on DELETE request', () async {
      const id = '1';

      when(
        () => context.request,
      ).thenReturn(
        MockRequest(HttpMethod.delete),
      );

      await project_route.onRequest(context, id);

      verify(
        () => deleteProjectController.handle(any(), id),
      ).called(1);
    });

    test('returns 405 if method should not exist', () async {
      final statusCodes = [
        HttpMethod.post,
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

        final response = await project_route.onRequest(context, '1');

        expect(response.statusCode, equals(405));
      }
    });
  });
}
