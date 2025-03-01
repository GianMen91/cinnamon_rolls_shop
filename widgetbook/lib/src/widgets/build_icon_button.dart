import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

// Import the widget from your app
import 'package:cinnamon_rolls_shop/src/widgets/build_icon_button.dart';

@widgetbook.UseCase(name: 'Default', type: BuildIconButton)
Widget buildBuildIconButtonUseCase(BuildContext context) {
  return BuildIconButton(icon: Icons.remove, onPressed: () {  },);
}
