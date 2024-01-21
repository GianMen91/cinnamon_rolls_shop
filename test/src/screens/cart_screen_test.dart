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
          child: MaterialApp(
            home: CartScreen(),
          ),
        ),
      );

      await tester.pumpAndSettle();
      expect(find.byKey(Key('checkout_button')), findsOneWidget);
    });

    testWidgets('Add and remove item from cart', (WidgetTester tester) async {
      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
          child: MaterialApp(
            home: CartScreen(),
          ),
        ),
      );

      await tester.pumpAndSettle();


      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();

      var totalPrice = find.byKey(Key('total_price'))

      expect(find.text('Total 4.80 €'), findsOneWidget);

      await tester.tap(find.byIcon(Icons.delete));
      await tester.pump();

      expect(find.text('Total 0.00 €'), findsOneWidget);
    });

    testWidgets('Proceed to Checkout button triggers SnackBar', (WidgetTester tester) async {
      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
          child: MaterialApp(
            home: CartScreen(),
          ),
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(find.byKey(Key('checkout_button')));
      await tester.pump();

      expect(find.byKey(Key('cart_snackbar')), findsOneWidget);
    });

    testWidgets('SnackBar is not present if not triggered', (WidgetTester tester) async {
      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
          child: MaterialApp(
            home: CartScreen(),
          ),
        ),
      );

      expect(find.byKey(Key('cart_snackbar')), findsNothing);
    });

    // Add more tests as needed...
  });
}