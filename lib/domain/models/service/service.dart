import 'package:json_annotation/json_annotation.dart';

part 'service.g.dart';

@JsonSerializable()
class Service {
  final String id;
  @JsonKey(name: 'service_name')
  final String serviceName;
  @JsonKey(name: 'service_price')
  final double servicePrice;
  @JsonKey(name: 'service_description')
  final String? serviceDescription;
  @JsonKey(name: 'category_id')
  final String? categoryId;
  final String? status;
  @JsonKey(name: 'is_deleted')
  final bool isDeleted;

  Service(
      {required this.id,
      required this.serviceName,
      required this.servicePrice,
      required this.serviceDescription,
      required this.categoryId,
      required this.status,
      required this.isDeleted,
      });

  factory Service.fromJson(Map<String, dynamic> json) =>
      _$ServiceFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceToJson(this);
}
