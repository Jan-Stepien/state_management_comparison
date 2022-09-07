import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_comparison/common/common.dart';
import 'package:state_comparison/state_managements/riverpod/riverpod.dart';

class RiverpodCart extends ConsumerWidget {
  const RiverpodCart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final totalPrice = ref.watch(
      cartProvider.select((value) => value.totalPrice),
    );
    final products = ref.watch(
      cartProvider.select((value) => value.items),
    );

    return SharedCartScaffold(
      total: 'Total: $totalPrice',
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) => CartCard(
          product: products[index],
          removeFromCart: () =>
              ref.read(cartProvider.notifier).remove(products[index]),
        ),
      ),
    );
  }
}
