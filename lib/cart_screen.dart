// Import necessary packages and files
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Import custom widgets and classes
import 'build_icon_button.dart';
import 'cart_provider.dart';
import 'constants.dart';
import 'cart_counter.dart';

// Define a screen for displaying the items in the shopping cart
class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  // Build method to create the widget UI
  @override
  Widget build(BuildContext context) {
    // Access the CartProvider using Provider
    final cartProvider = Provider.of<CartProvider>(context);

    // Get the size of the current screen
    final Size size = MediaQuery.of(context).size;

    // Calculate the total price of items in the cart
    double totalPrice = cartProvider.cartItems
        .fold(0, (sum, item) => sum + item.cinnamon.price * item.quantity);

    // Build the scaffold for the cart screen
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            color: lightTextColor,
            size: size.width > 600 ? 38 : 25,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: size.height * 0.4,
            child: ListView.builder(
              itemCount: cartProvider.cartItems.length,
              itemBuilder: (context, index) {
                var item = cartProvider.cartItems[index];

                // Build the cart item row
                return Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Row(
                    children: [
                      // Display the cinnamon item image
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
                            // Display the cinnamon item title
                            Text(
                              item.cinnamon.title,
                              style: TextStyle(
                                fontSize: size.width > 600 ? 30.0 : 16.0,
                                fontWeight: FontWeight.bold,
                                color: darkTextColor,
                              ),
                            ),
                            const SizedBox(height: defaultPadding / 2),
                            // Use the CartCounter widget to manage quantity
                            CartCounter(
                              initialQuantity: item.quantity,
                              onValueChanged: (value) {
                                cartProvider.setQuantity(
                                  item.cinnamon,
                                  value,
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: defaultPadding),
                      Column(
                        children: [
                          // Display the price of the cinnamon item
                          Text(
                            "${item.cinnamon.price.toStringAsFixed(2)} €",
                            style: TextStyle(
                              fontSize: size.width > 600 ? 30.0 : 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: defaultPadding / 2),
                          // Use BuildIconButton to implement the remove item button
                          BuildIconButton(
                              onPressed: () {
                                cartProvider.removeItem(item.cinnamon);
                              },
                              icon: Icons.delete),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          // Divider for visual separation
          const Padding(
            padding: EdgeInsets.all(defaultPadding),
            child: Divider(
              height: 1,
              thickness: 1,
              color: Colors.grey,
            ),
          ),
          // Display the total price of items in the cart
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
          // Button to proceed to checkout (dummy functionality in this case)
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: defaultPadding,
              vertical: 50,
            ),
            child: ElevatedButton(
              onPressed: () {
                // Show a SnackBar with a message for the demo app
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    duration: const Duration(seconds: 10),
                    content: Text(
                      "Apologies! This is a demo app, and purchasing functionality is not available. However, feel free to explore the nearest Cinnamon shop in your area for the delightful experience of buying and enjoying a delicious cinnamon roll!",
                      style: TextStyle(
                        color: lightTextColor,
                        fontSize: size.width > 600 ? 25.0 : 14.0,
                      ),
                    ),
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
