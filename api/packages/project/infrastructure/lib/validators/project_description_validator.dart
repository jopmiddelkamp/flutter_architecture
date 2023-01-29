import 'package:flutter_architecture_api_project_domain/domain.dart';
import 'package:flutter_architecture_api_shared_domain/domain.dart';

class ProjectDescriptionValidatorImpl implements ProjectDescriptionValidator {
  const ProjectDescriptionValidatorImpl();

  @override
  ProjectDescription validate(String value) {
    try {
      return ProjectDescription.parse(value);
    } on FormatException {
      throw const ValidationException(
        'INVALID_PROJECT_DESCRIPTION',
        'The provided project description is invalid.',
      );
    }
  }
}
