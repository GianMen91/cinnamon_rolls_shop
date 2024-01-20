import 'package:flutter/material.dart';
import 'cinnamon.dart';

class CartItem {
  Cinnamon cinnamon;
  int quantity;

  CartItem({required this.cinnamon, required this.quantity});
}

class CartProvider extends ChangeNotifier {
  List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  void addToCart(Cinnamon cinnamon, int quantity) {
    int index = _cartItems.indexWhere((item) => item.cinnamon == cinnamon);

    if (index != -1) {
      _cartItems[index].quantity += quantity;
    } else {
      _cartItems.add(CartItem(cinnamon: cinnamon, quantity: quantity));
    }

    notifyListeners();
  }

  void updateQuantity(Cinnamon cinnamon, int newQuantity) {
    int index = _cartItems.indexWhere((item) => item.cinnamon == cinnamon);

    if (index != -1) {
      _cartItems[index].quantity = newQuantity;
      notifyListeners();
    }
  }
}

