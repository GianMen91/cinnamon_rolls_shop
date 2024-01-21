import 'package:cinnamon_rolls_shop/src/screens/splash_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:cinnamon_rolls_shop/main.dart';
import 'package:cinnamon_rolls_shop/src/cart_provider.dart';

void main() {
  testWidgets('Main app widget test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (context) => CartProvider(),
        child: const MyApp(),
      ),
    );

    await tester.pump(const Duration(seconds: 3));

    // Verify that the SplashScreen is present.
    expect(find.byType(SplashScreen), findsOneWidget);
  });
}
