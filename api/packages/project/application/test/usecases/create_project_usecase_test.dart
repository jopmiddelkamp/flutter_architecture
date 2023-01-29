import 'package:flutter_architecture_api_project_application/application.dart';
import 'package:flutter_architecture_api_project_domain/domain.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../helpers/mocks.dart';

void main() {
  late MockProjectRepository projectRepository;
  late MockProjectIdGenerator projectIdGenerator;
  late MockProjectNameValidator projectNameValidator;
  late MockProjectDescriptionValidator projectDescriptionValidator;
  late MockProjectApplicationMapper projectMapper;
  late CreateProjectUseCase createProjectUseCase;

  setUpAll(() {
    registerFallbackValue(ProjectFake());
  });

  setUp(() {
    projectRepository = MockProjectRepository();
    projectIdGenerator = MockProjectIdGenerator();
    projectNameValidator = MockProjectNameValidator();
    projectDescriptionValidator = MockProjectDescriptionValidator();
    projectMapper = MockProjectApplicationMapper();

    createProjectUseCase = CreateProjectUseCase(
      projectRepository,
      projectIdGenerator,
      projectNameValidator,
      projectDescriptionValidator,
      projectMapper,
    );
  });

  group('CreateProjectUseCase', () {
    test('creates a project successfully', () async {
      const id = 1;
      const name = 'Test Project';
      const description = 'Description';
      const ownerId = 1;
      final createdAt = DateTime.now();
      final updatedAt = DateTime.now();

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
        () => projectIdGenerator.nextId(),
      ).thenAnswer(
        (_) async => id,
      );
      when(
        () => projectNameValidator.validate(any()),
      ).thenReturn(
        ProjectName.parse(name),
      );
      when(
        () => projectDescriptionValidator.validate(any()),
      ).thenReturn(
        ProjectDescription.parse(description),
      );

      when(
        () => projectRepository.createProject(any()),
      ).thenAnswer(
        (_) async {},
      );
      when(
        () => projectMapper.toOutput(any()),
      ).thenReturn(
        projectOutput,
      );

      final result = await createProjectUseCase.execute(
        name: name,
        description: description,
        ownerId: ownerId,
      );

      expect(result, equals(projectOutput));
      verify(
        () => projectRepository.createProject(any()),
      ).called(1);
      verify(
        () => projectMapper.toOutput(any()),
      ).called(1);
    });
  });
}
