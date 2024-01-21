import 'package:badges/badges.dart';
import 'package:cinnamon_rolls_shop/src/cart_provider.dart';
import 'package:cinnamon_rolls_shop/src/constants.dart';
import 'package:cinnamon_rolls_shop/src/models/cinnamon.dart';
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

      final appBar = find.byKey(const Key('shop_app_bar'));
      // Verify that the app bar is displayed
      expect(appBar, findsOneWidget);

      // Get the widget and check its background color
      final appBarWidget = tester.widget<AppBar>(appBar);
      expect(appBarWidget.backgroundColor, menuBackgroundColor);

      expect(find.byKey(const Key('cinnamood_logo')), findsOneWidget);

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

    testWidgets('Tap on NOT empty cart bring to Cart screen',
        (WidgetTester tester) async {
      final cartProvider = CartProvider();

      // Create a sample cinnamon item
      final cinnamon = Cinnamon(
          id: 1,
          title: "Classic Roll",
          price: 4.80,
          type: "Cinnamon Rolls",
          description:
              "Timeless: fluffy dough with cinnamon filling, topped with cream cheese frosting.",
          image: "assets/images/Classic-Roll-Vegan.png",
          color: const Color(0xFFD3A984));

      // Add the cinnamon item to the cart with a quantity of 1
      cartProvider.addToCart(cinnamon, 1);

      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (context) => cartProvider,
          child: const MaterialApp(
            home: ShopScreen(),
          ),
        ),
      );

      await tester.pumpAndSettle();

      var emptyCartIcon = find.byKey(const Key('cart_not_empty'));
      expect(emptyCartIcon, findsOneWidget);

      // Tap the add to order button
      await tester.tap(emptyCartIcon);
      await tester.pump();

      await tester.pumpAndSettle(); // Wait for animations to complete

      expect(find.byType(CartScreen), findsOneWidget);
    });

    testWidgets('Tap on an item in the grid bring to the Item screen',
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

          var itemObject = find.byKey(const Key('grid_item_1'));
          expect(itemObject, findsOneWidget);

          // Tap the add to order button
          await tester.tap(itemObject);
          await tester.pump();

          await tester.pumpAndSettle(); // Wait for animations to complete

          expect(find.byType(ItemScreen), findsOneWidget);
        });

    testWidgets('Cart icon badge show right amount of quantity',
        (WidgetTester tester) async {
      final cartProvider = CartProvider();

      // Create a sample cinnamon item 1
      final cinnamon1 = Cinnamon(
        id: 1,
        title: "Classic Roll",
        price: 4.80,
        type: "Cinnamon Rolls",
        description:
            "Timeless: fluffy dough with cinnamon filling, topped with cream cheese frosting.",
        image: "assets/images/Classic-Roll-Vegan.png",
        color: const Color(0xFFD3A984),
      );

      // Add the cinnamon item to the cart with a quantity of 3
      cartProvider.addToCart(cinnamon1, 3);

      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (context) => cartProvider,
          child: const MaterialApp(
            home: ShopScreen(),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Find the CartBadge widget
      var cartBadge = find.byKey(const Key('cart_badge'));
      expect(cartBadge, findsOneWidget);

      // Extract the text from the Text widget
      var cartBadgeWidget = tester.widget<Badge>(cartBadge);
      var badgeContentText = (cartBadgeWidget.badgeContent as Text).data;

      // Assert that badgeContentText is equal to '1' (1 cinnamon in the cart)
      expect(badgeContentText, '1');

      // Create a sample cinnamon item 2
      final cinnamon2 = Cinnamon(
        id: 14,
        title: "Salted Caramel Roll",
        price: 5.50,
        type: "Next Level Rolls",
        description:
            "Fluffy dough with salted caramel filling made to our own recipe, topped with cream cheese frosting, garnished with salted caramel cream & caramel crisp pearls.",
        image: "assets/images/Salted-Caramell-Roll.png",
        color: const Color(0xFFC1834F),
      );

      // Add the cinnamon item to the cart with a quantity of 5
      cartProvider.addToCart(cinnamon2, 5);

      await tester.pumpAndSettle();

      // Extract the updated text from the Text widget
      cartBadgeWidget = tester.widget<Badge>(cartBadge);
      badgeContentText = (cartBadgeWidget.badgeContent as Text).data;

      // Assert that badgeContentText is equal to '2' (2 cinnamon in the cart)
      expect(badgeContentText, '2');
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
