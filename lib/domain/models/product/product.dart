import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  final String id;
  final String productName;
  final double productPrice;
  final String? productDescription;
  final String? categoryId;
  final String status;
  final bool isDeleted;
  final DateTime createdAt;
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
