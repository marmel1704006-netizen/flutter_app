import 'package:flutter/material.dart';
import '../models/category.dart';
import '../models/product.dart';
import '../repositories/product_repository.dart';

enum LoadingStatus { initial, loading, loaded, error }

class ProductProvider with ChangeNotifier {
  final ProductRepository _repository = ProductRepository();

  List<Product> _products = [];
  List<ProductCategory> _categories = [];
  int _selectedCategoryId = 0;
  LoadingStatus _status = LoadingStatus.initial;
  String? _errorMessage;

  List<Product> get products => _products;
  List<ProductCategory> get categories => _categories;
  int get selectedCategoryId => _selectedCategoryId;
  LoadingStatus get status => _status;
  String? get errorMessage => _errorMessage;

  List<Product> get filteredProducts {
    if (_selectedCategoryId == 0) return _products;
    return _products.where((p) => p.categoryId == _selectedCategoryId).toList();
  }

  Future<void> loadProducts() async {
    _status = LoadingStatus.loading;
    _errorMessage = null;
    notifyListeners();

    try {
      final (categories, categoryError) = await _repository.fetchCategories();
      final (products, productError) = await _repository.fetchProducts();

      if (productError != null || categoryError != null) {
        _status = LoadingStatus.error;
        _errorMessage = productError ?? categoryError;
      } else {
        _categories = categories;
        _products = products;
        _status = LoadingStatus.loaded;
      }
    } catch (e) {
      _status = LoadingStatus.error;
      _errorMessage = 'Щось пішло не так. Спробуй ще раз.';
    }

    notifyListeners();
  }

  void selectCategory(int categoryId) {
    _selectedCategoryId = categoryId;
    notifyListeners();
  }
}