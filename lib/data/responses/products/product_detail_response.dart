import 'package:bongtuyettrang/domain/models/product/product.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class ProductDetailResponse {
  final int status;
  final String message;
  final Product product;

  ProductDetailResponse({
    required this.status,
    required this.message,
    required this.product,
  });
}
