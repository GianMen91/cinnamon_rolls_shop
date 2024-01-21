import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cinnamon_rolls_shop/src/widgets/search_box.dart';

void main() {
  testWidgets('SearchBox widget renders correctly',
      (WidgetTester tester) async {
    // Build our widget and trigger a frame
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SearchBox(
            onChanged: (value) {},
          ),
        ),
      ),
    );

    // Verify that the container exists
    expect(find.byKey(const Key('search_box_container')), findsOneWidget);

    // Verify that the TextField exists
    expect(find.byKey(const Key('search_text_field')), findsOneWidget);

    // Verify that the search icon exists
    expect(find.byKey(const Key('search_icon')), findsOneWidget);
  });

  testWidgets('SearchBox invokes callback on text change',
      (WidgetTester tester) async {
    // Variable to store the changed text
    late String changedText;

    // Build our widget and trigger a frame
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SearchBox(
            onChanged: (value) {
              changedText = value;
            },
          ),
        ),
      ),
    );

    // Enter text into the search box
    await tester.enterText(find.byType(TextField), 'Test Cinnamon');

    // Verify that the callback is invoked with the correct text
    expect(changedText, 'Test Cinnamon');
  });
}
