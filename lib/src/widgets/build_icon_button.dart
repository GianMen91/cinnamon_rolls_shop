// Import necessary packages
import 'package:flutter/material.dart';

// Import constants file for using predefined values
import '../constants.dart';

// Define a stateless widget for a custom IconButton
class BuildIconButton extends StatelessWidget {
  const BuildIconButton({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  // Properties to store the icon and callback function
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    // Get the size of the current screen
    final Size size = MediaQuery.of(context).size;

    // Return a SizedBox with a specified width and height
    return SizedBox(
      key: Key('buildIconButtonSizedBox'), // Add key to SizedBox
      width: size.width > 600 ? 80 : 40,
      height: size.width > 600 ? 62 : 32,
      child: OutlinedButton(
        key: Key('buildIconButtonOutlinedButton'), // Add key to OutlinedButton
        // Styling for the OutlinedButton
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13), // Set border radius
          ),
        ),
        onPressed: onPressed, // Callback function when button is pressed
        child: Icon(icon,
            color:
                lightTextColor), // Display the specified icon with a predefined color
      ),
    );
  }
}
