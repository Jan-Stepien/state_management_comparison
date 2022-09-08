import 'package:equatable/equatable.dart';
import 'package:products_repository/products_repository.dart';
import 'package:redux/redux.dart';
import 'package:state_comparison/state_managements/redux/redux.dart';

// Reducer
final productsReducer = combineReducers<Products>(
  [
    TypedReducer<Products, ProductsRequestedSucceeded>(_productRequested),
  ],
);

Products _productRequested(Products state, ProductsRequestedSucceeded action) {
  return state.copyWith(products: action.products);
}

// Middleware

void productsRequested(Store<AppState> store, ProductsRequested action,
    NextDispatcher next) async {
  final products = await productsRepository.getAllProducts();

  store.dispatch(ProductsRequestedSucceeded(products: products));
  next(action);
}

// Actions
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

// State
class Products extends Equatable {
  const Products({required this.products});

  final List<Product> products;

  @override
  List<Object> get props => [products];

  Products copyWith({List<Product>? products}) =>
      Products(products: products ?? this.products);
}
