// Import necessary packages and files
import 'package:cinnamon_rolls_shop/src/widgets/search_box.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart';

// Import custom widgets and classes
import '../cart_provider.dart';
import '../constants.dart';
import '../models/cinnamon.dart';
import '../widgets/item_card.dart';
import 'cart_screen.dart';
import 'item_screen.dart';

// Define a StatefulWidget for the main shop screen
class ShopScreen extends StatefulWidget {
  const ShopScreen({Key? key}) : super(key: key);

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

// Private state class for the ShopScreen widget
class _ShopScreenState extends State<ShopScreen> {
  int selectedIndex = 0;
  String _selectedType = 'All';
  String _searchedValue = '';

  // List of cinnamon types
  List types = ['All', 'Cinnamon Rolls', 'Fruity Rolls', 'Next Level Rolls'];

  @override
  Widget build(BuildContext context) {
    // Get the size of the current screen
    final Size size = MediaQuery.of(context).size;

    // Filter the cinnamon items based on selected type and search value
    List<Cinnamon> filteredCinnamon = cinnamon.where((c) {
      bool typeCondition = _selectedType == 'All' || c.type == _selectedType;
      bool searchCondition =
          c.title.toLowerCase().contains(_searchedValue.toLowerCase());
      return typeCondition && searchCondition;
    }).toList();

    // Build the main scaffold for the shop screen
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.all(size.width > 600 ? 10.0 : 7.0),
          child: Image.asset('assets/logo/Cinnamood-Logo.png',
              fit: BoxFit.cover, height: size.width > 600 ? 30 : 20),
        ),
        backgroundColor: menuBackgroundColor,
        elevation: 0,
        actions: <Widget>[
          // Consumer widget to show the shopping cart icon with badge
          Consumer<CartProvider>(
            builder: (context, cartProvider, child) {
              int itemCount = cartProvider.cartItems.length;

              // Show badge if cart is not empty
              if (itemCount > 0) {
                return Badge(
                  badgeContent: Text(itemCount.toString()),
                  badgeColor: Colors.white,
                  position: BadgePosition.topEnd(top: -2, end: -1),
                  child: IconButton(
                    icon: Icon(Icons.shopping_cart,
                        color: lightTextColor,
                        size: size.width > 600 ? 38 : 25),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CartScreen()));
                    },
                  ),
                );
              } else {
                // Show regular cart icon if cart is empty
                return IconButton(
                  icon: Icon(Icons.shopping_cart,
                      color: lightTextColor, size: size.width > 600 ? 38 : 25),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        duration: const Duration(seconds: 1),
                        content: Text('The cart is empty!',
                            style: TextStyle(
                                color: lightTextColor,
                                fontSize: size.width > 600 ? 25.0 : 14.0)),
                      ),
                    );
                  },
                );
              }
            },
          ),
          const SizedBox(width: defaultPadding / 2),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // SearchBox widget for searching cinnamon items
          SearchBox(onChanged: (value) {
            setState(() {
              _searchedValue = value;
            });
          }),
          // Container for displaying cinnamon types as buttons
          Container(
            margin: const EdgeInsets.symmetric(vertical: defaultPadding / 2),
            height: size.width > 600 ? 50 : 30,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: types.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                    _selectedType = types[index];
                  });
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
          ),
          const SizedBox(height: defaultPadding / 2),
          // Expanded section containing a GridView of ItemCard widgets
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: GridView.builder(
                itemCount: filteredCinnamon.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: defaultPadding,
                  crossAxisSpacing: defaultPadding,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) => ItemCard(
                  cinnamon: filteredCinnamon[index],
                  press: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ItemScreen(
                        cinnamon: filteredCinnamon[index],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
