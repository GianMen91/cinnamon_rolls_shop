import 'package:cinnamon_rolls_shop/src/cart_provider.dart';
import 'package:cinnamon_rolls_shop/src/screens/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
  group('CartScreen', () {
    testWidgets('Renders CartScreen correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
          child: const MaterialApp(
            home: CartScreen(),
          ),
        ),
      );

      await tester.pumpAndSettle();
      expect(find.byKey(const Key('checkout_button')), findsOneWidget);
    });

    testWidgets('Proceed to Checkout button triggers SnackBar',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
          child: const MaterialApp(
            home: CartScreen(),
          ),
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('checkout_button')));
      await tester.pump();

      expect(find.byKey(const Key('cart_snackbar')), findsOneWidget);
    });

    testWidgets('SnackBar is not present if not triggered',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
          child: const MaterialApp(
            home: CartScreen(),
          ),
        ),
      );

      expect(find.byKey(const Key('cart_snackbar')), findsNothing);
    });
  });
}
