// Importing necessary packages and files
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

// The main entry point for the test suite
void main() {
  // Grouping tests related to the 'ShopScreen' widget
  group('ShopScreen', () {
    // Test to ensure ShopScreen renders correctly
    testWidgets('Renders ShopScreen correctly', (WidgetTester tester) async {
      // Pumping the widget tree with ShopScreen wrapped in a ChangeNotifierProvider
      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
          child: const MaterialApp(
            home: ShopScreen(),
          ),
        ),
      );

      // Waiting for animations to complete
      await tester.pumpAndSettle();

      // Expecting the ShopScreen widget to be present
      expect(find.byType(ShopScreen), findsOneWidget);

      // Verify that the app bar is displayed and has the right background color
      final appBar = find.byKey(const Key('shop_app_bar'));
      expect(appBar, findsOneWidget);

      final appBarWidget = tester.widget<AppBar>(appBar);
      expect(appBarWidget.backgroundColor, menuBackgroundColor);

      // Verify that the Cinnamood logo is displayed
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

    // Test to check if tapping on an empty cart icon triggers a SnackBar
    testWidgets('Tap on empty cart triggers SnackBar',
        (WidgetTester tester) async {
      // Pumping the widget tree with ShopScreen wrapped in a ChangeNotifierProvider
      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
          child: const MaterialApp(
            home: ShopScreen(),
          ),
        ),
      );

      // Waiting for animations to complete
      await tester.pumpAndSettle();

      // Finding the empty cart icon and tapping on it
      var emptyCartIcon = find.byKey(const Key('empty_cart_icon'));
      expect(emptyCartIcon, findsOneWidget);

      await tester.tap(emptyCartIcon);
      await tester.pump();

      // Expecting the 'empty_cart_snackBar' widget to be present
      expect(find.byKey(const Key('empty_cart_snackBar')), findsOneWidget);
    });

    // Test to check if tapping on a non-empty cart icon navigates to the Cart screen
    testWidgets('Tap on NOT empty cart brings to Cart screen',
        (WidgetTester tester) async {
      // Creating a CartProvider and adding an item to the cart
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
        color: const Color(0xFFD3A984),
      );

      // Add the cinnamon item to the cart with a quantity of 1
      cartProvider.addToCart(cinnamon, 1);

      // Pumping the widget tree with ShopScreen wrapped in a ChangeNotifierProvider
      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (context) => cartProvider,
          child: const MaterialApp(
            home: ShopScreen(),
          ),
        ),
      );

      // Waiting for animations to complete
      await tester.pumpAndSettle();

      // Finding the non-empty cart icon and tapping on it
      var nonEmptyCartIcon = find.byKey(const Key('cart_not_empty'));
      expect(nonEmptyCartIcon, findsOneWidget);

      await tester.tap(nonEmptyCartIcon);
      await tester.pumpAndSettle();

      // Expecting the CartScreen widget to be present
      expect(find.byType(CartScreen), findsOneWidget);
    });

    // Test to check if tapping on an item in the grid navigates to the Item screen
    testWidgets('Tap on an item in the grid brings to the Item screen',
        (WidgetTester tester) async {
      // Pumping the widget tree with ShopScreen wrapped in a ChangeNotifierProvider
      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
          child: const MaterialApp(
            home: ShopScreen(),
          ),
        ),
      );

      // Waiting for animations to complete
      await tester.pumpAndSettle();

      // Finding an item in the grid and tapping on it
      var itemObject = find.byKey(const Key('grid_item_1'));
      expect(itemObject, findsOneWidget);

      await tester.tap(itemObject);
      await tester.pumpAndSettle();

      // Expecting the ItemScreen widget to be present
      expect(find.byType(ItemScreen), findsOneWidget);
    });

    // Test to check if the Cart icon badge shows the correct quantity
    testWidgets('Cart icon badge shows right amount of quantity',
        (WidgetTester tester) async {
      // Creating a CartProvider and adding two items to the cart
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

    // Test to check if the SnackBar is not visible by default
    testWidgets('SnackBar is not visible by default',
        (WidgetTester tester) async {
      // Pumping the widget tree with ShopScreen wrapped in a ChangeNotifierProvider
      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
          child: const MaterialApp(
            home: ShopScreen(),
          ),
        ),
      );

      // Waiting for animations to complete
      await tester.pumpAndSettle();

      // Expecting the 'empty_cart_snackBar' widget to be absent
      expect(find.byKey(const Key('empty_cart_snackBar')), findsNothing);
    });

    // Test to check if searching for cinnamon items works
    testWidgets('Search for cinnamon items', (WidgetTester tester) async {
      // Pumping the widget tree with ShopScreen wrapped in a ChangeNotifierProvider
      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
          child: const MaterialApp(
            home: ShopScreen(),
          ),
        ),
      );

      // Waiting for animations to complete
      await tester.pumpAndSettle();

      // Entering text into the search box
      await tester.enterText(find.byType(TextField), 'Test Cinnamon');
      await tester.pump();

      // Expecting the searched item to be present
      expect(find.text('Test Cinnamon'), findsOneWidget);
    });

    // Test to check if filtering by cinnamon types works
    testWidgets('Filter by cinnamon types', (WidgetTester tester) async {
      // Pumping the widget tree with ShopScreen wrapped in a ChangeNotifierProvider
      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
          child: const MaterialApp(
            home: ShopScreen(),
          ),
        ),
      );

      // Waiting for animations to complete
      await tester.pumpAndSettle();

      // Tapping on the 'Fruity Rolls' button to filter by cinnamon type
      await tester.tap(find.text('Fruity Rolls'));
      await tester.pump();

      // Expecting the filtered type 'Fruity Rolls' to be present
      expect(find.text('Fruity Rolls'), findsOneWidget);
    });
  });
}
