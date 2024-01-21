import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cinnamon_rolls_shop/src/widgets/cart_counter.dart';

void main() {
  testWidgets('CartCounter initializes with the correct quantity',
          (WidgetTester tester) async {
        // Build our widget and trigger a frame
        await tester.pumpWidget(
          MaterialApp(
            home: CartCounter(
              onValueChanged: (value) {},
              initialQuantity: 3,
            ),
          ),
        );

        // Verify that the text displays the correct initial quantity
        expect(find.text('03'), findsOneWidget);
      });

  testWidgets('CartCounter decrements quantity correctly',
          (WidgetTester tester) async {
        // Variable to track the value changed callback
        int changedValue = 0;

        // Build our widget and trigger a frame
        await tester.pumpWidget(
          MaterialApp(
            home: CartCounter(
              onValueChanged: (value) {
                changedValue = value;
              },
              initialQuantity: 3,
            ),
          ),
        );

        // Tap the decrease button
        await tester.tap(find.byIcon(Icons.remove));
        await tester.pump();

        // Verify that the quantity decreases and the callback is invoked
        expect(find.text('02'), findsOneWidget);
        expect(changedValue, 2);
      });

  testWidgets('CartCounter does not decrement below 1',
          (WidgetTester tester) async {
        // Variable to track the value changed callback
        int changedValue = 0;

        // Build our widget and trigger a frame
        await tester.pumpWidget(
          MaterialApp(
            home: CartCounter(
              onValueChanged: (value) {
                changedValue = value;
              },
              initialQuantity: 1,
            ),
          ),
        );

        // Tap the decrease button
        await tester.tap(find.byIcon(Icons.remove));
        await tester.pump();

        // Verify that the quantity remains 1 and the callback is not invoked
        expect(find.text('01'), findsOneWidget);
        expect(changedValue, 0); // Callback should not be invoked
      });

  testWidgets('CartCounter increments quantity correctly',
          (WidgetTester tester) async {
        // Variable to track the value changed callback
        int changedValue = 0;

        // Build our widget and trigger a frame
        await tester.pumpWidget(
          MaterialApp(
            home: CartCounter(
              onValueChanged: (value) {
                changedValue = value;
              },
              initialQuantity: 3,
            ),
          ),
        );

        // Tap the increase button
        await tester.tap(find.byIcon(Icons.add));
        await tester.pump();

        // Verify that the quantity increases and the callback is invoked
        expect(find.text('04'), findsOneWidget);
        expect(changedValue, 4);
      });
}
