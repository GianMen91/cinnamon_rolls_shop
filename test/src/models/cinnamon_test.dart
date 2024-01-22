// Importing necessary packages and files
import 'package:cinnamon_rolls_shop/src/models/cinnamon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// Main entry point for the test file
void main() {
  // Test group for the 'Cinnamon' class
  group('Cinnamon', () {
    // Test case for the Cinnamon constructor
    test('Cinnamon constructor should create a valid instance', () {
      // Creating an instance of the Cinnamon class with test data
      final cinnamon = Cinnamon(
        id: 1,
        title: 'Test Roll',
        price: 10.0,
        type: 'Test Type',
        description: 'Test description',
        image: 'test_image.png',
        color: Colors.blue,
      );

      // Assertions to verify that the created instance has the expected values
      expect(cinnamon.id, equals(1));
      expect(cinnamon.title, equals('Test Roll'));
      expect(cinnamon.price, equals(10.0));
      expect(cinnamon.type, equals('Test Type'));
      expect(cinnamon.description, equals('Test description'));
      expect(cinnamon.image, equals('test_image.png'));
      expect(cinnamon.color, equals(Colors.blue));
    });

    // Test case for checking if the Cinnamon list contains valid items
    test('Cinnamon list should contain valid items', () {
      // Assuming 'cinnamon' is a list of Cinnamon objects (you may need to replace this with your actual data)
      final List<Cinnamon> cinnamon = getTestCinnamonList();

      // Assertion to check if the list is not empty
      expect(cinnamon, isNotEmpty);

      // Looping through each item in the list and performing assertions
      for (final item in cinnamon) {
        expect(item.id, isNotNull);
        expect(item.title, isNotNull);
        expect(item.price, isNotNull);
        expect(item.type, isNotNull);
        expect(item.description, isNotNull);
        expect(item.image, isNotNull);
        expect(item.color, isNotNull);
      }
    });
  });
}

// Helper function to generate a test list of Cinnamon objects
List<Cinnamon> getTestCinnamonList() {
  return [
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
        id: 2,
        title: "Blueberry Roll",
        price: 5.30,
        type: "Fruity Rolls",
        description:
            "Fluffy dough with our blueberry filling, topped with vegan cream ch**se frosting, garnished with our blueberry compote & colorful blossoms.",
        image: "assets/images/Blueberry-Roll.png",
        color: const Color(0xFF954D86)),
  ];
}
