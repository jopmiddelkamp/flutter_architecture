import 'package:json_annotation/json_annotation.dart';

part 'post_project_request.g.dart';

@JsonSerializable()
class PostProjectRequest {
  const PostProjectRequest({
    required this.name,
    required this.description,
    required this.ownerId,
  });

  factory PostProjectRequest.fromJson(Map<String, dynamic> json) =>
      _$PostProjectRequestFromJson(json);

  final String name;
  final String description;
  final int ownerId;

  Map<String, dynamic> toJson() => _$PostProjectRequestToJson(this);
}
