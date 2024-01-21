// Import necessary packages and files
import 'package:flutter/material.dart';

// Import custom IconButton widget
import 'build_icon_button.dart';

// Import constants file for using predefined values
import 'constants.dart';

// Define a StatefulWidget for a cart item counter
class CartCounter extends StatefulWidget {
  // Constructor with required parameters
  const CartCounter({
    Key? key,
    required this.onValueChanged,
    required this.initialQuantity,
  }) : super(key: key);

  // Callback function to notify parent when the quantity changes
  final Function(int) onValueChanged;

  // Initial quantity for the counter
  final int initialQuantity;

  // Create the mutable state for the widget
  @override
  _CartCounterState createState() => _CartCounterState();
}

// Private state class for the CartCounter widget
class _CartCounterState extends State<CartCounter> {
  // Variable to store the current number of items
  late int numOfItems;

  // Initialize state when the widget is created
  @override
  void initState() {
    super.initState();
    numOfItems = widget.initialQuantity; // Set the initial quantity
  }

  // Build method to create the widget UI
  @override
  Widget build(BuildContext context) {
    // Get the size of the current screen
    final Size size = MediaQuery.of(context).size;

    // Return a Row widget containing two BuildIconButtons and a Text widget
    return Row(
      children: <Widget>[
        // Decrease quantity button
        BuildIconButton(
          onPressed: () {
            // Decrease quantity if it's greater than 1
            if (numOfItems > 1) {
              setState(() {
                numOfItems--;
                widget.onValueChanged(
                    numOfItems); // Notify parent about the change
              });
            }
          },
          icon: Icons.remove,
        ),
        // Display the current quantity
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
          child: Text(
            numOfItems.toString().padLeft(2, "0"), // Display with leading zeros
            style: TextStyle(
              color: darkTextColor,
              fontSize: size.width > 600
                  ? 25.0
                  : 14.0, // Adjust font size based on screen size
            ),
          ),
        ),
        // Increase quantity button
        BuildIconButton(
          onPressed: () {
            // Increase quantity
            setState(() {
              numOfItems++;
              widget
                  .onValueChanged(numOfItems); // Notify parent about the change
            });
          },
          icon: Icons.add,
        ),
      ],
    );
  }
}
