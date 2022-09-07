import 'package:flutter/material.dart';
import 'package:state_comparison/common/common.dart';
import 'package:state_comparison/state_managements/inherited_widget/inherited_widget.dart';

class InheritedWidgetCart extends StatelessWidget {
  const InheritedWidgetCart({super.key});

  @override
  Widget build(BuildContext context) {
    final cartInherited = CartInherited.of(context);

    final totalPrice = cartInherited.cart.totalPrice;
    final products = cartInherited.cart.items;

    return SharedCartScaffold(
      total: 'Total: $totalPrice',
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) => CartCard(
          product: products[index],
          removeFromCart: () => cartInherited.onMyFieldChange(
            cartInherited.cart.copyWith(
              items: [...cartInherited.cart.items]..remove(products[index]),
            ),
          ),
        ),
      ),
    );
  }
}
