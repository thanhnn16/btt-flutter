// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceReview _$ServiceReviewFromJson(Map<String, dynamic> json) =>
    ServiceReview(
      id: json['id'] as String,
      serviceId: json['service_id'] as String,
      userId: json['user_id'] as String,
      content: json['content'] as String,
      rating: (json['rating'] as num).toInt(),
      isDeleted: json['is_deleted'] as bool,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$ServiceReviewToJson(ServiceReview instance) =>
    <String, dynamic>{
      'id': instance.id,
      'service_id': instance.serviceId,
      'user_id': instance.userId,
      'content': instance.content,
      'rating': instance.rating,
      'is_deleted': instance.isDeleted,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
