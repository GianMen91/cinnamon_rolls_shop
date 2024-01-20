import 'dart:async';
import 'package:cinnamon_rolls_shop/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_provider.dart';
import 'shop_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Builder(
        builder: (BuildContext context) {
          Future.delayed(
            const Duration(seconds: 3),
            () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const ShopScreen()),
            ),
          );
          return Scaffold(
            backgroundColor: backgroundColor,
            body: Column(
              children: <Widget>[
                Expanded(
                  child: Center(
                    child: Image.asset("assets/logo/Cinnamood-Logo.png",
                        fit: BoxFit.contain, width: MediaQuery.of(context).size.width > 600 ? 600.0 : 300.0),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 50),
                    child: Text("Developed by Giancarlo Mennillo",
                        style: TextStyle(color: darkTextColor,fontSize: MediaQuery.of(context).size.width > 600 ? 25.0 : 14.0)),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
