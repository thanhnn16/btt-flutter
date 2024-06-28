import 'package:json_annotation/json_annotation.dart';

part 'product_category.g.dart';

@JsonSerializable()
class ProductCategory {
  final String id;
@JsonKey(name: 'category_name')
  final String categoryName;
  final String description;
@JsonKey(name: 'is_deleted')
  final bool isDeleted;
// @JsonKey(name: 'created_at')
//   final DateTime createdAt;
// @JsonKey(name: 'updated_at')
//   final DateTime updatedAt;

  ProductCategory({
    required this.id,
    required this.categoryName,
    required this.description,
    required this.isDeleted,
    // required this.createdAt,
    // required this.updatedAt,
  });

  factory ProductCategory.fromJson(Map<String, dynamic> json) =>
      _$ProductCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$ProductCategoryToJson(this);


}
