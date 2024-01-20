import 'package:cinnamon_rolls_shop/cinnamon.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({Key? key, required this.cinnamon, required this.press})
      : super(key: key);

  final Cinnamon cinnamon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(defaultPadding),
              decoration: BoxDecoration(
                color: cinnamon.color,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Hero(
                tag: "${cinnamon.id}",
                child: Image.asset(cinnamon.image),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding / 4),
            child: Text(
              cinnamon.title,
              style: const TextStyle(
                  color: darkTextColor, fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            "${cinnamon.price.toStringAsFixed(2)} €",
            style: const TextStyle(color: darkTextColor),
          )
        ],
      ),
    );
  }
}
