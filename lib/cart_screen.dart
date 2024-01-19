import 'package:flutter/material.dart';

import 'cinnamon.dart';
import 'constants.dart';
import 'cart_counter.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Map<String, dynamic>> cartItems = [
    {
      'cinnamon': Cinnamon(
        id: 9,
        title: "Tiramisu Roll",
        price: 5.50,
        type: "Next Level Rolls",
        description:
            "Fluffy dough with our nut nougat cream, topped with cream cheese frosting, a fresh espresso shot, cocoa powder, mascarpone & amaretti cookie.",
        image: "assets/images/Tiramisu-Roll.png",
        color: const Color(0xFF614034),
      ),
      'quantity': 2
    },
    {
      'cinnamon': Cinnamon(
        id: 9,
        title: "Tiramisu Roll",
        price: 5.50,
        type: "Next Level Rolls",
        description:
            "Fluffy dough with our nut nougat cream, topped with cream cheese frosting, a fresh espresso shot, cocoa powder, mascarpone & amaretti cookie.",
        image: "assets/images/Tiramisu-Roll.png",
        color: const Color(0xFF614034),
      ),
      'quantity': 2
    },
    {
      'cinnamon': Cinnamon(
        id: 9,
        title: "Tiramisu Roll",
        price: 5.50,
        type: "Next Level Rolls",
        description:
            "Fluffy dough with our nut nougat cream, topped with cream cheese frosting, a fresh espresso shot, cocoa powder, mascarpone & amaretti cookie.",
        image: "assets/images/Tiramisu-Roll.png",
        color: const Color(0xFF614034),
      ),
      'quantity': 2
    },
    {
      'cinnamon': Cinnamon(
        id: 9,
        title: "Tiramisu Roll",
        price: 5.50,
        type: "Next Level Rolls",
        description:
            "Fluffy dough with our nut nougat cream, topped with cream cheese frosting, a fresh espresso shot, cocoa powder, mascarpone & amaretti cookie.",
        image: "assets/images/Tiramisu-Roll.png",
        color: const Color(0xFF614034),
      ),
      'quantity': 2
    },
  ];

  @override
  Widget build(BuildContext context) {
    double totalPrice = 0;

    // Calculate total price
    for (var item in cartItems) {
      totalPrice += item['cinnamon'].price * item['quantity'];
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: lightTextColor,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                var item = cartItems[index];
                Cinnamon cinnamon = item['cinnamon'];
                int quantity = item['quantity'];

                return Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Row(
                    children: [
                      Container(
                        width: 80,
                        padding: const EdgeInsets.all(defaultPadding),
                        decoration: BoxDecoration(
                          color: cinnamon.color,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Image.asset(cinnamon.image),
                      ),

                      const SizedBox(width: defaultPadding),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Name of the item
                            Text(
                              cinnamon.title,
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: darkTextColor),
                            ),
                            const SizedBox(height: defaultPadding / 2),
                            // Cart Counter widget
                            const CartCounter(
                                /*numOfItems: quantity,
                              onUpdate: (value) {
                                setState(() {
                                  cartItems[index]['quantity'] = value;
                                });
                              },*/
                                ),
                          ],
                        ),
                      ),
                      const SizedBox(width: defaultPadding),
                      // Price of the item
                      Text(
                        "${cinnamon.price.toStringAsFixed(2)} €",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
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
                const Text(
                  'Total',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: darkTextColor,
                  ),
                ),
                Text(
                  "${totalPrice.toStringAsFixed(2)} €",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(
                left: defaultPadding, right: defaultPadding, bottom: 50),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 48),
                primary: lightTextColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              child: Text(
                "Proceed to Checkout".toUpperCase(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
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
