// Importing necessary packages and files
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cinnamon_rolls_shop/src/widgets/cart_counter.dart';

// The main entry point for the test suite
void main() {
  // Test to check if CartCounter initializes with the correct quantity
  testWidgets('CartCounter initializes with the correct quantity',
      (WidgetTester tester) async {
    // Build the widget tree with MaterialApp and CartCounter
    await tester.pumpWidget(
      MaterialApp(
        home: CartCounter(
          onValueChanged: (value) {},
          initialQuantity: 1,
        ),
      ),
    );

    // Find the quantity display text and verify its presence
    var quantityDisplayText = find.byKey(const Key('quantity_display'));
    expect(quantityDisplayText, findsOneWidget);

    // Extract the Text widget and verify the initial quantity
    var quantityDisplayTextWidget = tester.widget<Text>(quantityDisplayText);
    expect(quantityDisplayTextWidget.data, "01");

    // Simulate a tap on the 'add' icon
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that the quantity display is updated after incrementing
    quantityDisplayTextWidget = tester.widget<Text>(quantityDisplayText);
    expect(quantityDisplayTextWidget.data, "02");

    // Simulate a tap on the 'remove' icon
    await tester.tap(find.byIcon(Icons.remove));
    await tester.pump();

    // Verify that the quantity display is updated after decrementing
    quantityDisplayTextWidget = tester.widget<Text>(quantityDisplayText);
    expect(quantityDisplayTextWidget.data, "01");
  });

  // Test to check if CartCounter does not decrement below 1
  testWidgets('CartCounter does not decrement below 1',
      (WidgetTester tester) async {
    // Build the widget tree with MaterialApp and CartCounter
    await tester.pumpWidget(
      MaterialApp(
        home: CartCounter(
          onValueChanged: (value) {},
          initialQuantity: 1,
        ),
      ),
    );

    // Find the quantity display text and verify its presence
    var quantityDisplayText = find.byKey(const Key('quantity_display'));
    expect(quantityDisplayText, findsOneWidget);

    // Extract the Text widget and verify the initial quantity
    var quantityDisplayTextWidget = tester.widget<Text>(quantityDisplayText);
    expect(quantityDisplayTextWidget.data, "01");

    // Simulate a tap on the 'remove' icon
    await tester.tap(find.byIcon(Icons.remove));
    await tester.pump();

    // Verify that the quantity display does not go below 1
    quantityDisplayTextWidget = tester.widget<Text>(quantityDisplayText);
    expect(quantityDisplayTextWidget.data, "01");
  });
}
