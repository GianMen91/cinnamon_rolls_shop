import 'package:cinnamon_rolls_shop/cinnamon.dart';
import 'package:flutter/material.dart';
import 'cart_counter.dart';
import 'constants.dart';

class ItemScreen extends StatelessWidget {
  const ItemScreen({Key? key, required this.cinnamon}) : super(key: key);

  final Cinnamon cinnamon;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: cinnamon.color,
      appBar: AppBar(
        backgroundColor: cinnamon.color,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
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
                    margin: EdgeInsets.only(top: size.height * 0.3),
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
                        const SizedBox(height: defaultPadding / 2),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: defaultPadding),
                          child: Text(cinnamon.description,
                              style: const TextStyle(fontSize: 16, color: darkTextColor),
                              textAlign: TextAlign.justify),
                        ),
                        const SizedBox(height: defaultPadding / 2),
                        Row(
                          children: <Widget>[
                            const CartCounter(),
                            const SizedBox(width: 20),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(double.infinity, 48),
                                    primary: lightTextColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18)),
                                ),
                                child: Text(
                                  "Add to order".toUpperCase(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
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
                          cinnamon.title,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            cinnamon.type,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 14),
                          ),
                        ),
                        const SizedBox(height: defaultPadding),
                        Row(
                          children: <Widget>[
                            RichText(
                              text: TextSpan(
                                children: [
                                  const TextSpan(text: "Price\n"),
                                  TextSpan(
                                    text: "${cinnamon.price.toStringAsFixed(2)} €",
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: defaultPadding),
                            Expanded(
                              child: Hero(
                                tag: "${cinnamon.id}",
                                child: Image.asset(
                                  cinnamon.image,
                                  fit: BoxFit.fill,
                                ),
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
