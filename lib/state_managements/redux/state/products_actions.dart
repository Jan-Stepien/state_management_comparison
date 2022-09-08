import 'package:equatable/equatable.dart';
import 'package:products_repository/products_repository.dart';

class ProductsRequested extends Equatable {
  const ProductsRequested();

  @override
  List<Object?> get props => [];
}

class ProductsRequestedSucceeded extends Equatable {
  const ProductsRequestedSucceeded({required this.products});

  final List<Product> products;

  @override
  List<Object?> get props => [products];
}
