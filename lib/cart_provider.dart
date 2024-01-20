import 'package:collection/src/iterable_extensions.dart';
import 'package:flutter/material.dart';
import 'cinnamon.dart';

class CartItem {
  final Cinnamon cinnamon;
  final int quantity;

  CartItem({required this.cinnamon, required this.quantity});

  CartItem copyWith({Cinnamon? cinnamon, int? quantity}) {
    return CartItem(
      cinnamon: cinnamon ?? this.cinnamon,
      quantity: quantity ?? this.quantity,
    );
  }
}

class CartProvider extends ChangeNotifier {
  final List<CartItem> _cartItems = [];
  final Set<Cinnamon> _cartItemsSet = {};

  List<CartItem> get cartItems => _cartItems;

  int indexOfCartItem(Cinnamon cinnamon) {
    var item = _cartItems.firstWhereOrNull((item) => item.cinnamon == cinnamon);
    return item != null ? _cartItems.indexOf(item) : -1;
  }

  void addToCart(Cinnamon cinnamon, int quantity) {
    final index = indexOfCartItem(cinnamon);

    if (index != -1) {
      _cartItems[index] = _cartItems[index].copyWith(quantity: _cartItems[index].quantity + quantity);
    } else {
      _cartItems.add(CartItem(cinnamon: cinnamon, quantity: quantity));
    }

    notifyListeners();
  }

  void setQuantity(Cinnamon cinnamon, int newQuantity) {
    final index = indexOfCartItem(cinnamon);

    if (index != -1) {
      _cartItems[index] = _cartItems[index].copyWith(quantity: newQuantity);
      notifyListeners();
    }
  }

  void removeItem(Cinnamon item) {
    _cartItems.removeWhere((cartItem) => cartItem.cinnamon == item);
    notifyListeners();
  }
}