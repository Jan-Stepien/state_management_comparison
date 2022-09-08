import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products_repository/products_repository.dart';
import 'package:state_comparison/state_managements/bloc/bloc.dart';

class ProductsBloc extends Bloc<ProductsEvent, Products> {
  ProductsBloc({required this.productsRepository})
      : super(const Products(products: [])) {
    on<ProductsRequested>(_productsRequested);
  }

  final ProductsRepository<Product> productsRepository;

  FutureOr<void> _productsRequested(
    ProductsRequested event,
    Emitter<Products> emit,
  ) async {
    final products = productsRepository.getAllProducts();
    emit(state.copyWith(products: await products));
  }
}

abstract class ProductsEvent extends Equatable {
  const ProductsEvent();
}

class ProductsRequested extends ProductsEvent {
  const ProductsRequested();

  @override
  List<Object> get props => [];
}
