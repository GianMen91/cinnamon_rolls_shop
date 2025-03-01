import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

// Import the widget from your app
import 'package:cinnamon_rolls_shop/src/screens/splash_screen.dart';

@widgetbook.UseCase(name: 'Default', type: SplashScreen)
Widget buildSplashScreenUseCase(BuildContext context) {
  return SplashScreen();
}
