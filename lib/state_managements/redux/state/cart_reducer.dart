import 'package:products_repository/products_repository.dart';
import 'package:redux/redux.dart';
import 'package:state_comparison/state_managements/redux/redux.dart';

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
