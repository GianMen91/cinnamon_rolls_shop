// Importing necessary packages and files
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cinnamon_rolls_shop/src/widgets/search_box.dart';

// The main entry point for the test suite
void main() {
  // Test to check if the SearchBox widget renders correctly
  testWidgets('SearchBox widget renders correctly',
      (WidgetTester tester) async {
    // Building the widget tree with MaterialApp, Scaffold, and SearchBox
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SearchBox(
            onChanged: (value) {},
          ),
        ),
      ),
    );

    // Verifying the presence of the search box container
    expect(find.byKey(const Key('search_box_container')), findsOneWidget);

    // Verifying the presence of the search text field
    expect(find.byKey(const Key('search_text_field')), findsOneWidget);

    // Verifying the presence of the search icon
    expect(find.byKey(const Key('search_icon')), findsOneWidget);
  });

  // Test to check if SearchBox invokes the callback on text change
  testWidgets('SearchBox invokes callback on text change',
      (WidgetTester tester) async {
    // Variable to store the changed text
    late String changedText;

    // Building the widget tree with MaterialApp, Scaffold, and SearchBox
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

    // Entering text into the search text field
    await tester.enterText(find.byType(TextField), 'Test Cinnamon');

    // Verifying that the onChanged callback is called with the correct text
    expect(changedText, 'Test Cinnamon');
  });
}
