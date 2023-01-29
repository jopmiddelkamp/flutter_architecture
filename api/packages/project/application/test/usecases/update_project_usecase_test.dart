import 'package:flutter_architecture_api_project_application/application.dart';
import 'package:flutter_architecture_api_project_domain/domain.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../helpers/mocks.dart';

void main() {
  late MockProjectRepository projectRepository;
  late MockProjectApplicationMapper projectMapper;
  late UpdateProjectUseCase updateProjectUseCase;

  setUpAll(() {
    registerFallbackValue(ProjectFake());
  });

  setUp(() {
    projectRepository = MockProjectRepository();
    projectMapper = MockProjectApplicationMapper();

    updateProjectUseCase = UpdateProjectUseCase(
      projectRepository,
      projectMapper,
    );
  });

  group('UpdateProjectUseCase', () {
    test('updates a project successfully', () async {
      const id = 1;
      const newName = 'New Name';
      const newDescription = 'New Description';
      final newUpdatedAt = DateTime.now();

      final existingProject = Project(
        id: id,
        name: ProjectName.parse('Old Name'),
        description: ProjectDescription.parse('Old Description'),
        ownerId: 1,
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
        updatedAt: DateTime.now().subtract(const Duration(days: 1)),
      );

      final projectOutput = ProjectOutput(
        id: existingProject.id,
        name: newName,
        description: newDescription,
        ownerId: existingProject.ownerId,
        createdAt: existingProject.createdAt,
        updatedAt: newUpdatedAt,
        memberIds: [],
      );

      when(
        () => projectRepository.getProject(id),
      ).thenAnswer(
        (_) async => existingProject,
      );
      when(
        () => projectRepository.updateProject(any()),
      ).thenAnswer(
        (_) async {},
      );
      when(
        () => projectMapper.toOutput(any()),
      ).thenReturn(
        projectOutput,
      );

      final result = await updateProjectUseCase.execute(
        id: id,
        name: newName,
        description: newDescription,
      );

      expect(
        result,
        equals(projectOutput),
      );
      verify(
        () => projectRepository.getProject(id),
      ).called(1);
      verify(
        () => projectRepository.updateProject(any()),
      ).called(1);
      verify(
        () => projectMapper.toOutput(any()),
      ).called(1);
    });

    test('throws an exception if project is not found', () async {
      const id = 1;
      when(
        () => projectRepository.getProject(id),
      ).thenAnswer(
        (_) async => null,
      );

      expect(
        () => updateProjectUseCase.execute(
          id: id,
          name: 'New Name',
          description: 'New Description',
        ),
        throwsException,
      );

      verify(
        () => projectRepository.getProject(id),
      ).called(1);
    });
  });
}
