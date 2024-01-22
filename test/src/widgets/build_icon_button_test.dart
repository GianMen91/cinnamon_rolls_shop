// Importing necessary packages and files
import 'package:cinnamon_rolls_shop/src/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cinnamon_rolls_shop/src/widgets/build_icon_button.dart';

// The main entry point for the test suite
void main() {
  // Test to check if BuildIconButton displays all the components correctly
  testWidgets('BuildIconButton displays all the components',
      (WidgetTester tester) async {
    // Build the widget tree with MaterialApp and BuildIconButton
    await tester.pumpWidget(
      MaterialApp(
        home: BuildIconButton(
          onPressed: () {},
          icon: Icons.add,
        ),
      ),
    );

    // Find the BuildIconButtonOutlinedButton and verify its presence
    var buildIconButtonOutlinedButton =
        find.byKey(const Key('buildIconButtonOutlinedButton'));
    expect(buildIconButtonOutlinedButton, findsOneWidget);

    // Extract the Icon widget and verify its color
    final Icon iconWidget = tester.widget(find.byType(Icon));
    expect(iconWidget.color, equals(lightTextColor));
  });

  // Test to check if BuildIconButton invokes the onPressed callback
  testWidgets('BuildIconButton invokes onPressed callback',
      (WidgetTester tester) async {
    // Variable to track whether the onPressed callback is called
    bool onPressedCalled = false;

    // Build the widget tree with MaterialApp, Scaffold, and BuildIconButton
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BuildIconButton(
            icon: Icons.add,
            onPressed: () {
              onPressedCalled = true;
            },
          ),
        ),
      ),
    );

    // Tap on the BuildIconButton
    await tester.tap(find.byType(BuildIconButton));

    // Verify that the onPressed callback is called
    expect(onPressedCalled, isTrue);
  });
}
