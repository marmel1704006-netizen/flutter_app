import 'package:flutter/material.dart';
import '../models/product.dart';
import '../repositories/product_repository.dart';

class ProductProvider with ChangeNotifier {
  final ProductRepository _repository = ProductRepository();

  List<Product> _products = [];
  int _selectedCategoryId = 0;

  final List<String> _favoriteProductIds = [];
  final List<String> _cartProductIds = [];

  List<Product> get products => _products;
  int get selectedCategoryId => _selectedCategoryId;
  List<String> get favoriteProductIds => _favoriteProductIds;
  List<String> get cartProductIds => _cartProductIds;

  List<Product> get favoriteProducts {
    return _products.where((p) => _favoriteProductIds.contains(p.id)).toList();
  }

  List<Product> get cartProducts {
    return _products.where((p) => _cartProductIds.contains(p.id)).toList();
  }

  List<Product> get filteredProducts {
    if (_selectedCategoryId == 0) return _products;
    return _products.where((p) => p.categoryId == _selectedCategoryId).toList();
  }

  Future<void> loadProducts() async {
    _products = await _repository.fetchProducts();
    notifyListeners();
  }

  void selectCategory(int categoryId) {
    _selectedCategoryId = categoryId;
    notifyListeners();
  }

  void toggleFavorite(String productId) {
    if (_favoriteProductIds.contains(productId)) {
      _favoriteProductIds.remove(productId);
    } else {
      _favoriteProductIds.add(productId);
    }
    notifyListeners();
  }

  bool isFavorite(String productId) => _favoriteProductIds.contains(productId);

  void toggleCart(String productId) {
    if (_cartProductIds.contains(productId)) {
      _cartProductIds.remove(productId);
    } else {
      _cartProductIds.add(productId);
    }
    notifyListeners();
  }

  bool isInCart(String productId) => _cartProductIds.contains(productId);
}