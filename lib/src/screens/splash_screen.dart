// Import necessary packages and files
import 'dart:async';
import 'package:cinnamon_rolls_shop/src/constants.dart';
import 'package:flutter/material.dart';
import 'shop_screen.dart';

// Define a stateless widget for the splash screen
class SplashScreen extends StatelessWidget {
  // Constructor
  const SplashScreen({
    Key? key,
  }) : super(key: key);

  // Build method to create the widget UI
  @override
  Widget build(BuildContext context) {
    // Return a Builder widget to access the context for navigation
    return Builder(
      builder: (BuildContext context) {
        // Use Future.delayed to navigate to ShopScreen after a delay
        Future.delayed(
          const Duration(seconds: 3),
          () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const ShopScreen()),
          ),
        );

        // Return the scaffold for the splash screen
        return Scaffold(
          backgroundColor: backgroundColor,
          body: Column(
            children: <Widget>[
              // Expanded section containing the Cinnamood logo
              Expanded(
                child: Center(
                  child: Image.asset(
                    "assets/logo/Cinnamood-Logo.png",
                    fit: BoxFit.contain,
                    width:
                        MediaQuery.of(context).size.width > 600 ? 600.0 : 300.0,
                  ),
                ),
              ),
              // Align section for displaying developer information
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 50),
                  child: Text(
                    "Developed by Giancarlo Mennillo",
                    key: const Key('developer_info'),
                    style: TextStyle(
                      color: darkTextColor,
                      fontSize:
                          MediaQuery.of(context).size.width > 600 ? 25.0 : 14.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
