// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:products_repository/products_repository.dart';
import 'package:products_service/products_service.dart';

class MockProductsService extends Mock
    implements ProductsService<ProductDataModel> {}

void main() {
  late ProductsService<ProductDataModel> service;
  late SpecificProductsRepository productsRepository;

  setUp(() {
    service = MockProductsService();
    productsRepository = SpecificProductsRepository(service: service);
  });

  group('SpecificProductsRepository', () {
    test('can be instantiated', () {
      expect(productsRepository, isNotNull);
    });

    group('getProduct', () {
      test('returns a product with given id', () async {
        when(() => service.getProduct(id: 1)).thenAnswer(
          (_) async => ProductDataModel(
            id: 1,
            assetImageFile: 'assetImageFile',
            productDescription: 'productDescription',
            productName: 'productName',
          ),
        );
        final product = await productsRepository.getProduct(id: 1);
        expect(product, isNotNull);
      });

      test('returns null if no product with given id', () async {
        when(() => service.getProduct(id: -1)).thenAnswer((_) async => null);
        final product = await productsRepository.getProduct(id: -1);
        expect(product, isNull);
      });
    });

    group('getProductsByIds', () {
      test('returns a list of products with given ids', () async {
        when(() => service.getProducts(ids: [1, 2])).thenAnswer(
          (_) async => [
            ProductDataModel(
              id: 1,
              assetImageFile: 'assetImageFile',
              productDescription: 'productDescription',
              productName: 'productName',
            ),
            ProductDataModel(
              id: 2,
              assetImageFile: 'assetImageFile',
              productDescription: 'productDescription',
              productName: 'productName',
            ),
          ],
        );
        final products = await productsRepository.getProductsByIds(ids: [1, 2]);
        expect(products, isNotNull);
        expect(products.length, 2);
      });

      test('returns an empty list if no products with given ids', () async {
        when(() => service.getProducts(ids: [-1, -2])).thenAnswer(
          (_) async => [],
        );
        final products =
            await productsRepository.getProductsByIds(ids: [-1, -2]);
        expect(products, isNotNull);
        expect(products.length, 0);
      });
    });
  });

  group('getAllProducts', () {
    test('returns a list of all products', () async {
      when(() => service.getAllProducts()).thenAnswer(
        (_) async => [
          ProductDataModel(
            id: 1,
            assetImageFile: 'assetImageFile',
            productDescription: 'productDescription',
            productName: 'productName',
          ),
          ProductDataModel(
            id: 2,
            assetImageFile: 'assetImageFile',
            productDescription: 'productDescription',
            productName: 'productName',
          ),
        ],
      );
      final products = await productsRepository.getAllProducts();
      expect(products, isNotNull);
      expect(products, isNotEmpty);
    });
  });

  group('extension ProductDataModelX', () {
    test('toProduct returns a Product', () {
      final product = ProductDataModel(
        id: 1,
        assetImageFile: 'assetImageFile',
        productDescription: 'productDescription',
        productName: 'productName',
      );
      final productX = product.toProduct();
      expect(
        productX.id == product.id &&
            productX.assetImageFile == product.assetImageFile &&
            productX.productDescription == product.productDescription &&
            productX.productName == product.productName,
        isTrue,
      );
    });
  });
}
