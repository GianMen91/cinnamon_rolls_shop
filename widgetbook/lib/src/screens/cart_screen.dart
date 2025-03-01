import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

// Import the widget from your app
import 'package:cinnamon_rolls_shop/src/screens/cart_screen.dart';

@widgetbook.UseCase(name: 'Default', type: CartScreen)
Widget buildCartScreenUseCase(BuildContext context) {
  return CartScreen();
}
