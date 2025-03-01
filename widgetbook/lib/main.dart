import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:provider/provider.dart';
import 'package:cinnamon_rolls_shop/src/cart_provider.dart';

// This file does not exist yet,
// it will be generated in the next step
import 'main.directories.g.dart';

void main() {
  // Run the app with the CartProvider using ChangeNotifierProvider
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: const WidgetbookApp(),
    ),
  );
}

@widgetbook.App()
class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      // The [directories] variable does not exist yet,
      // it will be generated in the next step
      directories: directories,
    );
  }
}
