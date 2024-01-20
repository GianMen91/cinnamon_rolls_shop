import 'package:flutter/material.dart';

import 'buildCounterButton.dart';
import 'constants.dart';

class CartCounter extends StatefulWidget {
  const CartCounter(
      {Key? key, required this.onValueChanged, required this.initialQuantity})
      : super(key: key);

  final Function(int) onValueChanged;
  final int initialQuantity;

  @override
  _CartCounterState createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  late int numOfItems;

  @override
  void initState() {
    super.initState();
    numOfItems = widget.initialQuantity;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Row(
      children: <Widget>[
        BuildCounterButton(
            onPressed: () {
              if (numOfItems > 1) {
                setState(() {
                  numOfItems--;
                  widget.onValueChanged(numOfItems);
                });
              }
            },
            icon: Icons.remove),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
          child: Text(
            numOfItems.toString().padLeft(2, "0"),
            style: TextStyle(
              color: darkTextColor,
              fontSize: size.width > 600 ? 25.0 : 14.0,
            ),
          ),
        ),
        BuildCounterButton(
            onPressed: () {
              setState(() {
                numOfItems++;
                widget.onValueChanged(numOfItems);
              });
            },
            icon: Icons.add),
      ],
    );
  }
}
