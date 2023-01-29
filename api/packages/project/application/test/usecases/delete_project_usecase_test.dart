import 'package:flutter_architecture_api_project_application/application.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../helpers/mocks.dart';

void main() {
  late MockProjectRepository projectRepository;
  late DeleteProjectUseCase deleteProjectUseCase;

  setUp(() {
    projectRepository = MockProjectRepository();

    deleteProjectUseCase = DeleteProjectUseCase(
      projectRepository,
    );
  });

  group('DeleteProjectUseCase', () {
    test('deletes a project successfully', () async {
      const id = 1;
      when(
        () => projectRepository.deleteProject(id),
      ).thenAnswer(
        (_) async {},
      );

      await deleteProjectUseCase.execute(id);

      verify(
        () => projectRepository.deleteProject(id),
      ).called(1);
    });

    test('throws an exception if project does not exist', () async {
      const id = 1;
      when(
        () => projectRepository.deleteProject(id),
      ).thenThrow(
        Exception('Project not found'),
      );

      expect(
        () => deleteProjectUseCase.execute(id),
        throwsException,
      );

      verify(
        () => projectRepository.deleteProject(id),
      ).called(1);
    });
  });
}
