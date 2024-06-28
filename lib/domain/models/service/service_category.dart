import 'package:json_annotation/json_annotation.dart';

part 'service_category.g.dart';

@JsonSerializable()
class ServiceCategory {
  final String id;
  @JsonKey(name: 'category_name')
  final String categoryName;
  final String? description;
  @JsonKey(name: 'is_deleted')
  final bool isDeleted;

  const ServiceCategory({
    required this.id,
    required this.categoryName,
    this.description,
    required this.isDeleted,
  });

  factory ServiceCategory.fromJson(Map<String, dynamic> json) =>
      _$ServiceCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceCategoryToJson(this);
}