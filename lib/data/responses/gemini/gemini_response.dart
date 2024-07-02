import 'package:json_annotation/json_annotation.dart';

part 'gemini_response.g.dart';

@JsonSerializable()
class GeminiResponse {
  final String message;
  final Data? data;

  GeminiResponse({
    required this.message,
    this.data,
  });

  factory GeminiResponse.fromJson(Map<String, dynamic> json) =>
      _$GeminiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GeminiResponseToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: 'is_done')
  final bool? isDone;
  @JsonKey(name: 'user_id')
  final String? userId;
  @JsonKey(name: 'service_id')
  final String? serviceId;
  @JsonKey(name: 'date_time')
  final String? dateTime;

  Data(this.isDone, this.userId, this.serviceId, this.dateTime);

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
