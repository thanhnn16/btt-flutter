import 'package:json_annotation/json_annotation.dart';

import '../../../domain/models/service/service_category.dart';

part 'service_category_response.g.dart';

@JsonSerializable()
class ServiceCategoryResponse {
  final int? status;
  final String? message;
  final List<ServiceCategory>? data;

  ServiceCategoryResponse({this.status, this.message, this.data});

  factory ServiceCategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$ServiceCategoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceCategoryResponseToJson(this);
}
