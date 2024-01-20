import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart_provider.dart';
import 'constants.dart';
import 'cart_counter.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final Size size = MediaQuery.of(context).size;

    double totalPrice = 0;

    for (var cartItem in cartProvider.cartItems) {
      totalPrice += cartItem.cinnamon.price * cartItem.quantity;
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded,
              color: lightTextColor, size: size.width > 600 ? 38 : 25),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            child: ListView.builder(
              itemCount: cartProvider.cartItems.length,
              itemBuilder: (context, index) {
                var item = cartProvider.cartItems[index];

                return Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Row(
                    children: [
                      Container(
                        width: size.width > 600 ? 120.0 : 80.0,
                        padding: const EdgeInsets.all(defaultPadding),
                        decoration: BoxDecoration(
                          color: item.cinnamon.color,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Image.asset(item.cinnamon.image),
                      ),
                      const SizedBox(width: defaultPadding),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Name of the item
                            Text(
                              item.cinnamon.title,
                              style: TextStyle(
                                fontSize: size.width > 600 ? 30.0 : 16.0,
                                fontWeight: FontWeight.bold,
                                color: darkTextColor,
                              ),
                            ),
                            const SizedBox(height: defaultPadding / 2),
                            // Cart Counter widget
                            CartCounter(
                              initialQuantity: item.quantity,
                              onValueChanged: (value) {
                                final cartProvider = Provider.of<CartProvider>(
                                    context,
                                    listen: false);
                                cartProvider.updateQuantity(
                                    item.cinnamon, value);
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: defaultPadding),
                      // Price of the item
                      Column(
                        children: [
                          Text(
                            "${item.cinnamon.price.toStringAsFixed(2)} €",
                            style: TextStyle(
                              fontSize: size.width > 600 ? 30.0 : 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: defaultPadding / 2),
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
                                cartProvider.removeItem(item.cinnamon);
                              },
                              child: const Icon(Icons.delete,
                                  color: lightTextColor),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(18.0),
            child: Divider(
              height: 1,
              thickness: 1,
              color: Colors.grey,
            ),
          ),
          // Total text and price
          Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: TextStyle(
                    fontSize: size.width > 600 ? 35.0 : 18.0,
                    fontWeight: FontWeight.bold,
                    color: darkTextColor,
                  ),
                ),
                Text(
                  "${totalPrice.toStringAsFixed(2)} €",
                  style: TextStyle(
                    fontSize: size.width > 600 ? 40.0 : 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(
              left: defaultPadding,
              right: defaultPadding,
              bottom: 50,
            ),
            child: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                        "Apologies! This is a demo app, and purchasing functionality is not available. However, feel free to explore the nearest Cinnamon shop in your area for the delightful experience of buying and enjoying a delicious cinnamon roll!"),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize:
                    Size(double.infinity, size.width > 600 ? 68.0 : 48.0),
                primary: lightTextColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              child: Text(
                "Proceed to Checkout".toUpperCase(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: size.width > 600 ? 23.0 : 16.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
