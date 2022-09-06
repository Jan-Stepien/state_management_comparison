/// {@template products_service}
/// A service that provides access to products.
/// {@endtemplate}
abstract class ProductsService<T> {
  /// Returns a [T] with the given [id].
  Future<T?> getProduct({required int id});

  /// Returns a list of [T]s with the given [ids].
  Future<List<T>> getProducts({required List<int> ids});

  /// Returns a list of all [T]s.
  Future<List<T>> getAllProducts();
}
