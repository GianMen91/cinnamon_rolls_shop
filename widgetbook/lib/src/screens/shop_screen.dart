import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

// Import the widget from your app
import 'package:cinnamon_rolls_shop/src/screens/shop_screen.dart';

@widgetbook.UseCase(name: 'Default', type: ShopScreen)
Widget buildShopScreenUseCase(BuildContext context) {
  return ShopScreen();
}
