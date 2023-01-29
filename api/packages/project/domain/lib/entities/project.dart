import '../value_objects/project_description.dart';
import '../value_objects/project_name.dart';

class Project {
  const Project({
    required this.id,
    required this.name,
    required this.description,
    required this.ownerId,
    required this.createdAt,
    required this.updatedAt,
    this.memberIds = const [],
  });

  final int id;
  final ProjectName name;
  final ProjectDescription description;
  final int ownerId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<String> memberIds;
}
