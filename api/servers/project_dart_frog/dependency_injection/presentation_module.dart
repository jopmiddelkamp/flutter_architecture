import 'package:flutter_architecture_api_project_application/application.dart';
import 'package:flutter_architecture_api_project_presentation_dart_frog/presentation.dart';
import 'package:flutter_architecture_api_shared_presentation_dart_frog/presentation.dart';

class ProjectPresentationDartFrogModule {
  const ProjectPresentationDartFrogModule._();

  static void registerAll(DependencyInjectionHelper helper) {
    final createProjectUseCase = helper.resolve<CreateProjectUseCase>();
    final getProjectUseCase = helper.resolve<GetProjectUseCase>();
    final updateProjectUseCase = helper.resolve<UpdateProjectUseCase>();
    final deleteProjectUseCase = helper.resolve<DeleteProjectUseCase>();

    helper
      ..register<PostProjectController>(
        PostProjectController(createProjectUseCase),
      )
      ..register<GetProjectController>(
        GetProjectController(getProjectUseCase),
      )
      ..register<PutProjectController>(
        PutProjectController(updateProjectUseCase),
      )
      ..register<DeleteProjectController>(
        DeleteProjectController(deleteProjectUseCase),
      );
  }
}
