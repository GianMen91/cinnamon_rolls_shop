import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cinnamon_rolls_shop/src/widgets/search_box.dart';

void main() {
  testWidgets('SearchBox renders correctly', (WidgetTester tester) async {
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

    // Verify that the widget renders correctly
    expect(find.text('Search by cinnamon name'), findsOneWidget);
    expect(find.byIcon(Icons.search), findsOneWidget);
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
