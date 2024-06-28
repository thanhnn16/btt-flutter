// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceCategory _$ServiceCategoryFromJson(Map<String, dynamic> json) =>
    ServiceCategory(
      id: json['id'] as String,
      categoryName: json['category_name'] as String,
      description: json['description'] as String?,
      isDeleted: json['is_deleted'] as bool,
    );

Map<String, dynamic> _$ServiceCategoryToJson(ServiceCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category_name': instance.categoryName,
      'description': instance.description,
      'is_deleted': instance.isDeleted,
    };
