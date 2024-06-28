// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductCategory _$ProductCategoryFromJson(Map<String, dynamic> json) =>
    ProductCategory(
      id: json['id'] as String,
      categoryName: json['category_name'] as String,
      description: json['description'] as String,
      isDeleted: json['is_deleted'] as bool,
    );

Map<String, dynamic> _$ProductCategoryToJson(ProductCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category_name': instance.categoryName,
      'description': instance.description,
      'is_deleted': instance.isDeleted,
    };
