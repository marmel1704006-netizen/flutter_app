import 'package:flutter/material.dart';
import '../models/product.dart';

class WishlistProvider with ChangeNotifier {
  // Set замість List — O(1) + автоматично унікальні значення
  final Set<String> _favoriteIds = {};

  Set<String> get favoriteIds => Set.unmodifiable(_favoriteIds);

  int get totalCount => _favoriteIds.length;

  bool isFavorite(String productId) => _favoriteIds.contains(productId);

  void toggleFavorite(String productId) {
    if (_favoriteIds.contains(productId)) {
      _favoriteIds.remove(productId);
    } else {
      _favoriteIds.add(productId);
    }
    notifyListeners();
  }

  List<Product> getFavorites(List<Product> allProducts) {
    return allProducts.where((p) => _favoriteIds.contains(p.id)).toList();
  }
}