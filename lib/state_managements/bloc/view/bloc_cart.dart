import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products_repository/products_repository.dart';
import 'package:state_comparison/common/common.dart';
import 'package:state_comparison/state_managements/bloc/state/state.dart';

class BlocCart extends StatelessWidget {
  const BlocCart({super.key});

  @override
  Widget build(BuildContext context) {
    final totalPrice =
        context.select<CartBloc, double>((bloc) => bloc.state.totalPrice);
    final products =
        context.select<CartBloc, List<Product>>((bloc) => bloc.state.items);

    return SharedCartScaffold(
      total: 'Total: $totalPrice',
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) => CartCard(
          product: products[index],
          removeFromCart: () => context.read<CartBloc>().add(
                RemoveFromCart(
                  products[index],
                ),
              ),
        ),
      ),
    );
  }
}
