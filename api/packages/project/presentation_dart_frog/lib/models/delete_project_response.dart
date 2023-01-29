import 'package:json_annotation/json_annotation.dart';

part 'delete_project_response.g.dart';

@JsonSerializable()
class DeleteProjectResponse {
  const DeleteProjectResponse({
    required this.message,
  });

  factory DeleteProjectResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteProjectResponseFromJson(json);

  final String message;

  Map<String, dynamic> toJson() => _$DeleteProjectResponseToJson(this);
}
