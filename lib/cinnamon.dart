import 'package:flutter/material.dart';

class Cinnamon {
  final String image, title, description, type;
  final double price;
  final int id;
  final Color color;

  Cinnamon(
      {required this.image,
      required this.title,
      required this.description,
      required this.price,
      required this.type,
      required this.id,
      required this.color});
}

List<Cinnamon> cinnamon = [
  Cinnamon(
      id: 1,
      title: "Classic Roll",
      price: 4.80,
      type: "Cinnamon Rolls",
      description:
          "Timeless: fluffy dough with cinnamon filling, topped with cream cheese frosting.",
      image: "assets/images/Classic-Roll-Vegan.png",
      color: const Color(0xFFD3A984)),
  Cinnamon(
      id: 3,
      title: "Blueberry Roll",
      price: 5.30,
      type: "Fruity Rolls",
      description:
          "Fluffy dough with our blueberry filling, topped with vegan cream ch**se frosting, garnished with our blueberry compote & colorful blossoms.",
      image: "assets/images/Blueberry-Roll.png",
      color: const Color(0xFF954D86)),
  Cinnamon(
      id: 4,
      title: "Raspberry Roll",
      price: 5.30,
      type: "Fruity Rolls",
      description:
          "Fluffy dough with raspberry filling, topped with vegan cream ch**se frosting, garnished with our raspberry compote, raspberry crunch & white chocolate.",
      image: "assets/images/Raspebrry-Roll.png",
      color: const Color(0xFFD33D43)),
  Cinnamon(
      id: 2,
      title: "Apple Roll",
      price: 5.30,
      type: "Fruity Rolls",
      description:
          "Fluffy dough with our apple cinnamon filling & fresh apple pieces, topped with vegan cream ch**se frosting & garnished with our apple compote.",
      image: "assets/images/Apple-Roll.png",
      color: const Color(0xFFD3A984)),
  Cinnamon(
    id: 5,
    title: "Cookie Dough Roll",
    price: 5.50,
    type: "Next Level Rolls",
    description:
        "Fluffy dough with cinnamon filling, topped with vegan cream ch**se frosting & garnished with our cinnamade cookie dough.",
    image: "assets/images/Cookie-Dough-Roll.png",
    color: const Color(0xFFD3A984),
  ),
  Cinnamon(
    id: 7,
    title: "Oreo Roll",
    price: 5.50,
    type: "Next Level Rolls",
    description:
        "Fluffy dough with nut nougat cream made to our own recipe, topped with vegan cream ch**se frosting, garnished with our nut nougat cream & oreo crunch.",
    image: "assets/images/Oreo-Roll.png",
    color: const Color(0xFF62453A),
  ),
  Cinnamon(
      id: 8,
      title: "Pistachio Roll",
      price: 5.50,
      type: "Next Level Rolls",
      description:
          "Fluffy dough with pistachio cream made to our own recipe, topped with cream cheese frosting, garnished with our homemade pistachio cream & chopped pistachios.",
      image: "assets/images/Pistachio-Roll.png",
      color: const Color(0xFFB4BE70)),
  Cinnamon(
      id: 6,
      title: "Marzipan Roll",
      price: 5.50,
      type: "Next Level Rolls",
      description:
          "Fluffy dough with aromatic marzipan filling and fruity cranberries, topped with cream-cheese frosting, garnished with our delicious topping cream and mini gingerbread biscuits.",
      image: "assets/images/Marzipan-Roll.png",
      color: const Color(0xFFD3A984)),
  Cinnamon(
      id: 10,
      title: "Bueno Roll",
      price: 5.50,
      type: "Next Level Rolls",
      description:
          "Fluffy dough with bueno hazelnut cream made to our own recipe, topped with vegan cream ch**se frosting & garnished with our bueno hazelnut cream & crispy oreo white crunch.",
      image: "assets/images/Bueno-Roll.png",
      color: const Color(0xFFEEC08F)),
  Cinnamon(
    id: 9,
    title: "Tiramisu Roll",
    price: 5.50,
    type: "Next Level Rolls",
    description:
        "Fluffy dough with our nut nougat cream, topped with cream cheese frosting, a fresh espresso shot, cocoa powder, mascarpone & amaretti cookie.",
    image: "assets/images/Tiramisu-Roll.png",
    color: const Color(0xFF614034),
  ),
  Cinnamon(
    id: 12,
    title: "Speculas Roll",
    price: 5.50,
    type: "Next Level Rolls",
    description:
        "Fluffy dough with nut nougat cream made to our own recipe, topped with vegan cream ch**se, garnished with peanut cream & peanuts.",
    image: "assets/images/Speculas-Roll.png",
    color: const Color(0xFFA45B30),
  ),
  Cinnamon(
      id: 11,
      title: "Snicka Roll",
      price: 5.50,
      type: "Next Level Rolls",
      description:
          "Fluffy dough with nut nougat cream made to our own recipe, topped with vegan cream ch**se, garnished with peanut cream & peanuts.",
      image: "assets/images/Snicka-Roll.png",
      color: const Color(0xFFD89851)),
  Cinnamon(
      id: 13,
      title: "Raffaella Roll",
      price: 5.50,
      type: "Next Level Rolls",
      description:
          "Fluffy dough with coconut cream made to our own recipe, topped with cream cheese frosting, garnished with our coconut cream & delicate grated coconut.",
      image: "assets/images/Coco-Roll.png",
      color: const Color(0xFFEEC08F)),
  Cinnamon(
    id: 14,
    title: "Salted Caramel Roll",
    price: 5.50,
    type: "Next Level Rolls",
    description:
        "Fluffy dough with salted caramel filling made to our own recipe, topped with cream cheese frosting, garnished with salted caramel cream & caramel crisp pearls.",
    image: "assets/images/Salted-Caramell-Roll.png",
    color: const Color(0xFFC1834F),
  ),
];
