import 'package:flutter_architecture_api_project_application/application.dart';
import 'package:flutter_architecture_api_project_domain/domain.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../helpers/mocks.dart';

void main() {
  late MockProjectRepository projectRepository;
  late MockProjectApplicationMapper projectMapper;
  late GetProjectsByUserIdUseCase getProjectsUseCase;

  setUpAll(() {
    registerFallbackValue(ProjectFake());
  });

  setUp(() {
    projectRepository = MockProjectRepository();
    projectMapper = MockProjectApplicationMapper();

    getProjectsUseCase = GetProjectsByUserIdUseCase(
      projectRepository,
      projectMapper,
    );
  });

  group('GetProjectsByUserIdUseCase', () {
    test('retrieves projects by user ID successfully', () async {
      const userId = 1;
      final projects = [
        Project(
          id: 1,
          name: ProjectName.parse('Project 1'),
          description: ProjectDescription.parse('Description 1'),
          ownerId: userId,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
        Project(
          id: 2,
          name: ProjectName.parse('Project 2'),
          description: ProjectDescription.parse('Description 2'),
          ownerId: userId,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
      ];

      final projectOutputs = [
        ProjectOutput(
          id: projects[0].id,
          name: projects[0].name.value,
          description: projects[0].description.value,
          ownerId: projects[0].ownerId,
          createdAt: projects[0].createdAt,
          updatedAt: projects[0].updatedAt,
          memberIds: [],
        ),
        ProjectOutput(
          id: projects[1].id,
          name: projects[1].name.value,
          description: projects[1].description.value,
          ownerId: projects[1].ownerId,
          createdAt: projects[1].createdAt,
          updatedAt: projects[1].updatedAt,
          memberIds: [],
        ),
      ];

      when(
        () => projectRepository.getProjectsByUserId(userId),
      ).thenAnswer(
        (_) async => projects,
      );
      when(
        () => projectMapper.toOutput(any()),
      ).thenAnswer(
        (invocation) => projectOutputs.firstWhere(
          (e) => e.id == (invocation.positionalArguments[0] as Project).id,
        ),
      );

      final result = await getProjectsUseCase.execute(userId);

      expect(result, equals(projectOutputs));
      verify(
        () => projectRepository.getProjectsByUserId(userId),
      ).called(1);
      verify(
        () => projectMapper.toOutput(any()),
      ).called(2);
    });
  });
}
