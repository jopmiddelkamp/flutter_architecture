import 'package:feature_project_management_domain/models.dart';
import 'package:shared_domain/models.dart';

class Project {
  const Project({
    required this.id,
    required this.name,
    required this.budget,
    required this.manager,
  });

  final String id;
  final String name;
  final double budget;
  final User manager;
}

class ProjectCreateData {
  ProjectCreateData({
    this.name,
    this.budget,
    this.managerId,
  });

  final String? name;
  final double? budget;
  final String? managerId;
}

class ProjectUpdateData {
  ProjectUpdateData({
    this.name,
    this.budget,
    this.managerId,
  });

  final UpdateField<String>? name;
  final UpdateField<double>? budget;
  final UpdateField<String>? managerId;

  Map<String, dynamic> toJson() {
    final result = {
      if (name != null)
        'name': {
          'value': name!.value,
        },
      if (budget != null)
        'budget': {
          'value': budget!.value,
        },
      if (managerId != null)
        'managerId': {
          'value': managerId!.value,
        },
    };
    return result;
  }
}
