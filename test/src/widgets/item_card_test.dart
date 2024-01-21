import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cinnamon_rolls_shop/src/models/cinnamon.dart';
import 'package:cinnamon_rolls_shop/src/widgets/item_card.dart';

void main() {
  testWidgets('ItemCard displays cinnamon title and price correctly',
      (WidgetTester tester) async {
    // Create a Cinnamon object for testing
    final Cinnamon testCinnamon = Cinnamon(
        id: 1,
        title: "Classic Roll",
        price: 4.80,
        type: "Cinnamon Rolls",
        description:
            "Timeless: fluffy dough with cinnamon filling, topped with cream cheese frosting.",
        image: "assets/images/Classic-Roll-Vegan.png",
        color: const Color(0xFFD3A984));

    // Build our widget and trigger a frame
    await tester.pumpWidget(
      MaterialApp(
        home: ItemCard(
          cinnamon: testCinnamon,
          press: () {},
        ),
      ),
    );

    // Check that the Container exists
    var itemCardContainer = find.byKey(const Key('item_card_container'));
    expect(itemCardContainer, findsOneWidget);

    // Get the widget and check its background color
    final containerWidget = tester.widget<Container>(itemCardContainer);
    expect(containerWidget.decoration, isA<BoxDecoration>());
    expect((containerWidget.decoration as BoxDecoration).color,
        equals(testCinnamon.color));

    // Check that the item title widget exists
    var itemTitle = find.byKey(const Key('item_title'));
    expect(itemTitle, findsOneWidget);

    // Get the widget and check its text property
    final itemTitleWidget = tester.widget<Text>(itemTitle);
    expect(itemTitleWidget.data, "Classic Roll");

    // Check that the item price widget exists
    var itemPrice = find.byKey(const Key('item_price'));
    expect(itemPrice, findsOneWidget);

    // Get the widget and check its text property
    final itemPriceWidget = tester.widget<Text>(itemPrice);
    expect(itemPriceWidget.data, "4.80 €");

    // Verify that the image is displayed
    expect(find.byType(Image), findsOneWidget);
  });

  testWidgets('Image path is correct', (WidgetTester tester) async {
    final Cinnamon testCinnamon = Cinnamon(
        id: 1,
        title: "Classic Roll",
        price: 4.80,
        type: "Cinnamon Rolls",
        description:
            "Timeless: fluffy dough with cinnamon filling, topped with cream cheese frosting.",
        image: "assets/images/Classic-Roll-Vegan.png",
        color: const Color(0xFFD3A984));

    // Build our widget and trigger a frame
    await tester.pumpWidget(
      MaterialApp(
        home: ItemCard(
          cinnamon: testCinnamon,
          press: () {},
        ),
      ),
    );

    // Find the widget you want to test
    var itemImage = find.byKey(const Key('item_image'));

    expect(itemImage, findsOneWidget);

    final Image image = itemImage.evaluate().single.widget as Image;

    var imagePath = (image.image as AssetImage).assetName;

    // Check that the widget is an instance of the Image class
    expect(image, isInstanceOf<Image>());

    // Check that the widget.image is an instance of the AssetImage class
    expect(image.image, isInstanceOf<AssetImage>());

    expect(imagePath, "assets/images/Classic-Roll-Vegan.png");
  });
}
