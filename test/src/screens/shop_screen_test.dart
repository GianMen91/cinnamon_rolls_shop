import 'package:cinnamon_rolls_shop/src/cart_provider.dart';
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

      // Verify that the app bar is displayed
      expect(find.byKey(const Key('shop_app_bar')), findsOneWidget);

      // Verify that the search box is displayed
      expect(find.byKey(const Key('search_box')), findsOneWidget);
      expect(find.byType(SearchBox), findsOneWidget);

      // Verify that the type buttons container is displayed
      expect(find.byKey(const Key('type_buttons_container')), findsOneWidget);
      expect(find.text('All'), findsOneWidget);
      expect(find.text('Cinnamon Rolls'), findsOneWidget);
      expect(find.text('Fruity Rolls'), findsOneWidget);
      expect(find.text('Next Level Rolls'), findsOneWidget);

      expect(find.byType(ItemCard), findsWidgets);
    });

    testWidgets('Tap on empty cart triggers SnackBar',
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

      var emptyCartIcon = find.byKey(const Key('empty_cart_icon'));
      expect(emptyCartIcon, findsOneWidget);

      // Tap the add to order button
      await tester.tap(emptyCartIcon);
      await tester.pump();

      // Verify that the SnackBar is present
      expect(find.byKey(const Key('empty_cart_snackBar')), findsOneWidget);
    });

    testWidgets('SnackBar is not visible by default',
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

      // Verify that the SnackBar is present
      expect(find.byKey(const Key('empty_cart_snackBar')), findsNothing);
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
  });
}
