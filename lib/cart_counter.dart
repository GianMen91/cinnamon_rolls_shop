import 'package:flutter/material.dart';

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
        SizedBox(
          width: size.width > 600 ? 80 : 40,
          height: size.width > 600 ? 62 : 32,
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13),
              ),
            ),
            onPressed: () {
              setState(() {
                if (numOfItems > 1) {
                  setState(() {
                    numOfItems--;
                    widget.onValueChanged(numOfItems);
                  });
                }
              });
            },
            child: const Icon(Icons.remove, color: lightTextColor),
          ),
        ),
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
        SizedBox(
          width: size.width > 600 ? 80 : 40,
          height: size.width > 600 ? 62 : 32,
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13),
              ),
            ),
            onPressed: () {
              setState(() {
                numOfItems++;
                widget.onValueChanged(numOfItems);
              });
            },
            child: const Icon(Icons.add, color: lightTextColor),
          ),
        ),
      ],
    );
  }
}
