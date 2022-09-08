import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:state_comparison/common/common.dart';
import 'package:state_comparison/state_managements/get_it/get_it.dart';

class GetItHome extends StatelessWidget with GetItMixin {
  GetItHome({super.key});

  @override
  Widget build(BuildContext context) {
    final products = watch<ValueListenable<Products>, Products>().products;
    return SharedHomeScaffold(
      title: 'GetIt',
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) => ProductCard(
          product: products[index],
          onAddToCart: () => getIt<Cart>().add(products[index]),
        ),
      ),
    );
  }
}
