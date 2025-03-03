// Import necessary packages and files
import 'package:cinnamon_rolls_shop/src/models/cinnamon.dart';
import 'package:flutter/material.dart';

// Import constants file for using predefined values
import '../constants.dart';

// Define a stateless widget for displaying an item card
class ItemCard extends StatelessWidget {
  // Constructor with required parameters
  const ItemCard({super.key, required this.cinnamon, required this.press});

  // Properties to store cinnamon information and a callback function
  final Cinnamon cinnamon;
  final VoidCallback press;

  // Build method to create the widget UI
  @override
  Widget build(BuildContext context) {
    // Get the size of the current screen
    final Size size = MediaQuery.of(context).size;

    // Return a GestureDetector to detect taps on the card
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Container for the cinnamon image
          Container(
            padding: const EdgeInsets.all(defaultPadding),
            key:const Key("item_card_container"),
            decoration: BoxDecoration(
              color: cinnamon.color,
              borderRadius: BorderRadius.circular(16),
            ),
            // Hero animation for smooth transition between screens
            child: Hero(
              tag: "${cinnamon.id}",
              child: Image.asset(
                cinnamon.image,
                package: 'assets',
                key:const Key("item_image"),
              ),
            ),
          ),
          // Padding and Text widget for displaying the cinnamon title
          Padding(
            padding: EdgeInsets.symmetric(vertical: size.width > 600 ? 20 : 5),
            child: Text(
              cinnamon.title,
              key:const Key("item_title"),
              style: TextStyle(
                  fontSize: size.width > 600 ? 30.0 : 14.0,
                  color: darkTextColor,
                  fontWeight: FontWeight.bold),
            ),
          ),
          // Text widget for displaying the cinnamon price
          Text(
            "${cinnamon.price.toStringAsFixed(2)} €",
            key:const Key("item_price"),
            style: TextStyle(
                color: darkTextColor, fontSize: size.width > 600 ? 25.0 : 14.0),
          )
        ],
      ),
    );
  }
}
