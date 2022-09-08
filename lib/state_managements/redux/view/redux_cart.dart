import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:state_comparison/common/common.dart';
import 'package:state_comparison/state_managements/redux/redux.dart';

class ReduxCart extends StatelessWidget {
  const ReduxCart({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Cart>(
      converter: (store) => store.state.cart,
      builder: (context, cart) => SharedCartScaffold(
        total: 'Total: ${cart.totalPrice}',
        body: ListView.builder(
          itemCount: cart.items.length,
          itemBuilder: (context, index) => CartCard(
            product: cart.items[index],
            removeFromCart: () =>
                store.dispatch(RemoveFromCart(cart.items[index])),
          ),
        ),
      ),
    );
  }
}
