// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Service _$ServiceFromJson(Map<String, dynamic> json) => Service(
      id: (json['id'] as num).toInt(),
      serviceName: json['service_name'] as String,
      servicePrice: (json['service_price'] as num).toDouble(),
      serviceDescription: json['service_description'] as String?,
      categoryId: (json['category_id'] as num?)?.toInt(),
      status: json['status'] as String,
      isDeleted: json['is_deleted'] as bool,
      createdAt: DateTime.parse(json['created_at'] as String),
      modifiedAt: DateTime.parse(json['modified_at'] as String),
    );

Map<String, dynamic> _$ServiceToJson(Service instance) => <String, dynamic>{
      'id': instance.id,
      'service_name': instance.serviceName,
      'service_price': instance.servicePrice,
      'service_description': instance.serviceDescription,
      'category_id': instance.categoryId,
      'status': instance.status,
      'is_deleted': instance.isDeleted,
      'created_at': instance.createdAt.toIso8601String(),
      'modified_at': instance.modifiedAt.toIso8601String(),
    };
