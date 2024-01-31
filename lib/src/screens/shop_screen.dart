// Import necessary packages and files
import 'package:badges/badges.dart';
import 'package:cinnamon_rolls_shop/src/widgets/search_box.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Import custom widgets and classes
import '../cart_provider.dart';
import '../constants.dart';
import '../models/cinnamon.dart';
import '../widgets/item_card.dart';
import '../widgets/type_selector.dart';
import 'cart_screen.dart';
import 'item_screen.dart';
import 'package:badges/badges.dart' as badges;

// Define a StatefulWidget for the main shop screen
class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

// Private state class for the ShopScreen widget
class _ShopScreenState extends State<ShopScreen> {
  int selectedIndex = 0;
  String _selectedType = 'All';
  String _searchedValue = '';

  @override
  Widget build(BuildContext context) {
    // Filter the cinnamon items based on selected type and search value
    List<Cinnamon> filteredCinnamon = cinnamon.where((c) {
      bool typeCondition = _selectedType == 'All' || c.type == _selectedType;
      bool searchCondition =
          c.title.toLowerCase().contains(_searchedValue.toLowerCase());
      return typeCondition && searchCondition;
    }).toList();

    final Size size = MediaQuery.of(context).size;

    // Build the main scaffold for the shop screen
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: const ShopScreenMenu(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // SearchBox widget for searching cinnamon items
          SearchBox(
            key: const Key('search_box'),
            onChanged: (value) {
              setState(() {
                _searchedValue = value;
              });
            },
          ),
          // Container for displaying cinnamon types as buttons
          TypeSelector(
            key: const Key('type_buttons_container'),
            onChanged: (type) {
              // Handle type change in the ShopScreen
              setState(() {
                _selectedType = type;
              });
            },
          ),
          const SizedBox(height: defaultPadding / 2),
          // Expanded section containing a GridView of ItemCard widgets
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Column(children: [
                  SizedBox(
                    height: size.height * 0.6,
                    child: GridView.builder(
                      itemCount: filteredCinnamon.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: defaultPadding,
                        crossAxisSpacing: defaultPadding,
                        childAspectRatio: 0.75,
                      ),
                      itemBuilder: (context, index) => ItemCard(
                        key: Key('grid_item_$index'),
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
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ShopScreenMenu extends StatelessWidget implements PreferredSizeWidget {
  const ShopScreenMenu({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return AppBar(
      key: const Key('shop_app_bar'),
      title: Padding(
        padding: EdgeInsets.all(size.width > 600 ? 10.0 : 7.0),
        child: Image.asset('assets/logo/Cinnamood-Logo.png',
            key: const Key('cinnamood_logo'),
            fit: BoxFit.cover,
            height: size.width > 600 ? 30 : 20),
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
              return badges.Badge(
                key: const Key('cart_badge'),
                badgeContent: Text(itemCount.toString()),
                badgeStyle: const badges.BadgeStyle(
                  badgeColor: Colors.white,
                ),
                position: BadgePosition.topEnd(top: -2, end: -1),
                child: IconButton(
                  icon: Icon(Icons.shopping_cart,
                      key: const Key('cart_not_empty'),
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
                key: const Key('empty_cart_icon'),
                icon: Icon(Icons.shopping_cart,
                    color: lightTextColor, size: size.width > 600 ? 38 : 25),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      key: const Key('empty_cart_snackBar'),
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
    );
  }
}
