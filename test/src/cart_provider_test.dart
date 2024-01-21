import 'package:cinnamon_rolls_shop/src/cart_provider.dart';
import 'package:cinnamon_rolls_shop/src/models/cinnamon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('CartProvider adds item to cart', () {
    // Create a new instance of CartProvider
    final cartProvider = CartProvider();

    // Create a sample cinnamon item
    final cinnamon = Cinnamon(
      id: 1,
      title: 'Test Cinnamon',
      type: 'Cinnamon Rolls',
      price: 5.99,
      image: 'assets/cinnamon.jpg',
      color: Colors.brown,
      description: 'A delicious test cinnamon roll.',
    );

    // Add the cinnamon item to the cart with a quantity of 2
    cartProvider.addToCart(cinnamon, 2);

    // Verify that the cart has one item
    expect(cartProvider.cartItems.length, 1);

    // Verify the quantity of the added item
    expect(cartProvider.cartItems[0].quantity, 2);
  });

  test('CartProvider updates quantity of existing item in cart', () {
    // Create a new instance of CartProvider
    final cartProvider = CartProvider();

    // Create a sample cinnamon item
    final cinnamon = Cinnamon(
      id: 2,
      title: 'Test Cinnamon 2',
      type: 'Cinnamon Rolls',
      price: 6.99,
      image: 'assets/cinnamon2.jpg',
      color: Colors.cyan,
      description: 'Another delicious test cinnamon roll.',
    );

    // Add the cinnamon item to the cart with a quantity of 1
    cartProvider.addToCart(cinnamon, 1);

    // Update the quantity of the existing item in the cart to 3
    cartProvider.addToCart(cinnamon, 2);

    // Verify that the cart still has one item
    expect(cartProvider.cartItems.length, 1);

    // Verify the updated quantity of the item
    expect(cartProvider.cartItems[0].quantity, 3);
  });

  test('CartProvider removes item from cart', () {
    // Create a new instance of CartProvider
    final cartProvider = CartProvider();

    // Create two sample cinnamon items
    final cinnamon1 = Cinnamon(
      id: 3,
      title: 'Test Cinnamon 3',
      type: 'Cinnamon Rolls',
      price: 7.99,
      image: 'assets/cinnamon3.jpg',
      color: Colors.orange,
      description: 'Yet another delicious test cinnamon roll.',
    );

    final cinnamon2 = Cinnamon(
      id: 4,
      title: 'Test Cinnamon 4',
      type: 'Fruity Rolls',
      price: 8.99,
      image: 'assets/cinnamon4.jpg',
      color: Colors.purple,
      description: 'A fruity test cinnamon roll.',
    );

    // Add the cinnamon items to the cart with different quantities
    cartProvider.addToCart(cinnamon1, 2);
    cartProvider.addToCart(cinnamon2, 1);

    // Verify that the cart has two items
    expect(cartProvider.cartItems.length, 2);

    // Remove the first cinnamon item from the cart
    cartProvider.removeItem(cinnamon1);

    // Verify that the cart now has one item
    expect(cartProvider.cartItems.length, 1);

    // Verify the title of the remaining item
    expect(cartProvider.cartItems[0].cinnamon.title, 'Test Cinnamon 4');
  });
}
