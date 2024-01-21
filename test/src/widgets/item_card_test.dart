import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cinnamon_rolls_shop/src/models/cinnamon.dart';
import 'package:cinnamon_rolls_shop/src/widgets/item_card.dart';

void main() {
  testWidgets('ItemCard displays cinnamon title and price correctly',
          (WidgetTester tester) async {
        // Create a Cinnamon object for testing
        final Cinnamon testCinnamon = Cinnamon(
          id: 1,
          title: 'Test Cinnamon',
          type: 'Test Type',
          price: 5.99,
          description: 'Test Description',
          image: 'assets/images/test_image.jpg',
          color: Colors.red,
        );

        // Variable to track whether the press callback is invoked
        bool callbackInvoked = false;

        // Build our widget and trigger a frame
        await tester.pumpWidget(
          MaterialApp(
            home: ItemCard(
              cinnamon: testCinnamon,
              press: () {
                callbackInvoked = true;
              },
            ),
          ),
        );

        // Verify that the title and price are displayed correctly
        expect(find.text('Test Cinnamon'), findsOneWidget);
        expect(find.text('5.99 €'), findsOneWidget);

        // Verify that the image is displayed
        expect(find.byType(Image), findsOneWidget);

        // Tap the item card
        await tester.tap(find.byType(ItemCard));
        await tester.pump();

        // Verify that the press callback is invoked
        expect(callbackInvoked, true);
      });
}
