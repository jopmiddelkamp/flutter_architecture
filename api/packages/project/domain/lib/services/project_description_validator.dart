import 'package:flutter_architecture_api_shared_domain/domain.dart';

import '../value_objects/project_description.dart';

abstract class ProjectDescriptionValidator
    implements Validator<String, ProjectDescription> {}
