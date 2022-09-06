// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:products_service/database/static_fruits.dart';
import 'package:products_service/products_service.dart';

void main() {
  group('ProductDataModel', () {
    test('can be instantiated', () {
      final productDataModel = ProductDataModel();
      expect(productDataModel, isNotNull);
    });

    test('supports value comparison', () {
      final productDataModel1 = ProductDataModel();
      final productDataModel2 = ProductDataModel();
      expect(productDataModel1 == productDataModel2, isTrue);
    });

    test('supports deserialization', () {
      final productDataModel = ProductDataModel.fromJson(staticFruit);
      expect(
        productDataModel,
        ProductDataModel(
          id: staticFruit['id'] as int?,
          assetImageFile: staticFruit['assetImageFile'] as String?,
          productDescription: staticFruit['productDescription'] as String?,
          productName: staticFruit['productName'] as String?,
        ),
      );
    });
  });
}
