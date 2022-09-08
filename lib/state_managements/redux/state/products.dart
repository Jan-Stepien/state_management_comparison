import 'package:equatable/equatable.dart';
import 'package:products_repository/products_repository.dart';

class Products extends Equatable {
  const Products({required this.products});

  final List<Product> products;

  @override
  List<Object> get props => [products];

  Products copyWith({List<Product>? products}) =>
      Products(products: products ?? this.products);
}
