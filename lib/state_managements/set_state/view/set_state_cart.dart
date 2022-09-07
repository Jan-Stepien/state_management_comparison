import 'package:flutter/material.dart';
import 'package:products_repository/products_repository.dart';
import 'package:state_comparison/common/common.dart';
import 'package:state_comparison/state_managements/set_state/set_state.dart';

class SetStateCart extends StatefulWidget {
  const SetStateCart({
    super.key,
    required this.removeFromCart,
    required this.cart,
  });

  final ValueSetter<Product> removeFromCart;
  final Cart cart;

  @override
  State<SetStateCart> createState() => _SetStateCartState();
}

class _SetStateCartState extends State<SetStateCart> {
  late Cart cart;

  @override
  void initState() {
    cart = widget.cart;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SharedCartScaffold(
      total: 'Total: ${cart.totalPrice}',
      body: ListView.builder(
        itemCount: cart.items.length,
        itemBuilder: (context, index) => CartCard(
          key: ValueKey(cart.items[index].id),
          product: cart.items[index],
          removeFromCart: () => setState(() {
            widget.removeFromCart(cart.items[index]);
            cart = cart.copyWith(items: cart.items..remove(cart.items[index]));
          }),
        ),
      ),
    );
  }
}
