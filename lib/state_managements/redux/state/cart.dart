import 'package:equatable/equatable.dart';
import 'package:products_repository/products_repository.dart';
import 'package:state_comparison/helpers/helpers.dart';
import 'package:redux/redux.dart';

// Reducer
final cartReducer = combineReducers<Cart>([
  TypedReducer<Cart, AddToCart>(_addTodo),
  TypedReducer<Cart, RemoveFromCart>(_removeTodo),
]);

Cart _addTodo(Cart cart, AddToCart action) {
  return cart.copyWith(items: [...cart.items, action.item]);
}

Cart _removeTodo(Cart cart, RemoveFromCart action) {
  return cart.copyWith(
    items: List<Product>.from(cart.items)..remove(action.item),
  );
}

// Actions
class AddToCart extends Equatable {
  const AddToCart(this.item);
  final Product item;

  @override
  List<Object?> get props => [item];
}

class RemoveFromCart extends Equatable {
  const RemoveFromCart(this.item);
  final Product item;

  @override
  List<Object?> get props => [item];
}

// State
class Cart extends Equatable {
  const Cart({
    required List<Product> items,
  }) : _items = items;

  Cart copyWith({List<Product>? items}) => Cart(items: items ?? this.items);

  final List<Product> _items;

  List<Product> get items => _items;

  double get totalPrice => _items
      .fold<double>(
        0,
        (previousValue, element) => previousValue + (element.price ?? 0),
      )
      .toPrecision(2);

  @override
  List<Object?> get props => [_items];
}
