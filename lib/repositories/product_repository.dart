import 'dart:math';
import '../models/category.dart';
import '../models/mock_data.dart';
import '../models/product.dart';

typedef ProductResult = (List<Product>, String?);
typedef CategoryResult = (List<ProductCategory>, String?);

class ProductRepository {
  final Random _random = Random();

  Future<ProductResult> fetchProducts() async {
    await Future.delayed(const Duration(milliseconds: 800));

    if (_random.nextDouble() < 0.3) {
      return (<Product>[], 'Немає підключення до мережі. Спробуй ще раз.');
    }

    return (MockData.products, null);
  }

  // ✅ Окремий метод для категорій — як і буде на реальному API
  Future<CategoryResult> fetchCategories() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return (MockData.categories, null);
  }
}