// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:products_repository/products_repository.dart';

void main() {
  group('Product', () {
    test('can be instantiated', () {
      final product = Product();
      expect(product, isNotNull);
    });

    test('supports value comparison', () {
      final product1 = Product();
      final product2 = Product();
      expect(product1 == product2, isTrue);
    });

    test('supports deserialization', () {
      final product = Product.fromJson(
        const {
          'id': 1,
          'assetImageFile': 'assetImageFile',
          'productDescription': 'productDescription',
          'productName': 'productName',
        },
      );
      expect(
        product,
        Product(
          id: 1,
          assetImageFile: 'assetImageFile',
          productDescription: 'productDescription',
          productName: 'productName',
        ),
      );
    });
  });
}
