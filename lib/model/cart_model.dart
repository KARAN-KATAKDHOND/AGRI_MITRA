import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  final List<Map<String, String>> _cartItems = [];

  List<Map<String, String>> get cartItems => _cartItems;

  void addToCart(Map<String, String> item) {
    _cartItems.add(item);
    notifyListeners(); // This updates the UI
  }

  void removeFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  double getTotalPrice() {
    return _cartItems.fold(0.0, (total, item) {
      // Remove ₹ and convert to number
      return total +
          double.parse(item['price']!.replaceAll(RegExp(r'[^\d.]'), ''));
    });
  }
}
