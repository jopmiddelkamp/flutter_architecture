import 'package:flutter_architecture_api_project_domain/domain.dart';
import 'package:flutter_architecture_api_project_infrastructure/infrastructure.dart';
import 'package:flutter_architecture_api_project_infrastructure/tokens/tokens.dart';
import 'package:flutter_architecture_api_shared_application/application.dart';
import 'package:flutter_architecture_api_shared_presentation_dart_frog/presentation.dart';

class ProjectInfrastructureModule {
  const ProjectInfrastructureModule._();

  static void registerAll(DependencyInjectionHelper helper) {
    final dataSource = InMemoryProjectLocalDataSource();

    helper
      ..register<ProjectRepository>(
        ProjectRepositoryImpl(dataSource),
      )
      ..register<ProjectIdGenerator>(
        InMemoryProjectIdGenerator(dataSource),
      )
      ..register<ProjectNameValidator>(
        const ProjectNameValidatorImpl(),
      )
      ..register<ProjectDescriptionValidator>(
        const ProjectDescriptionValidatorImpl(),
      )
      ..register<TokenService>(
        // Make sure to use a secure secret in production and to configure
        // the same value as in the auth micro service.
        const JwtTokenService('your-very-secure-secret-here'),
      );
  }
}
