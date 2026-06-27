class Product {
  final String id;
  final String name;
  final int categoryId;
  final String categoryName;
  final String imageUrl;
  final double price;

  const Product({
    required this.id,
    required this.name,
    required this.categoryId,
    required this.categoryName,
    required this.imageUrl,
    required this.price,
  });
}