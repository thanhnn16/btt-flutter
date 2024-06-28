// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Service _$ServiceFromJson(Map<String, dynamic> json) => Service(
      id: json['id'] as String,
      serviceName: json['service_name'] as String,
      servicePrice: (json['service_price'] as num).toDouble(),
      serviceDescription: json['service_description'] as String?,
      categoryId: json['category_id'] as String?,
      status: json['status'] as String?,
      isDeleted: json['is_deleted'] as bool,
    );

Map<String, dynamic> _$ServiceToJson(Service instance) => <String, dynamic>{
      'id': instance.id,
      'service_name': instance.serviceName,
      'service_price': instance.servicePrice,
      'service_description': instance.serviceDescription,
      'category_id': instance.categoryId,
      'status': instance.status,
      'is_deleted': instance.isDeleted,
    };
