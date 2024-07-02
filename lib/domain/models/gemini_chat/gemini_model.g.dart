// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gemini_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeminiModel _$GeminiModelFromJson(Map<String, dynamic> json) => GeminiModel(
      message: json['message'] as String,
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GeminiModelToJson(GeminiModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      serviceId: json['service_id'] as String,
      dateTime: json['date_time'] as String,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'service_id': instance.serviceId,
      'date_time': instance.dateTime,
    };
