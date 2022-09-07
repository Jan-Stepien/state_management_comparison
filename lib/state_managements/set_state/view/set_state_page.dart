import 'package:flutter/material.dart';
import 'package:products_repository/products_repository.dart';
import 'package:state_comparison/common/common.dart';
import 'package:state_comparison/state_managements/set_state/set_state.dart';

class SetStatePage extends StatefulWidget {
  const SetStatePage({super.key});

  @override
  State<SetStatePage> createState() => _SetStatePageState();
}

class _SetStatePageState extends State<SetStatePage> {
  Cart cart = Cart();

  void updateCart(Product product) {
    setState(() => cart.add(product));
  }

  void removeFromCart(Product product) {
    setState(() {
      cart = cart.copyWith(
        items: List<Product>.from(cart.items)..remove(product),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SharedNavigator(
      cartPage: SetStateCart(
        key: ValueKey(cart.items.length),
        removeFromCart: removeFromCart,
        cart: cart,
      ),
      homePage: SetStateHome(updateCart: updateCart),
    );
  }
}
