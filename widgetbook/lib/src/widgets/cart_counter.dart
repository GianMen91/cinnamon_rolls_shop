import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

// Import the widget from your app
import 'package:cinnamon_rolls_shop/src/widgets/cart_counter.dart';

@widgetbook.UseCase(name: 'Default', type: CartCounter)
Widget buildCartCounterUseCase(BuildContext context) {
  return CartCounter(
    onValueChanged: (value) {

    },
    initialQuantity: 1,
  );
}
