import 'package:equatable/equatable.dart';
import 'package:state_comparison/state_managements/redux/redux.dart';

class AppState extends Equatable {
  final Cart cart;
  final Products products;

  const AppState({
    required this.cart,
    required this.products,
  });

  factory AppState.initial() => const AppState(
        cart: Cart(items: []),
        products: Products(products: []),
      );

  @override
  List<Object?> get props => [cart, products];
}
