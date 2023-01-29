import 'package:flutter_architecture_api_project_application/application.dart';
import 'package:flutter_architecture_api_project_domain/domain.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../helpers/mocks.dart';

void main() {
  late MockProjectRepository projectRepository;
  late MockProjectApplicationMapper projectMapper;
  late GetProjectUseCase getProjectUseCase;

  setUp(() {
    projectRepository = MockProjectRepository();
    projectMapper = MockProjectApplicationMapper();

    getProjectUseCase = GetProjectUseCase(
      projectRepository,
      projectMapper,
    );
  });

  group('GetProjectUseCase', () {
    test('retrieves a project successfully', () async {
      const id = 1;
      const ownerId = 1;
      const name = 'Test Project';
      const description = 'Description';
      final createdAt = DateTime.now();
      final updatedAt = DateTime.now();

      final project = Project(
        id: id,
        name: ProjectName.parse(name),
        description: ProjectDescription.parse(description),
        ownerId: ownerId,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );

      final projectOutput = ProjectOutput(
        id: id,
        name: name,
        description: description,
        ownerId: ownerId,
        createdAt: createdAt,
        updatedAt: updatedAt,
        memberIds: [],
      );

      when(
        () => projectRepository.getProject(id),
      ).thenAnswer(
        (_) async => project,
      );
      when(
        () => projectMapper.toOutput(project),
      ).thenReturn(
        projectOutput,
      );

      final result = await getProjectUseCase.execute(id);

      expect(result, equals(projectOutput));
      verify(
        () => projectRepository.getProject(id),
      ).called(1);
      verify(
        () => projectMapper.toOutput(project),
      ).called(1);
    });

    test('returns null if project is not found', () async {
      const id = 1;
      when(
        () => projectRepository.getProject(id),
      ).thenAnswer(
        (_) async => null,
      );

      final result = await getProjectUseCase.execute(id);

      expect(result, isNull);
      verify(
        () => projectRepository.getProject(id),
      ).called(1);
    });
  });
}
