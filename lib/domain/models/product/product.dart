import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  final String id;
  @JsonKey(name: 'product_name')
  final String productName;
  @JsonKey(name: 'product_price')
  final double productPrice;
  @JsonKey(name: 'product_description')
  final String? productDescription;
  @JsonKey(name: 'category_id')
  final String? categoryId;
  final String status;
  @JsonKey(name: 'is_deleted')
  final int isDeleted;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @JsonKey(name: 'modified_at')
  final DateTime modifiedAt;

  const Product({
    required this.id,
    required this.productName,
    required this.productPrice,
    this.productDescription,
    this.categoryId,
    required this.status,
    required this.isDeleted,
    required this.createdAt,
    required this.modifiedAt,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
