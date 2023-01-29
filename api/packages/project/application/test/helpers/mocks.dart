import 'package:flutter_architecture_api_project_application/application.dart';
import 'package:flutter_architecture_api_project_domain/domain.dart';
import 'package:flutter_architecture_api_shared_application/application.dart';
import 'package:mocktail/mocktail.dart';

// domain
class MockProjectRepository extends Mock implements ProjectRepository {}

class ProjectFake extends Fake implements Project {}

class MockProjectIdGenerator extends Mock implements ProjectIdGenerator {}

class MockProjectNameValidator extends Mock implements ProjectNameValidator {}

class MockProjectDescriptionValidator extends Mock
    implements ProjectDescriptionValidator {}

// application
class MockCreateProjectUseCase extends Mock implements CreateProjectUseCase {}

class MockGetProjectUseCase extends Mock implements GetProjectUseCase {}

class MockDeleteProjectUseCase extends Mock implements DeleteProjectUseCase {}

class MockUpdateProjectUseCase extends Mock implements UpdateProjectUseCase {}

class MockGetProjectsByUserIdUseCase extends Mock
    implements GetProjectsByUserIdUseCase {}

class MockProjectApplicationMapper extends Mock
    implements ApplicationMapper<Project, ProjectOutput> {}
