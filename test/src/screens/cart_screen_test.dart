// Importing necessary packages and files
import 'package:cinnamon_rolls_shop/src/cart_provider.dart';
import 'package:cinnamon_rolls_shop/src/screens/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

// The main entry point for the test suite
void main() {
  // Grouping tests related to the 'CartScreen' widget
  group('CartScreen', () {
    // Test to ensure CartScreen renders correctly
    testWidgets('Renders CartScreen correctly', (WidgetTester tester) async {
      // Pumping the widget tree with CartScreen wrapped in a ChangeNotifierProvider
      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
          child: const MaterialApp(
            home: CartScreen(),
          ),
        ),
      );

      // Waiting for animations to complete
      await tester.pumpAndSettle();

      // Expecting the 'checkout_button' widget to be present
      expect(find.byKey(const Key('checkout_button')), findsOneWidget);
    });

    // Test to check if pressing 'Proceed to Checkout' button triggers a SnackBar
    testWidgets('Proceed to Checkout button triggers SnackBar',
        (WidgetTester tester) async {
      // Pumping the widget tree with CartScreen wrapped in a ChangeNotifierProvider
      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
          child: const MaterialApp(
            home: CartScreen(),
          ),
        ),
      );

      // Waiting for animations to complete
      await tester.pumpAndSettle();

      // Tapping the 'checkout_button'
      await tester.tap(find.byKey(const Key('checkout_button')));
      await tester.pump();

      // Expecting the 'cart_snackbar' widget to be present
      expect(find.byKey(const Key('cart_snackbar')), findsOneWidget);
    });

    // Test to check if SnackBar is not present when not triggered
    testWidgets('SnackBar is not present if not triggered',
        (WidgetTester tester) async {
      // Pumping the widget tree with CartScreen wrapped in a ChangeNotifierProvider
      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
          child: const MaterialApp(
            home: CartScreen(),
          ),
        ),
      );

      // Expecting the 'cart_snackbar' widget to be absent
      expect(find.byKey(const Key('cart_snackbar')), findsNothing);
    });
  });
}
