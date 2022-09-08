import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products_repository/products_repository.dart';
import 'package:state_comparison/common/common.dart';
import 'package:state_comparison/state_managements/bloc/bloc.dart';

class BlocHome extends StatelessWidget {
  const BlocHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SharedHomeScaffold(
      title: 'Bloc',
      body: BlocBuilder<ProductsBloc, Products>(
        bloc: ProductsBloc(
          productsRepository: context.read<SpecificProductsRepository>(),
        )..add(const ProductsRequested()),
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.products.length,
            itemBuilder: (context, index) => ProductCard(
              product: state.products[index],
              onAddToCart: () => context
                  .read<CartBloc>()
                  .add(AddToCart(state.products[index])),
            ),
          );
        },
      ),
    );
  }
}
