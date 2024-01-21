import 'package:cinnamon_rolls_shop/src/cart_provider.dart';
import 'package:cinnamon_rolls_shop/src/constants.dart';
import 'package:cinnamon_rolls_shop/src/models/cinnamon.dart';
import 'package:cinnamon_rolls_shop/src/screens/item_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
  group('ItemScreen', () {
    final Cinnamon testCinnamon = Cinnamon(
        id: 1,
        title: "Classic Roll",
        price: 4.80,
        type: "Cinnamon Rolls",
        description:
            "Timeless: fluffy dough with cinnamon filling, topped with cream cheese frosting.",
        image: "assets/images/Classic-Roll-Vegan.png",
        color: const Color(0xFFD3A984));

    testWidgets('Renders ItemScreen correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
          child: MaterialApp(
            home: ItemScreen(cinnamon: testCinnamon),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(ItemScreen), findsOneWidget);

      // Check that the AppBar exists
      var appBar = find.byKey(const Key('app_bar'));
      expect(appBar, findsOneWidget);

      // Get the widget and check its background color
      final appBarWidget = tester.widget<AppBar>(appBar);
      expect(appBarWidget.backgroundColor, const Color(0xFFD3A984));

      var arrow_back_icon = find.byKey(const Key('arrow_back_icon'));
      expect(arrow_back_icon, findsOneWidget);

      // Check that the item title widget exists
      var itemTitle = find.byKey(const Key('item_title'));
      expect(itemTitle, findsOneWidget);

      // Get the widget and check its text property
      final itemTitleWidget = tester.widget<Text>(itemTitle);
      expect(itemTitleWidget.data, "Classic Roll");

      // Check that the item type widget exists
      var itemType = find.byKey(const Key('item_type'));
      expect(itemType, findsOneWidget);

      // Get the widget and check its text property
      final itemTypeWidget = tester.widget<Text>(itemType);
      expect(itemTypeWidget.data, "Cinnamon Rolls");

      // Check that the item description widget exists
      var itemDescription = find.byKey(const Key('item_description'));
      expect(itemDescription, findsOneWidget);

      // Get the widget and check its text property
      final itemDescriptionWidget = tester.widget<Text>(itemDescription);
      expect(itemDescriptionWidget.data,
          "Timeless: fluffy dough with cinnamon filling, topped with cream cheese frosting.");

      // Check that the item price widget exists
      var priceRow = find.byKey(const Key('price_row'));
      expect(priceRow, findsOneWidget);

      // Get the widget and check its text property
      final priceRowWidget = tester.widget<Text>(priceRow);
      expect(priceRowWidget.data, "Price\n4.80 €");

      // Find the ElevatedButton widget
      var addToOrderButton = find.byKey(const Key('add_to_order_button'));
      expect(addToOrderButton, findsOneWidget);

      // Get the ElevatedButton widget
      final buttonWidget = tester.widget<ElevatedButton>(addToOrderButton);

      // Check the text content of the ElevatedButton
      expect(
          buttonWidget.child,
          isA<Text>().having(
            (text) => text.data,
            'text.data',
            "ADD TO ORDER",
          ));

      // Check the background color of the ElevatedButton
      expect(buttonWidget.style?.backgroundColor?.resolve({}), lightTextColor);
    });

    testWidgets('Add to order button triggers SnackBar',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
          child: MaterialApp(
            home: ItemScreen(cinnamon: testCinnamon),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Verify that the SnackBar is present
      var addToOrderButton = find.byKey(const Key('add_to_order_button'));
      expect(addToOrderButton, findsOneWidget);

      // Tap the add to order button
      await tester.tap(addToOrderButton);
      await tester.pump();

      // Verify that the SnackBar is present
      expect(find.byKey(const Key('add_to_cart_snack_bar')), findsOneWidget);
    });

    testWidgets('Add to order button adds item to cart',
        (WidgetTester tester) async {
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

      // Verify that the SnackBar is present
      var addToOrderButton = find.byKey(const Key('add_to_order_button'));
      expect(addToOrderButton, findsOneWidget);

      // Tap the add to order button
      await tester.tap(addToOrderButton);
      await tester.pump();

      // Verify that the item is added to the cart
      expect(cartProvider.cartItems.length, 1);
      expect(cartProvider.cartItems[0].cinnamon, testCinnamon);
      expect(cartProvider.cartItems[0].quantity, 1);
    });

    testWidgets('SnackBar is not present if not triggered',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
          child: MaterialApp(
            home: ItemScreen(cinnamon: testCinnamon),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byKey(const Key('add_to_cart_snack_bar')), findsNothing);
    });
  });
}
