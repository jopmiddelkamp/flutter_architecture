class ProjectOutput {
  const ProjectOutput({
    required this.id,
    required this.name,
    required this.description,
    required this.ownerId,
    required this.createdAt,
    required this.updatedAt,
    required this.memberIds,
  });

  final int id;
  final String name;
  final String description;
  final int ownerId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<String> memberIds;
}
