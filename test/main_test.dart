// Importing necessary packages and files
import 'package:cinnamon_rolls_shop/src/screens/splash_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:cinnamon_rolls_shop/main.dart';
import 'package:cinnamon_rolls_shop/src/cart_provider.dart';

// The main entry point for the test suite
void main() {
  // Widget test for the main app
  testWidgets('Main app widget test', (WidgetTester tester) async {
    // Building the widget tree with ChangeNotifierProvider and MyApp
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (context) => CartProvider(),
        child: const MyApp(),
      ),
    );

    // Waiting for the splash screen delay
    await tester.pump(const Duration(seconds: 3));

    // Verifying that the SplashScreen is present in the widget tree
    expect(find.byType(SplashScreen), findsOneWidget);
  });
}
