import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

// Import the widget from your app
import 'package:cinnamon_rolls_shop/src/widgets/type_selector.dart';

@widgetbook.UseCase(name: 'Default', type: TypeSelector)
Widget buildTypeSelectorUseCase(BuildContext context) {
  return TypeSelector(onChanged: (value) => {});
}
