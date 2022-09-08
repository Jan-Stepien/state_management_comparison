import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products_repository/products_repository.dart';
import 'package:state_comparison/state_managements/bloc/bloc.dart';

class CartBloc extends Bloc<CartEvent, Cart> {
  CartBloc() : super(const Cart(items: [])) {
    on<AddToCart>(_addToCart);
    on<RemoveFromCart>(_removeFromCart);
  }

  FutureOr<void> _addToCart(AddToCart event, Emitter<Cart> emit) {
    emit(state.copyWith(
      items: [...state.items, event.product],
    ));
  }

  FutureOr<void> _removeFromCart(RemoveFromCart event, Emitter<Cart> emit) {
    emit(state.copyWith(
      items: state.items.where((item) => item != event.product).toList(),
    ));
  }
}

abstract class CartEvent extends Equatable {
  const CartEvent();
}

class AddToCart extends CartEvent {
  const AddToCart(this.product);

  final Product product;

  @override
  List<Object> get props => [product];
}

class RemoveFromCart extends CartEvent {
  const RemoveFromCart(this.product);

  final Product product;

  @override
  List<Object> get props => [product];
}
