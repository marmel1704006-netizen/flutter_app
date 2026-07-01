import 'package:flutter/material.dart';
import '../models/product.dart';

class CartProvider with ChangeNotifier {
  final Map<String, int> _items = {};

  Map<String, int> get items => Map.unmodifiable(_items);

  int get totalCount => _items.values.fold(0, (sum, qty) => sum + qty);

  bool isInCart(String productId) => _items.containsKey(productId);

  void addToCart(String productId) {
    _items[productId] = (_items[productId] ?? 0) + 1;
    notifyListeners();
  }

  void removeFromCart(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void decrementQuantity(String productId) {
    if (!_items.containsKey(productId)) return;
    if (_items[productId]! <= 1) {
      _items.remove(productId);
    } else {
      _items[productId] = _items[productId]! - 1;
    }
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }

  List<Product> getCartProducts(List<Product> allProducts) {
    return allProducts.where((p) => _items.containsKey(p.id)).toList();
  }

  double totalPrice(List<Product> allProducts) {
    return getCartProducts(allProducts).fold(0, (sum, p) {
      return sum + p.price * (_items[p.id] ?? 1);
    });
  }
}