import 'package:flutter/material.dart';
import 'package:products_repository/products_repository.dart';
import 'package:provider/provider.dart';
import 'package:state_comparison/common/common.dart';
import 'package:state_comparison/state_managements/provider/provider.dart';

class ProviderCart extends StatelessWidget {
  const ProviderCart({super.key});

  @override
  Widget build(BuildContext context) {
    final totalPrice = context.select<Cart, double>((cart) => cart.totalPrice);
    final products = context.select<Cart, List<Product>>((cart) => cart.items);

    return SharedCartScaffold(
      total: '$totalPrice',
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) => CartCard(
          product: products[index],
          removeFromCart: () => context.read<Cart>().remove(products[index]),
        ),
      ),
    );
  }
}
