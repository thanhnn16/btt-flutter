import 'package:json_annotation/json_annotation.dart';

part 'service_review.g.dart';

@JsonSerializable()
class ServiceReview {
  final String id;
  @JsonKey(name: 'service_id')
  final String serviceId;
  @JsonKey(name: 'user_id')
  final String userId;
  final String content;
  final int rating;
  @JsonKey(name: 'is_deleted')
  final bool isDeleted;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  const ServiceReview({
    required this.id,
    required this.serviceId,
    required this.userId,
    required this.content,
    required this.rating,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ServiceReview.fromJson(Map<String, dynamic> json) =>
      _$ServiceReviewFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceReviewToJson(this);
}