// Importing necessary packages and files
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cinnamon_rolls_shop/src/models/cinnamon.dart';
import 'package:cinnamon_rolls_shop/src/widgets/item_card.dart';

// The main entry point for the test suite
void main() {
  // Test to check if ItemCard displays cinnamon title, price, and image correctly
  testWidgets('ItemCard displays cinnamon title, price, and image correctly',
      (WidgetTester tester) async {
    // Creating a sample Cinnamon object
    final Cinnamon testCinnamon = Cinnamon(
        id: 1,
        title: "Classic Roll",
        price: 4.80,
        type: "Cinnamon Rolls",
        description:
            "Timeless: fluffy dough with cinnamon filling, topped with cream cheese frosting.",
        image: "images/Classic-Roll-Vegan.png",
        color: const Color(0xFFD3A984));

    // Building the widget tree with MaterialApp and ItemCard
    await tester.pumpWidget(
      MaterialApp(
        home: ItemCard(
          cinnamon: testCinnamon,
          press: () {},
        ),
      ),
    );

    // Finding the item card container and verifying its presence
    var itemCardContainer = find.byKey(const Key('item_card_container'));
    expect(itemCardContainer, findsOneWidget);

    // Extracting container properties and verifying the color
    final containerWidget = tester.widget<Container>(itemCardContainer);
    expect(containerWidget.decoration, isA<BoxDecoration>());
    expect((containerWidget.decoration as BoxDecoration).color,
        equals(testCinnamon.color));

    // Finding the item title text and verifying its presence and data
    var itemTitle = find.byKey(const Key('item_title'));
    expect(itemTitle, findsOneWidget);

    final itemTitleWidget = tester.widget<Text>(itemTitle);
    expect(itemTitleWidget.data, "Classic Roll");

    // Finding the item price text and verifying its presence and data
    var itemPrice = find.byKey(const Key('item_price'));
    expect(itemPrice, findsOneWidget);

    final itemPriceWidget = tester.widget<Text>(itemPrice);
    expect(itemPriceWidget.data, "4.80 €");

    // Verifying the presence of the Image widget
    expect(find.byType(Image), findsOneWidget);
  });
}
