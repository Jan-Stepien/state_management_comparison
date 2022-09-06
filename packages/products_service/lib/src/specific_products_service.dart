import 'package:collection/collection.dart';
import 'package:products_service/database/static_fruits.dart';
import 'package:products_service/products_service.dart';

/// {@template specific_products_service}
/// An implementation of [ProductsService].
/// {@endtemplate}
class SpecificProductsService extends ProductsService<ProductDataModel> {
  /// {@macro specific_products_service}
  SpecificProductsService();

  /// Private accessor to products from a json file.
  Future<List<ProductDataModel>> _readProducts() async {
    const list = staticFruits;

    final result = <ProductDataModel>[];
    for (final item in list) {
      result.add(ProductDataModel.fromJson(item));
    }
    return result;
  }

  @override
  Future<ProductDataModel?> getProduct({required int id}) async {
    final result = await _readProducts();
    return result.firstWhereOrNull((element) => element.id == id);
  }

  @override
  Future<List<ProductDataModel>> getProducts({required List<int> ids}) async {
    final result = await _readProducts();
    return result.where((element) => ids.contains(element.id)).toList();
  }

  @override
  Future<List<ProductDataModel>> getAllProducts() async {
    final result = await _readProducts();
    return result;
  }
}
