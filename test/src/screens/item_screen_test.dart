// Importing necessary packages and files
import 'package:cinnamon_rolls_shop/src/cart_provider.dart';
import 'package:cinnamon_rolls_shop/src/constants.dart';
import 'package:cinnamon_rolls_shop/src/models/cinnamon.dart';
import 'package:cinnamon_rolls_shop/src/screens/item_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

// The main entry point for the test suite
void main() {
  // Grouping tests related to the 'ItemScreen' widget
  group('ItemScreen', () {
    // Creating a sample Cinnamon object for testing
    final Cinnamon testCinnamon = Cinnamon(
      id: 1,
      title: "Classic Roll",
      price: 4.80,
      type: "Cinnamon Rolls",
      description:
          "Timeless: fluffy dough with cinnamon filling, topped with cream cheese frosting.",
      image: "assets/images/Classic-Roll-Vegan.png",
      color: const Color(0xFFD3A984),
    );

    // Test to ensure ItemScreen renders correctly
    testWidgets('Renders ItemScreen correctly', (WidgetTester tester) async {
      // Pumping the widget tree with ItemScreen wrapped in a ChangeNotifierProvider
      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
          child: MaterialApp(
            home: ItemScreen(cinnamon: testCinnamon),
          ),
        ),
      );

      // Waiting for animations to complete
      await tester.pumpAndSettle();

      // Expecting the ItemScreen widget to be present
      expect(find.byType(ItemScreen), findsOneWidget);

      // Verifying the presence of various widgets on the screen
      var appBar = find.byKey(const Key('app_bar'));
      expect(appBar, findsOneWidget);

      // Verifying the background color of the AppBar
      final appBarWidget = tester.widget<AppBar>(appBar);
      expect(appBarWidget.backgroundColor, const Color(0xFFD3A984));

      var arrowBackIcon = find.byKey(const Key('arrow_back_icon'));
      expect(arrowBackIcon, findsOneWidget);

      // Verifying the presence and text of the item title
      var itemTitle = find.byKey(const Key('item_title'));
      expect(itemTitle, findsOneWidget);
      final itemTitleWidget = tester.widget<Text>(itemTitle);
      expect(itemTitleWidget.data, "Classic Roll");

      // Verifying the presence and text of the item type
      var itemType = find.byKey(const Key('item_type'));
      expect(itemType, findsOneWidget);
      final itemTypeWidget = tester.widget<Text>(itemType);
      expect(itemTypeWidget.data, "Cinnamon Rolls");

      // Verifying the presence and text of the item description
      var itemDescription = find.byKey(const Key('item_description'));
      expect(itemDescription, findsOneWidget);
      final itemDescriptionWidget = tester.widget<Text>(itemDescription);
      expect(
        itemDescriptionWidget.data,
        "Timeless: fluffy dough with cinnamon filling, topped with cream cheese frosting.",
      );

      // Verifying the presence and text of the price row
      var priceRow = find.byKey(const Key('price_row'));
      expect(priceRow, findsOneWidget);
      final priceRowWidget = tester.widget<Text>(priceRow);
      expect(priceRowWidget.data, "Price\n4.80 €");

      // Verifying the presence and properties of the 'ADD TO ORDER' button
      var addToOrderButton = find.byKey(const Key('add_to_order_button'));
      expect(addToOrderButton, findsOneWidget);
      final buttonWidget = tester.widget<ElevatedButton>(addToOrderButton);
      expect(
        buttonWidget.child,
        isA<Text>().having(
          (text) => text.data,
          'text.data',
          "ADD TO ORDER",
        ),
      );
      expect(buttonWidget.style?.backgroundColor?.resolve({}), lightTextColor);
    });

    // Test to check if SnackBar is not present when not triggered
    testWidgets('SnackBar is not present if not triggered',
        (WidgetTester tester) async {
      // Pumping the widget tree with ItemScreen wrapped in a ChangeNotifierProvider
      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
          child: MaterialApp(
            home: ItemScreen(cinnamon: testCinnamon),
          ),
        ),
      );

      // Waiting for animations to complete
      await tester.pumpAndSettle();

      // Expecting the 'add_to_cart_snack_bar' widget to be absent
      expect(find.byKey(const Key('add_to_cart_snack_bar')), findsNothing);
    });
  });
}
