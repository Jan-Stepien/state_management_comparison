import 'package:products_repository/products_repository.dart';
import 'package:products_service/products_service.dart';

/// {@template specific_products_repository}
/// An implementation of [ProductsRepository]
/// responsible for fetching [Product] from a products service.
/// {@endtemplate}
class SpecificProductsRepository extends ProductsRepository<Product> {
  /// {@macro specific_products_repository}
  SpecificProductsRepository({required this.service});

  /// The provided products service.
  final ProductsService<ProductDataModel> service;

  @override
  Future<Product?> getProduct({required int id}) =>
      service.getProduct(id: id).then((value) => value?.toProduct());

  @override
  Future<List<Product>> getProductsByIds({required List<int> ids}) => service
      .getProducts(ids: ids)
      .then((value) => value.map((e) => e.toProduct()).toList());

  @override
  Future<List<Product>> getAllProducts() => service
      .getAllProducts()
      .then((event) => event.map((e) => e.toProduct()).toList());
}

/// extension on [ProductDataModel] to convert to [Product].
extension ProductDataModelX on ProductDataModel {
  /// Converts a [ProductDataModel] to a [Product].
  Product toProduct() => Product(
        id: id,
        assetImageFile: assetImageFile,
        productName: productName,
        productDescription: productDescription,
        price: price,
      );
}
