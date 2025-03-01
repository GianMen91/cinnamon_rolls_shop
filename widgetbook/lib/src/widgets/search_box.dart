import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

// Import the widget from your app
import 'package:cinnamon_rolls_shop/src/widgets/search_box.dart';

@widgetbook.UseCase(name: 'Default', type: SearchBox)
Widget buildSearchBoxUseCase(BuildContext context) {
  return SearchBox(onChanged: (value) => {});
}
