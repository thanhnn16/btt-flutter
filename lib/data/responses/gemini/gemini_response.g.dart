// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gemini_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeminiResponse _$GeminiResponseFromJson(Map<String, dynamic> json) =>
    GeminiResponse(
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GeminiResponseToJson(GeminiResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      json['is_done'] as bool?,
      json['user_id'] as String?,
      json['service_id'] as String?,
      json['date_time'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'is_done': instance.isDone,
      'user_id': instance.userId,
      'service_id': instance.serviceId,
      'date_time': instance.dateTime,
    };
