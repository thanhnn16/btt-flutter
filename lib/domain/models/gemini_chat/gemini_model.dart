import 'package:json_annotation/json_annotation.dart';

part 'gemini_model.g.dart';

@JsonSerializable()
class GeminiModel {
  GeminiModel({
    required this.message,
    required this.data,
  });

  factory GeminiModel.fromJson(Map<String, dynamic> json) =>
      _$GeminiModelFromJson(json);

  Map<String, dynamic> toJson() => _$GeminiModelToJson(this);

  final String message;
  final Data data;
}

@JsonSerializable()
class Data {
  Data({
    required this.serviceId,
    required this.dateTime,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);

  @JsonKey(name: 'service_id')
  final String serviceId;
  @JsonKey(name: 'date_time')
  final String dateTime;
}
