import 'package:redux/redux.dart';
import 'package:state_comparison/state_managements/redux/redux.dart';

final productsReducer = combineReducers<Products>(
  [
    TypedReducer<Products, ProductsRequestedSucceeded>(_productRequested),
  ],
);

Products _productRequested(Products state, ProductsRequestedSucceeded action) {
  return state.copyWith(products: action.products);
}

void productsRequested(Store<AppState> store, ProductsRequested action,
    NextDispatcher next) async {
  final products = await productsRepository.getAllProducts();

  store.dispatch(ProductsRequestedSucceeded(products: products));
  next(action);
}
