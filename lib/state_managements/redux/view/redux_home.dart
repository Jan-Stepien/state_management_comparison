import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:products_repository/model/product.dart';
import 'package:state_comparison/common/common.dart';
import 'package:state_comparison/state_managements/redux/redux.dart';

class ReduxHome extends StatelessWidget {
  const ReduxHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SharedHomeScaffold(
      title: 'Redux',
      body: StoreConnector<AppState, List<Product>>(
        onInit: (store) => store.dispatch(const ProductsRequested()),
        converter: (store) => store.state.products.products,
        builder: (context, products) => ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) => ProductCard(
            product: products[index],
            onAddToCart: () => store.dispatch(
              AddToCart(products[index]),
            ),
          ),
        ),
      ),
    );
  }
}
