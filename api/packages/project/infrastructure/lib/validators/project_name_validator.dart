import 'package:flutter_architecture_api_project_domain/domain.dart';
import 'package:flutter_architecture_api_shared_domain/domain.dart';

class ProjectNameValidatorImpl implements ProjectNameValidator {
  const ProjectNameValidatorImpl();

  @override
  ProjectName validate(String value) {
    try {
      return ProjectName.parse(value);
    } on FormatException {
      throw const ValidationException(
        'INVALID_PROJECT_NAME',
        'The provided project name is invalid.',
      );
    }
  }
}
