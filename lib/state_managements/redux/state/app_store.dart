import 'package:products_repository/products_repository.dart';
import 'package:products_service/products_service.dart';
import 'package:redux/redux.dart';
import 'package:state_comparison/state_managements/redux/redux.dart';

final store = Store<AppState>(
  appReducer,
  initialState: AppState.initial(),
  middleware: [productsMiddleware],
);

AppState appReducer(AppState state, dynamic action) => AppState(
      products: productsReducer(state.products, action),
      cart: cartReducer(state.cart, action),
    );

final productsMiddleware = TypedMiddleware<AppState, ProductsRequested>(
  productsRequested,
);

final productsRepository = SpecificProductsRepository(
  service: SpecificProductsService(),
);
