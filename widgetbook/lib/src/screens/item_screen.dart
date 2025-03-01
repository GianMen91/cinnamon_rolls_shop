import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

// Import the widget from your app
import 'package:cinnamon_rolls_shop/src/screens/item_screen.dart';
import 'package:cinnamon_rolls_shop/src/models/cinnamon.dart';

@widgetbook.UseCase(name: 'Default', type: ItemScreen)
Widget buildItemScreenUseCase(BuildContext context) {
  return ItemScreen(
    cinnamon: Cinnamon(
      id: 1,
      title: "Classic Roll",
      price: 4.80,
      type: "Cinnamon Rolls",
      description:
      "Timeless: fluffy dough with cinnamon filling, topped with cream cheese frosting.",
      image: "images/Classic-Roll-Vegan.png", // ✅ Corrected path (no "assets/")
      color: const Color(0xFFD3A984),
    ),
  );
}
