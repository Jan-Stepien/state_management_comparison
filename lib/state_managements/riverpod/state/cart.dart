import 'package:equatable/equatable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:products_repository/products_repository.dart';
import 'package:state_comparison/helpers/helpers.dart';

final cartProvider = StateNotifierProvider<CartNotifier, Cart>((ref) {
  return CartNotifier();
});

class CartNotifier extends StateNotifier<Cart> {
  CartNotifier() : super(Cart());

  void add(Product item) {
    state = state.copyWith(
      items: [...state.items, item],
    );
  }

  void remove(Product item) {
    state = state.copyWith(
      items: List<Product>.from(state.items)..remove(item),
    );
  }

  void clear() {
    state = state.copyWith(items: []);
  }
}

class Cart extends Equatable {
  Cart({List<Product>? items}) : _items = items ?? [];

  final List<Product> _items;

  List<Product> get items => _items;

  double get totalPrice => _items
      .fold<double>(
        0,
        (previousValue, element) => previousValue + (element.price ?? 0),
      )
      .toPrecision(2);

  Cart copyWith({List<Product>? items}) => Cart(items: items ?? this.items);

  @override
  List<Object> get props => [items];
}
