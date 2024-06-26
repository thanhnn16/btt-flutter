import 'package:json_annotation/json_annotation.dart';
import '../../../domain/models/service/service.dart';

part 'service_response.g.dart';

@JsonSerializable()
class ServiceResponse {
  final int status;
  final String message;
  final List<Service>? data;
  final Service? service;

  ServiceResponse(this.service,
      {required this.status, required this.message, this.data});

  factory ServiceResponse.fromJson(Map<String, dynamic> json) =>
      _$ServiceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceResponseToJson(this);
}
