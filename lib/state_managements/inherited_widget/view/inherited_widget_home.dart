import 'package:flutter/material.dart';
import 'package:products_repository/products_repository.dart';
import 'package:products_service/products_service.dart';
import 'package:state_comparison/common/common.dart';
import 'package:state_comparison/state_managements/inherited_widget/inherited_widget.dart';

class InheritedWidgetHome extends StatelessWidget {
  const InheritedWidgetHome({super.key});

  @override
  Widget build(BuildContext context) {
    final cartInherited = CartInherited.of(context);

    return SharedHomeScaffold(
      title: 'Inherited Widget',
      body: ProductsStateWidget(
        productsRepository: SpecificProductsRepository(
          service: SpecificProductsService(),
        ),
        child: Builder(builder: (context) {
          final products = ProductsInherited.of(context).products.products;
          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) => ProductCard(
              product: products[index],
              onAddToCart: () =>
                  cartInherited.onMyFieldChange(cartInherited.cart.copyWith(
                items: [...cartInherited.cart.items, products[index]],
              )),
            ),
          );
        }),
      ),
    );
  }
}
