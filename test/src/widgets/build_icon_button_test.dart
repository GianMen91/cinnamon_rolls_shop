import 'package:cinnamon_rolls_shop/src/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cinnamon_rolls_shop/src/widgets/build_icon_button.dart';

void main() {
  testWidgets('BuildIconButton displays icon with correct size',
          (WidgetTester tester) async {
        // Build our app and trigger a frame.
        await tester.pumpWidget(
          MaterialApp(
            home: BuildIconButton(
                onPressed: () { },
                icon: Icons.add,
              ),
            ),
     
        );

        // Expect an OutlinedButton with a child Icon.
        expect(find.byType(OutlinedButton), findsOneWidget);
        expect(find.byType(Icon), findsOneWidget);

        // Expect the Icon to have the correct color.
        final Icon iconWidget = tester.widget(find.byType(Icon));
        expect(iconWidget.color, equals(lightTextColor));

        // Expect the OutlinedButton to have a specific width and height.
        final OutlinedButton buttonWidget = tester.widget(find.byType(OutlinedButton));
        expect(buttonWidget.style?.minimumSize, equals(Size(80, 62)));
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
