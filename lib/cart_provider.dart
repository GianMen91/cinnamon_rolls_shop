// Import necessary packages and files
import 'package:collection/src/iterable_extensions.dart';
import 'package:flutter/material.dart';

// Import custom Cinnamon class
import 'cinnamon.dart';

// Define a class for representing items in the cart
class CartItem {
  final Cinnamon cinnamon; // The cinnamon item in the cart
  final int quantity; // The quantity of the cinnamon item

  // Constructor to initialize CartItem
  CartItem({required this.cinnamon, required this.quantity});

  // Method to create a copy of the CartItem with optional modifications
  CartItem copyWith({Cinnamon? cinnamon, int? quantity}) {
    return CartItem(
      cinnamon: cinnamon ?? this.cinnamon,
      quantity: quantity ?? this.quantity,
    );
  }
}

// Define a class for managing the shopping cart
class CartProvider extends ChangeNotifier {
  final List<CartItem> _cartItems = []; // List to store cart items

  // Getter to access the list of cart items
  List<CartItem> get cartItems => _cartItems;

  // Method to find the index of a cart item based on the cinnamon type
  int indexOfCartItem(Cinnamon cinnamon) {
    var item = _cartItems.firstWhereOrNull((item) => item.cinnamon == cinnamon);
    return item != null ? _cartItems.indexOf(item) : -1;
  }

  // Method to add a new item or update the quantity of an existing item in the cart
  void addToCart(Cinnamon cinnamon, int quantity) {
    final index = indexOfCartItem(cinnamon);

    if (index != -1) {
      // If the item already exists, update its quantity
      _cartItems[index] = _cartItems[index]
          .copyWith(quantity: _cartItems[index].quantity + quantity);
    } else {
      // If the item is not in the cart, add a new CartItem
      _cartItems.add(CartItem(cinnamon: cinnamon, quantity: quantity));
    }

    notifyListeners(); // Notify listeners about the change in the cart
  }

  // Method to set the quantity of a specific item in the cart
  void setQuantity(Cinnamon cinnamon, int newQuantity) {
    final index = indexOfCartItem(cinnamon);

    if (index != -1) {
      // If the item exists, update its quantity
      _cartItems[index] = _cartItems[index].copyWith(quantity: newQuantity);
      notifyListeners(); // Notify listeners about the change in the cart
    }
  }

  // Method to remove a specific item from the cart
  void removeItem(Cinnamon item) {
    _cartItems.removeWhere((cartItem) => cartItem.cinnamon == item);
    notifyListeners(); // Notify listeners about the change in the cart
  }
}
