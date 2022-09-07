import 'package:flutter/material.dart';
import 'package:products_repository/products_repository.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
    required this.onAddToCart,
  });

  final Product product;

  final VoidCallback onAddToCart;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(product.productName ?? ''),
      trailing: IconButton(
        icon: const Icon(Icons.add_shopping_cart),
        onPressed: onAddToCart,
      ),
    );
  }
}
