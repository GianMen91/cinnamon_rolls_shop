import 'package:cinnamon_rolls_shop/src/cart_provider.dart';
import 'package:cinnamon_rolls_shop/src/models/cinnamon.dart';
import 'package:cinnamon_rolls_shop/src/screens/item_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
  group('ItemScreen', () {
    final Cinnamon testCinnamon = Cinnamon(
      id: 1,
      title: "Test Cinnamon",
      price: 5.00,
      type: "Test Type",
      description: "Test Description",
      image: "assets/test_image.png", // Update with an actual image asset path
      color: Colors.blue,
    );

    testWidgets('Renders ItemScreen correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
          child: MaterialApp(
            home: ItemScreen(cinnamon: testCinnamon),
          ),
        ),
      );

      await tester.pumpAndSettle(); // Wait for animations to complete

      expect(find.byType(ItemScreen), findsOneWidget);
      expect(find.text('Add to order'.toUpperCase()), findsOneWidget);
      expect(find.text('Test Cinnamon'), findsOneWidget);
      expect(find.text('Test Type'), findsOneWidget);
      expect(find.text('Price\n5.00 €'), findsOneWidget);
    });

    testWidgets('Quantity management in ItemScreen', (WidgetTester tester) async {
      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
          child: MaterialApp(
            home: ItemScreen(cinnamon: testCinnamon),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('1'), findsOneWidget);

      // Tap the "+" button of CartCounter
      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();

      expect(find.text('2'), findsOneWidget);

      // Tap the "-" button of CartCounter
      await tester.tap(find.byIcon(Icons.remove));
      await tester.pump();

      expect(find.text('1'), findsOneWidget);
    });

    testWidgets('Add to order button adds item to cart', (WidgetTester tester) async {
      final CartProvider cartProvider = CartProvider();

      await tester.pumpWidget(
        ChangeNotifierProvider.value(
          value: cartProvider,
          child: MaterialApp(
            home: ItemScreen(cinnamon: testCinnamon),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Tap the "Add to order" button
      await tester.tap(find.text('Add to order'.toUpperCase()));
      await tester.pump();

      // Verify that the item is added to the cart
      expect(cartProvider.cartItems.length, 1);
      expect(cartProvider.cartItems[0].cinnamon, testCinnamon);
      expect(cartProvider.cartItems[0].quantity, 1);
    });

    // Add more tests as needed...
  });
}
