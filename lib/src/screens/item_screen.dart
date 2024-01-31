// Import necessary packages and files
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Import custom widgets and classes
import '../cart_provider.dart';
import '../constants.dart';
import 'package:cinnamon_rolls_shop/src/models/cinnamon.dart';
import 'package:cinnamon_rolls_shop/src/widgets/cart_counter.dart';

// Define a StatefulWidget for displaying details of a specific cinnamon item
class ItemScreen extends StatefulWidget {
  // Constructor with required parameter
  const ItemScreen({super.key, required this.cinnamon});

  // Property to store information about the cinnamon item
  final Cinnamon cinnamon;

  @override
  State<ItemScreen> createState() => _ItemScreenState();
}

// Private state class for the ItemScreen widget
class _ItemScreenState extends State<ItemScreen> {
  int numOfItems = 1; // Variable to store the quantity of items

  // Build method to create the widget UI
  @override
  Widget build(BuildContext context) {
    // Get the size of the current screen
    final Size size = MediaQuery.of(context).size;

    // Build the scaffold for the item screen
    return Scaffold(
      backgroundColor: widget.cinnamon.color,
      appBar: AppBar(
        key: const Key('app_bar'),
        backgroundColor: widget.cinnamon.color,
        elevation: 0,
        leading: IconButton(
          key: const Key('arrow_back_icon'),
          icon: Icon(Icons.arrow_back_rounded,
              color: Colors.white, size: size.width > 600 ? 38 : 25),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: size.height,
              child: Stack(
                children: <Widget>[
                  // Container for the detailed information about the cinnamon item
                  Container(
                    margin: EdgeInsets.only(
                      top: size.width > 600
                          ? size.height * 0.35
                          : size.width < 400
                          ? size.height * 0.25
                          : size.height * 0.30),
                    padding: const EdgeInsets.only(
                      top: defaultPadding,
                      left: defaultPadding,
                      right: defaultPadding,
                    ),
                    decoration: const BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                            height: size.width > 600
                                ? defaultPadding * 3
                                : defaultPadding),
                        // Display the description of the cinnamon item
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: defaultPadding),
                          child: Text(widget.cinnamon.description,
                              key: const Key('item_description'),
                              style: TextStyle(
                                  fontSize: size.width > 600 ? 25.0 : 16.0,
                                  color: darkTextColor),
                              textAlign: TextAlign.justify),
                        ),
                        const SizedBox(height: defaultPadding / 2),
                        // Row containing CartCounter and Add to Order button
                        Row(
                          children: <Widget>[
                            // CartCounter widget for managing the quantity
                            CartCounter(
                              onValueChanged: (value) {
                                setState(() {
                                  numOfItems = value;
                                });
                              },
                              initialQuantity: 1,
                            ),
                            const SizedBox(width: 20),
                            // ElevatedButton to add the item to the cart
                            Expanded(
                              child: ElevatedButton(
                                key: const Key('add_to_order_button'),
                                onPressed: () {
                                  // Access the CartProvider using Provider
                                  final cartProvider =
                                      Provider.of<CartProvider>(context,
                                          listen: false);
                                  // Add the item to the cart and show a SnackBar
                                  cartProvider.addToCart(
                                      widget.cinnamon, numOfItems);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      duration: const Duration(seconds: 1),
                                      content: Text('Item added to cart',
                                          key: const Key('add_to_cart_snack_bar'),
                                          style: TextStyle(
                                              color: lightTextColor,
                                              fontSize: size.width > 600
                                                  ? 25.0
                                                  : 14.0)),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(double.infinity,
                                      size.width > 600 ? 68.0 : 48.0), backgroundColor: lightTextColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18)),
                                ),
                                child: Text(
                                  "Add to order".toUpperCase(),
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
                      ],
                    ),
                  ),
                  // Container for the cinnamon item details and image
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: defaultPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // Display the cinnamon item title
                        Text(
                          widget.cinnamon.title,
                          key: const Key('item_title'),
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: size.width > 600 ? 60.0 : 22.0),
                        ),
                        // Display the cinnamon item type
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            widget.cinnamon.type,
                            key: const Key('item_type'),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: size.width > 600 ? 30.0 : 14.0),
                          ),
                        ),
                        // Row containing price, spacing, and Hero image
                        Row(
                          children: <Widget>[
                            Text(
                              "Price\n${widget.cinnamon.price.toStringAsFixed(2)} €",
                              key: const Key('price_row'),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: size.width > 600 ? 30.0 : 14.0)
                            ),
                            // SizedBox for spacing
                            const Expanded(
                              child: SizedBox(),
                            ),
                            // Hero image for smooth transition between screens
                            Hero(
                              tag: "${widget.cinnamon.id}",
                              child: Image.asset(
                                widget.cinnamon.image,
                                width: size.width > 600 ? 500 : 260,
                                fit: BoxFit.fill,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
