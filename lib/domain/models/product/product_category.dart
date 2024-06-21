// CREATE TABLE product_categories
// (
// id            CHAR(36) PRIMARY KEY,
// category_name VARCHAR(255) NOT NULL,
// description   TEXT,
// is_deleted    BOOLEAN  DEFAULT FALSE,
// created_at    DATETIME DEFAULT CURRENT_TIMESTAMP,
// updated_at    DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
// );

class ProductCategory {
  final String id;
  final String categoryName;
  final String description;
  final bool isDeleted;
  final DateTime createdAt;
  final DateTime updatedAt;

  ProductCategory({
    required this.id,
    required this.categoryName,
    required this.description,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
  });

  static ProductCategory empty = ProductCategory(
    id: '',
    categoryName: '',
    description: '',
    isDeleted: false,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  );
}
