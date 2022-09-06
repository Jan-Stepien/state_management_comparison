import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:products_repository/products_repository.dart';
import 'package:provider/provider.dart';
import 'package:state_comparison/app/app.dart';
import 'package:state_comparison/state_managements/provider/provider.dart';

class ProviderHome extends StatelessWidget {
  const ProviderHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SharedAppBar(
        title: 'Provider',
        cartRedirect: () =>
            Navigator.pushNamed(context, FeaturePages.cart.name),
      ),
      drawer: SharedDrawer(
        drawerItems: drawerItems,
      ),
      body: ChangeNotifierProvider(
        create: (context) => Products(
            productsRepository: Provider.of<SpecificProductsRepository>(context,
                listen: false)),
        child: Consumer<Products>(
          builder: (context, products, child) => ListView.builder(
            itemCount: products.products.length,
            itemBuilder: (context, index) => ListTile(
              title: Text(products.products[index].productName ?? ''),
              onTap: () => Provider.of<Cart>(context, listen: false)
                  .add(products.products[index]),
            ),
          ),
        ),
      ),
    );
  }
}
