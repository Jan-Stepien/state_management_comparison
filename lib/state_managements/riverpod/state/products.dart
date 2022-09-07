import 'package:equatable/equatable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:products_repository/products_repository.dart';
import 'package:state_comparison/state_managements/riverpod/riverpod.dart';

final productsProvider =
    StateNotifierProvider<ProductsNotifier, Products>((ref) {
  return ProductsNotifier(
      productsRepository: ref.read(productsRepositoryProvider));
});

class ProductsNotifier extends StateNotifier<Products> {
  ProductsNotifier({
    required this.productsRepository,
  }) : super(const Products(products: [])) {
    productsRepository.getAllProducts().then((value) {
      state = state.copyWith(products: value);
    });
  }

  final ProductsRepository<Product> productsRepository;
}

class Products extends Equatable {
  const Products({required this.products});

  final List<Product> products;

  Products copyWith({List<Product>? products}) =>
      Products(products: products ?? this.products);

  @override
  List<Object?> get props => [products];
}
