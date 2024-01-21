import 'package:cinnamon_rolls_shop/src/screens/shop_screen.dart';
import 'package:cinnamon_rolls_shop/src/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Splash screen navigates to ShopScreen after delay',
          (WidgetTester tester) async {
        // Build our app and trigger a frame.
        await tester.pumpWidget(
          MaterialApp(
            home: const SplashScreen(),
          ),
        );

        // Expect the splash screen logo to be displayed.
        expect(find.byType(Image), findsOneWidget);

        // Wait for the navigation to complete after the delay.
        await tester.pumpAndSettle(const Duration(seconds: 3));

        // Expect that ShopScreen is now the active screen.
        expect(find.byType(ShopScreen), findsOneWidget);
      });

  testWidgets('Splash screen displays developer information',
          (WidgetTester tester) async {
        // Build our app and trigger a frame.
        await tester.pumpWidget(
          MaterialApp(
            home: const SplashScreen(),
          ),
        );

        // Wait for the navigation to complete after the delay.
        await tester.pumpAndSettle(const Duration(seconds: 3));

        // Expect developer information to be displayed.
        expect(
          find.text("Developed by Giancarlo Mennillo"),
          findsOneWidget,
        );
      });

  testWidgets('Splash screen does not show developer information initially',
          (WidgetTester tester) async {
        // Build our app and trigger a frame.
        await tester.pumpWidget(
          MaterialApp(
            home: const SplashScreen(),
          ),
        );

        // Expect developer information not to be displayed initially.
        expect(
          find.text("Developed by Giancarlo Mennillo"),
          findsNothing,
        );
      });
}
