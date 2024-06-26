// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_category_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceCategoryResponse _$ServiceCategoryResponseFromJson(
        Map<String, dynamic> json) =>
    ServiceCategoryResponse(
      status: (json['status'] as num?)?.toInt(),
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ServiceCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ServiceCategoryResponseToJson(
        ServiceCategoryResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
