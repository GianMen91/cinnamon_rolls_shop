// Import necessary packages and files
import 'package:cinnamon_rolls_shop/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_provider.dart';

// Main function to run the application
void main() {
  // Run the app with the CartProvider using ChangeNotifierProvider
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: const MyApp(),
    ),
  );
}

// StatelessWidget for the main application
class MyApp extends StatelessWidget {
  // Constructor
  const MyApp({Key? key}) : super(key: key);

  // Build method to create the widget UI
  @override
  Widget build(BuildContext context) {
    // Return MaterialApp widget as the root of the application
    return MaterialApp(
      // Disable the debug banner in the top-right corner
      debugShowCheckedModeBanner: false,
      // Set the theme data for the entire application
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // Set the home screen to the SplashScreen widget
      home: const SplashScreen(),
    );
  }
}
