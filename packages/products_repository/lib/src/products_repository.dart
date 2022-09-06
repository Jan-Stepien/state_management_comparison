import 'dart:core';

/// {@template products_repository}
/// A repository responsible for fetching products from a products service.
/// {@endtemplate}
abstract class ProductsRepository<T> {
  /// Returns a [T] with the given [id].
  Future<T?> getProduct({required int id});

  /// Returns a list of [T]s with the given [ids].
  Future<List<T>> getProductsByIds({required List<int> ids});

  /// Returns a list of all [T]s.
  Future<List<T>> getAllProducts();
}
