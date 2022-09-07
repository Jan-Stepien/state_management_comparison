import 'package:flutter/material.dart';
import 'package:products_repository/products_repository.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    super.key,
    required this.product,
    required this.removeFromCart,
  });

  final Product product;

  final VoidCallback removeFromCart;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(product.productName.toString()),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(product.price.toString()),
          IconButton(
            icon: const Icon(Icons.remove_shopping_cart),
            onPressed: removeFromCart,
          ),
        ],
      ),
    );
  }
}
