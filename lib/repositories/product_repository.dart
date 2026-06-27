import '../models/mock_data.dart';
import '../models/product.dart';

class ProductRepository {
  Future<List<Product>> fetchProducts() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return MockData.products;
  }
}