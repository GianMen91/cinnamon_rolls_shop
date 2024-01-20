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
    final Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(defaultPadding),
            decoration: BoxDecoration(
              color: cinnamon.color,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Hero(
              tag: "${cinnamon.id}",
              child: Image.asset(
                cinnamon.image,
                width: size.width > 600 ? 300 : 120,
                height: size.width > 600 ? 300 : 120,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: size.width > 600 ? 20 : 5),
            child: Text(
              cinnamon.title,
              style: TextStyle(
                  fontSize: size.width > 600 ? 30.0 : 14.0,
                  color: darkTextColor,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            "${cinnamon.price.toStringAsFixed(2)} €",
            style: TextStyle(
                color: darkTextColor, fontSize: size.width > 600 ? 25.0 : 14.0),
          )
        ],
      ),
    );
  }
}
