import 'package:json_annotation/json_annotation.dart';

part 'put_project_response.g.dart';

@JsonSerializable()
class PutProjectResponse {
  const PutProjectResponse({
    required this.id,
    required this.name,
    required this.description,
    required this.ownerId,
    required this.createdAt,
    required this.updatedAt,
    required this.memberIds,
  });

  factory PutProjectResponse.fromJson(Map<String, dynamic> json) =>
      _$PutProjectResponseFromJson(json);

  final int id;
  final String name;
  final String description;
  final int ownerId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<String> memberIds;

  Map<String, dynamic> toJson() => _$PutProjectResponseToJson(this);
}
