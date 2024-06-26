import 'package:json_annotation/json_annotation.dart';

part 'service_image.g.dart';

@JsonSerializable()
class ServiceImage {
  final String id;
  @JsonKey(name: 'service_id')
  final String serviceId;
  @JsonKey(name: 'image_path')
  final String imagePath;
  @JsonKey(name: 'is_deleted')
  final bool isDeleted;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  const ServiceImage({
    required this.id,
    required this.serviceId,
    required this.imagePath,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ServiceImage.fromJson(Map<String, dynamic> json) =>
      _$ServiceImageFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceImageToJson(this);
}