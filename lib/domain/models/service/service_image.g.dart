// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceImage _$ServiceImageFromJson(Map<String, dynamic> json) => ServiceImage(
      id: json['id'] as String,
      serviceId: json['service_id'] as String,
      imagePath: json['image_path'] as String,
      isDeleted: json['is_deleted'] as bool,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$ServiceImageToJson(ServiceImage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'service_id': instance.serviceId,
      'image_path': instance.imagePath,
      'is_deleted': instance.isDeleted,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
