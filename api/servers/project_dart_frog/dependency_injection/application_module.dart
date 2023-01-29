import 'package:flutter_architecture_api_project_application/application.dart';
import 'package:flutter_architecture_api_project_domain/domain.dart';
import 'package:flutter_architecture_api_shared_presentation_dart_frog/presentation.dart';

class ProjectApplicationModule {
  const ProjectApplicationModule._();

  static void registerAll(DependencyInjectionHelper helper) {
    final projectRepository = helper.resolve<ProjectRepository>();
    final projectIdGenerator = helper.resolve<ProjectIdGenerator>();
    final projectNameValidator = helper.resolve<ProjectNameValidator>();
    final projectDescriptionValidator =
        helper.resolve<ProjectDescriptionValidator>();

    const projectMapper = ProjectApplicationMapper();

    helper
      ..register<CreateProjectUseCase>(
        CreateProjectUseCase(
          projectRepository,
          projectIdGenerator,
          projectNameValidator,
          projectDescriptionValidator,
          projectMapper,
        ),
      )
      ..register<GetProjectUseCase>(
        GetProjectUseCase(projectRepository, projectMapper),
      )
      ..register<UpdateProjectUseCase>(
        UpdateProjectUseCase(projectRepository, projectMapper),
      )
      ..register<DeleteProjectUseCase>(
        DeleteProjectUseCase(projectRepository),
      );
  }
}
