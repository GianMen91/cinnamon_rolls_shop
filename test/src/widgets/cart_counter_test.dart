import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cinnamon_rolls_shop/src/widgets/cart_counter.dart';

void main() {
  testWidgets('CartCounter initializes with the correct quantity',
      (WidgetTester tester) async {
    // Build our widget and trigger a frame
    await tester.pumpWidget(
      MaterialApp(
        home: CartCounter(
          onValueChanged: (value) {},
          initialQuantity: 1,
        ),
      ),
    );

    var quantityDisplayText = find.byKey(const Key('quantity_display'));
    expect(quantityDisplayText, findsOneWidget);

    var quantityDisplayTextWidget = tester.widget<Text>(quantityDisplayText);
    expect(quantityDisplayTextWidget.data, "01");

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    quantityDisplayTextWidget = tester.widget<Text>(quantityDisplayText);
    expect(quantityDisplayTextWidget.data, "02");

    await tester.tap(find.byIcon(Icons.remove));
    await tester.pump(); // Ensure the widget tree is fully rebuilt

    quantityDisplayTextWidget = tester.widget<Text>(quantityDisplayText);
    expect(quantityDisplayTextWidget.data, "01");
  });

  testWidgets('CartCounter does not decrement below 1',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: CartCounter(
          onValueChanged: (value) {},
          initialQuantity: 1,
        ),
      ),
    );

    var quantityDisplayText = find.byKey(const Key('quantity_display'));
    expect(quantityDisplayText, findsOneWidget);

    var quantityDisplayTextWidget = tester.widget<Text>(quantityDisplayText);
    expect(quantityDisplayTextWidget.data, "01");

    await tester.tap(find.byIcon(Icons.remove));
    await tester.pump();

    quantityDisplayTextWidget = tester.widget<Text>(quantityDisplayText);
    expect(quantityDisplayTextWidget.data, "01");
  });
}
