// Import necessary packages and files
import 'package:flutter/material.dart';

// Import constants file for using predefined values
import '../constants.dart';

class TypeSelector extends StatefulWidget {
  const TypeSelector({
    super.key,
    required this.onChanged,
  });

  final ValueChanged<String> onChanged;

  @override
  TypeSelectorState createState() => TypeSelectorState();
}

class TypeSelectorState extends State<TypeSelector> {

  int selectedIndex = 0;
  // Build method to create the widget UI
  @override
  Widget build(BuildContext context) {
    // Get the size of the current screen
    final Size size = MediaQuery.of(context).size;


    // List of cinnamon types
    List types = ['All', 'Cinnamon Rolls', 'Fruity Rolls', 'Next Level Rolls'];

    // Return a container with a styled text field for searching
    return Container(
      margin: const EdgeInsets.symmetric(vertical: defaultPadding / 2),
      height: size.width > 600 ? 50 : 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: types.length, // Use widget.types here
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
            widget.onChanged(types[selectedIndex]);
          },
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(
              left: defaultPadding,
              right: index == types.length - 1 ? defaultPadding : 0,
            ),
            padding:
            const EdgeInsets.symmetric(horizontal: defaultPadding),
            decoration: BoxDecoration(
              color: index == selectedIndex
                  ? lightTextColor
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(types[index],
                style: index == selectedIndex
                    ? TextStyle(
                    color: Colors.white,
                    fontSize: size.width > 600 ? 20.0 : 14.0)
                    : TextStyle(
                    color: darkTextColor,
                    fontSize: size.width > 600 ? 20.0 : 14.0)),
          ),
        ),
      ),
    );
  }
}
