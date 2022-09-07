import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_comparison/common/common.dart';
import 'package:state_comparison/state_managements/riverpod/riverpod.dart';

class RiverpodHome extends ConsumerWidget {
  const RiverpodHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(
      productsProvider.select((value) => value.products),
    );

    return SharedHomeScaffold(
      title: 'Riverpod',
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) => ProductCard(
          product: products[index],
          onAddToCart: () =>
              ref.read(cartProvider.notifier).add(products[index]),
        ),
      ),
    );
  }
}
