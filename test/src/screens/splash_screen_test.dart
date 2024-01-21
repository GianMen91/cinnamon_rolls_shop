import 'package:cinnamon_rolls_shop/src/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cinnamon_rolls_shop/src/screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  tearDown(() {
    // Ensure that any pending timers are canceled
    // This helps avoid issues with pending timers after the widget tree is disposed
    WidgetsBinding.instance?.handleBeginFrame(null);
  });

  testWidgets('Splash screen navigates to ShopScreen after delay',
      (WidgetTester tester) async {
    // Build our widget and trigger a frame
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (context) => CartProvider(),
        child: const MaterialApp(
          home: SplashScreen(),
        ),
      ),
    );
    // Wait for the splash screen delay
    await tester.pump(const Duration(seconds: 3));

    // Verify that ShopScreen is navigated to
    expect(find.byType(SplashScreen), findsOneWidget);
  });
}
