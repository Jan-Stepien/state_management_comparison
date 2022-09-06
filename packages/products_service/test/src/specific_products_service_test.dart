import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:products_service/products_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  late SpecificProductsService service;

  setUp(() {
    service = SpecificProductsService();
  });

  group('SpecificProductsService', () {
    test('can be instantiated', () {
      final service = SpecificProductsService();
      expect(service, isNotNull);
    });

    group('getProduct', () {
      test('returns a product with given id', () async {
        final product = await service.getProduct(id: 1);
        expect(product, isNotNull);
      });

      test('returns null if no product with given id', () async {
        final product = await service.getProduct(id: -1);
        expect(product, isNull);
      });
    });

    group('getProducts', () {
      test('returns a list of products with given ids', () async {
        final products = await service.getProducts(ids: [1, 2]);
        expect(products, isNotNull);
        expect(products.length, 2);
      });

      test('returns an empty list if no products with given ids', () async {
        final products = await service.getProducts(ids: [-1, -2]);
        expect(products, isNotNull);
        expect(products.length, 0);
      });
    });

    group('getAllProducts', () {
      test('returns a list of all products', () async {
        final products = await service.getAllProducts();
        expect(products, isNotNull);
        expect(products, isNotEmpty);
      });
    });
  });
}
