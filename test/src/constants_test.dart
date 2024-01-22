// Importing necessary packages and files
import 'package:cinnamon_rolls_shop/src/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// The main entry point for the test suite
void main() {
  // Test to check if color constants are defined correctly
  test('Color constants are defined correctly', () {
    // Verifying that lightTextColor is of type Color
    expect(lightTextColor, isA<Color>());

    // Verifying that darkTextColor is of type Color
    expect(darkTextColor, isA<Color>());

    // Verifying that backgroundColor is of type Color
    expect(backgroundColor, isA<Color>());

    // Verifying that menuBackgroundColor is of type Color
    expect(menuBackgroundColor, isA<Color>());
  });
}
