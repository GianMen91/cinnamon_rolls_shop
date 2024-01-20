import 'package:flutter/material.dart';

import 'cinnamon.dart';

class CartProvider extends ChangeNotifier {
  List<Cinnamon> _cartItems = [];

  List<Cinnamon> get cartItems => _cartItems;

  void addToCart(Cinnamon item) {
    _cartItems.add(item);
    notifyListeners();
  }
}
