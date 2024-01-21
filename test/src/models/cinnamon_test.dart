import 'package:cinnamon_rolls_shop/src/models/cinnamon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Cinnamon', () {
    test('Cinnamon constructor should create a valid instance', () {
      final cinnamon = Cinnamon(
        id: 1,
        title: 'Test Roll',
        price: 10.0,
        type: 'Test Type',
        description: 'Test description',
        image: 'test_image.png',
        color: Colors.blue,
      );

      expect(cinnamon.id, equals(1));
      expect(cinnamon.title, equals('Test Roll'));
      expect(cinnamon.price, equals(10.0));
      expect(cinnamon.type, equals('Test Type'));
      expect(cinnamon.description, equals('Test description'));
      expect(cinnamon.image, equals('test_image.png'));
      expect(cinnamon.color, equals(Colors.blue));
    });

    test('Cinnamon list should contain valid items', () {
      expect(cinnamon, isNotEmpty);

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

    // TODO Add more tests
  });
}
