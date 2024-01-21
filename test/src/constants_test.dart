import 'package:cinnamon_rolls_shop/src/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Color constants are defined correctly', () {
    expect(lightTextColor, isA<Color>());
    expect(darkTextColor, isA<Color>());
    expect(backgroundColor, isA<Color>());
    expect(menuBackgroundColor, isA<Color>());
  });
}
