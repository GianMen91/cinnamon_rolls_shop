import 'package:cinnamon_rolls_shop/src/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cinnamon_rolls_shop/src/widgets/build_icon_button.dart';

void main() {
  testWidgets('BuildIconButton displays all the components',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: BuildIconButton(
          onPressed: () {},
          icon: Icons.add,
        ),
      ),
    );

    // Expect an OutlinedButton to be displayed
    var buildIconButtonOutlinedButton =
        find.byKey(const Key('buildIconButtonOutlinedButton'));
    expect(buildIconButtonOutlinedButton, findsOneWidget);

    // Expect the Icon to have the correct color.
    final Icon iconWidget = tester.widget(find.byType(Icon));
    expect(iconWidget.color, equals(lightTextColor));
  });

  testWidgets('BuildIconButton invokes onPressed callback',
      (WidgetTester tester) async {
    bool onPressedCalled = false;

    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BuildIconButton(
            icon: Icons.add,
            onPressed: () {
              onPressedCalled = true;
            },
          ),
        ),
      ),
    );

    // Tap the BuildIconButton.
    await tester.tap(find.byType(BuildIconButton));

    // Expect that the onPressed callback was called.
    expect(onPressedCalled, isTrue);
  });
}
