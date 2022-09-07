import 'package:flutter/material.dart';
import 'package:products_repository/products_repository.dart';
import 'package:provider/provider.dart';
import 'package:state_comparison/common/common.dart';
import 'package:state_comparison/state_managements/provider/provider.dart';

class ProviderHome extends StatelessWidget {
  const ProviderHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SharedHomeScaffold(
      title: 'Provider',
      body: ChangeNotifierProvider(
        create: (context) => Products(
          productsRepository: context.read<SpecificProductsRepository>(),
        ),
        child: Consumer<Products>(
          builder: (context, products, child) => ListView.builder(
            itemCount: products.products.length,
            itemBuilder: (context, index) => ProductCard(
              product: products.products[index],
              onAddToCart: () =>
                  context.read<Cart>().add(products.products[index]),
            ),
          ),
        ),
      ),
    );
  }
}
