class ProductImage {
  final String id;
  final String productId;
  final String imagePath;
  final bool isDeleted;
  final DateTime createdAt;
  final DateTime updatedAt;

  ProductImage({
    required this.id,
    required this.productId,
    required this.imagePath,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
  });
}
