import 'dart:math';
import '../models/category.dart';
import '../models/mock_data.dart';
import '../models/product.dart';
import '../models/section.dart';

typedef ProductResult = (List<Product>, String?);
typedef CategoryResult = (List<ProductCategory>, String?);
typedef SectionResult = (List<ProductSection>, String?);

class ProductRepository {
  final Random _random = Random();

  Future<ProductResult> fetchProducts() async {
    await Future.delayed(const Duration(milliseconds: 800));

    if (_random.nextDouble() < 0.3) {
      return (<Product>[], 'Немає підключення до мережі. Спробуй ще раз.');
    }

    return (MockData.products, null);
  }

  Future<CategoryResult> fetchCategories() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return (MockData.categories, null);
  }

  // секції запит до бекенду
  Future<SectionResult> fetchSections() async {
    await Future.delayed(const Duration(milliseconds: 400));
    return (MockData.sections, null);
  }
}