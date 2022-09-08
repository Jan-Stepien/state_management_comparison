import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:state_comparison/common/common.dart';
import 'package:state_comparison/state_managements/get_it/get_it.dart';

class GetItCart extends StatelessWidget with GetItMixin {
  GetItCart({super.key});

  @override
  Widget build(BuildContext context) {
    final totalPrice = watch<ValueListenable<Cart>, Cart>().totalPrice;
    final products = watch<ValueListenable<Cart>, Cart>().items;

    return SharedCartScaffold(
      total: 'Total: $totalPrice',
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) => CartCard(
          product: products[index],
          removeFromCart: () => getIt<Cart>().remove(products[index]),
        ),
      ),
    );
  }
}
