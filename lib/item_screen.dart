import 'package:cinnamon_rolls_shop/cinnamon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_counter.dart';
import 'cart_provider.dart';
import 'constants.dart';

class ItemScreen extends StatefulWidget {
  const ItemScreen({Key? key, required this.cinnamon}) : super(key: key);

  final Cinnamon cinnamon;

  @override
  State<ItemScreen> createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  int numOfItems = 1;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: widget.cinnamon.color,
      appBar: AppBar(
        backgroundColor: widget.cinnamon.color,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded, color: Colors.white, size: size.width > 600 ? 38 : 25),
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
                  Container(
                    margin: EdgeInsets.only(top: size.width > 600 ? size.height * 0.35 : size.height * 0.25),
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
                        SizedBox(height:  size.width > 600 ? defaultPadding*3 : defaultPadding),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: defaultPadding),
                          child: Text(widget.cinnamon.description,
                              style:  TextStyle(
                                  fontSize: size.width > 600 ? 25.0 : 16.0,
                                  color: darkTextColor),
                              textAlign: TextAlign.justify),
                        ),
                        const SizedBox(height: defaultPadding / 2),
                        Row(
                          children: <Widget>[
                            CartCounter(
                              onValueChanged: (value) {
                                setState(() {
                                  numOfItems = value;
                                });
                              },
                              initialQuantity: 1,
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  final cartProvider =
                                      Provider.of<CartProvider>(context,
                                          listen: false);
                                  cartProvider.addToCart(
                                      widget.cinnamon, numOfItems);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      duration: const Duration(seconds: 1),
                                      content: Text('Item added to cart', style:TextStyle(color: lightTextColor, fontSize: size.width > 600 ? 25.0 : 14.0)),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(double.infinity, size.width > 600 ? 68.0 : 48.0),
                                  primary: lightTextColor,
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
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: defaultPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget.cinnamon.title,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: size.width > 600 ? 60.0 : 22.0),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            widget.cinnamon.type,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: size.width > 600 ? 30.0 : 14.0),
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                      text: "Price\n",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize:
                                              size.width > 600 ? 30.0 : 14.0)),
                                  TextSpan(
                                    text:
                                        "${widget.cinnamon.price.toStringAsFixed(2)} €",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                            size.width > 600 ? 30.0 : 14.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                                width: size.width > 600 ? 150 : defaultPadding),
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
