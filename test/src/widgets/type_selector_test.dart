import 'package:cinnamon_rolls_shop/src/constants.dart';
import 'package:cinnamon_rolls_shop/src/widgets/type_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('TypeSelector initializes with the first type selected', (WidgetTester tester) async {
    // Build our widget and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: TypeSelector(
            onChanged: (String selectedType) {},
          ),
        ),
      ),
    );

    // Expect the first type to be selected by default
    expect(find.text('All'), findsOneWidget);
    expect(find.text('Cinnamon Rolls'), findsOneWidget);
    expect(find.text('Fruity Rolls'), findsOneWidget);
    expect(find.text('Next Level Rolls'), findsOneWidget);
  });

  testWidgets('TypeSelector changes selected index on tap with color changes', (WidgetTester tester) async {
    // Build our widget and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: TypeSelector(
            onChanged: (String selectedType) {},
          ),
        ),
      ),
    );

    // Tap on 'Cinnamon Rolls'
    await tester.tap(find.text('Cinnamon Rolls'));

    // Expect text color change for the selected item
    var selectedText = tester.widget<Text>(find.text('Cinnamon Rolls'));
    expect(selectedText.style!.color, darkTextColor);

    await tester.pump();

    // Expect the selected index to be updated
    expect(find.text('All'), findsOneWidget);
    expect(find.text('Cinnamon Rolls'), findsOneWidget);
    expect(find.text('Fruity Rolls'), findsOneWidget);
    expect(find.text('Next Level Rolls'), findsOneWidget);

    // Expect text color change for the selected item
    selectedText = tester.widget<Text>(find.text('Cinnamon Rolls'));
    expect(selectedText.style!.color, Colors.white);
  });

}
