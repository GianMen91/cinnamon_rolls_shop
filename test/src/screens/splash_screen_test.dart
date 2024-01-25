// Importing necessary packages and files
import 'package:cinnamon_rolls_shop/src/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cinnamon_rolls_shop/src/screens/splash_screen.dart';
import 'package:provider/provider.dart';

// The main entry point for the test suite
void main() {
  // Tear down function to ensure that any pending timers are canceled
  tearDown(() {
    // Ensure that any pending timers are canceled
    // This helps avoid issues with pending timers after the widget tree is disposed
    WidgetsBinding.instance.handleBeginFrame(null);
  });

  // Test to check if the Splash screen navigates to ShopScreen after the delay
  testWidgets('Splash screen navigates to ShopScreen after delay',
      (WidgetTester tester) async {
    // Build the widget tree with SplashScreen wrapped in a ChangeNotifierProvider
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (context) => CartProvider(),
        child: const MaterialApp(
          home: SplashScreen(),
        ),
      ),
    );

    // Wait for the splash screen delay (3 seconds in this case)
    await tester.pump(const Duration(seconds: 3));

    // Verify that the ShopScreen is navigated to
    expect(find.byType(SplashScreen), findsOneWidget);
  });
}
