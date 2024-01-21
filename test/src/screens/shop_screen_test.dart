import 'package:cinnamon_rolls_shop/src/cart_provider.dart';
import 'package:cinnamon_rolls_shop/src/screens/cart_screen.dart';
import 'package:cinnamon_rolls_shop/src/screens/item_screen.dart';
import 'package:cinnamon_rolls_shop/src/screens/shop_screen.dart';
import 'package:cinnamon_rolls_shop/src/widgets/item_card.dart';
import 'package:cinnamon_rolls_shop/src/widgets/search_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
  group('ShopScreen', () {
    testWidgets('Renders ShopScreen correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
          child: const MaterialApp(
            home: ShopScreen(),
          ),
        ),
      );

      await tester.pumpAndSettle(); // Wait for animations to complete

      expect(find.byType(ShopScreen), findsOneWidget);

      expect(find.byType(SearchBox), findsOneWidget);
      expect(find.text('All'), findsOneWidget);
      expect(find.byType(ItemCard), findsWidgets);
    });

    testWidgets('Search for cinnamon items', (WidgetTester tester) async {
      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
          child: const MaterialApp(
            home: ShopScreen(),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Enter a search value into the SearchBox
      await tester.enterText(find.byType(TextField), 'Test Cinnamon');

      // Wait for the filtering to take effect
      await tester.pump();

      // Verify that the filtered item is found
      expect(find.text('Test Cinnamon'), findsOneWidget);
    });

    testWidgets('Filter by cinnamon types', (WidgetTester tester) async {
      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
          child: const MaterialApp(
            home: ShopScreen(),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Tap on a cinnamon type button
      await tester.tap(find.text('Fruity Rolls'));
      await tester.pump();

      // Verify that the filtered item is found
      expect(find.text('Fruity Rolls'), findsOneWidget);
    });

    testWidgets('Tap on ItemCard navigates to ItemScreen',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
          child: const MaterialApp(
            home: ShopScreen(),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Tap on an ItemCard
      await tester.tap(find.byType(ItemCard).first);
      await tester.pump();

      // Verify that the navigation to ItemScreen occurs
      expect(find.byType(ItemScreen), findsOneWidget);
    });

    testWidgets('Tap on cart icon navigates to CartScreen',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
          child: const MaterialApp(
            home: ShopScreen(),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Tap on the cart icon
      await tester.tap(find.byIcon(Icons.shopping_cart));
      await tester.pump();

      // Verify that the navigation to CartScreen occurs
      expect(find.byType(CartScreen), findsOneWidget);
    });
  });
}
