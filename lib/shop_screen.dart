import 'package:cinnamon_rolls_shop/cart_screen.dart';
import 'package:cinnamon_rolls_shop/search_box.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart_provider.dart';
import 'constants.dart';
import 'cinnamon.dart';
import 'item_screen.dart';
import 'item_card.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({Key? key}) : super(key: key);

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  int selectedIndex = 0;
  String _selectedType = 'All';
  String _searchedValue = '';

  List types = ['All', 'Cinnamon Rolls', 'Fruity Rolls', 'Next Level Rolls'];

  @override
  Widget build(BuildContext context) {
    List<Cinnamon> filteredCinnamon = cinnamon.where((c) {
      bool typeCondition = _selectedType == 'All' || c.type == _selectedType;
      bool searchCondition =
          c.title.toLowerCase().contains(_searchedValue.toLowerCase());
      return typeCondition && searchCondition;
    }).toList();

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(7.0),
          child: Image.asset('assets/logo/Cinnamood-Logo.png',
              fit: BoxFit.cover, height: 20),
        ),
        backgroundColor: menuBackgroundColor,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              final cartProvider = Provider.of<CartProvider>(context, listen: false);

              if (cartProvider.cartItems.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('The cart is empty!'),
                  ),
                );
              } else {
                Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen()));
              }
            },
          ),
          const SizedBox(width: defaultPadding / 2)
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SearchBox(onChanged: (value) {
            setState(() {
              _searchedValue = value;
            });
          }),
          Container(
            margin: const EdgeInsets.symmetric(vertical: defaultPadding / 2),
            height: 30,
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
                    // At end item it adds extra 20 right padding
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
                  child: Text(
                    types[index],
                    style: index == selectedIndex
                        ? const TextStyle(color: Colors.white)
                        : const TextStyle(color: darkTextColor),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding / 2),
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
