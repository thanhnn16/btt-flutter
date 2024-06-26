import 'package:json_annotation/json_annotation.dart';

part 'service.g.dart';

@JsonSerializable()
class Service {
  final int id;
  @JsonKey(name: 'service_name')
  final String serviceName;
  @JsonKey(name: 'service_price')
  final double servicePrice;
  @JsonKey(name: 'service_description')
  final String? serviceDescription;
  @JsonKey(name: 'category_id')
  final int? categoryId;
  final String status;
  @JsonKey(name: 'is_deleted')
  final bool isDeleted;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @JsonKey(name: 'modified_at')
  final DateTime modifiedAt;

  const Service({
    required this.id,
    required this.serviceName,
    required this.servicePrice,
    this.serviceDescription,
    this.categoryId,
    required this.status,
    required this.isDeleted,
    required this.createdAt,
    required this.modifiedAt,
  });

  factory Service.fromJson(Map<String, dynamic> json) =>
      _$ServiceFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceToJson(this);

}