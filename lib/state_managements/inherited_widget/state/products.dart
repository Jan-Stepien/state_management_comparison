import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:products_repository/products_repository.dart';

class ProductsStateWidget extends StatefulWidget {
  const ProductsStateWidget({
    super.key,
    required this.child,
    required this.productsRepository,
  });

  final Widget child;
  final ProductsRepository<Product> productsRepository;

  @override
  State<ProductsStateWidget> createState() => _ProductsState();
}

class _ProductsState extends State<ProductsStateWidget> {
  Products products = const Products(products: []);

  @override
  void initState() {
    widget.productsRepository.getAllProducts().then((products) {
      setState(() {
        this.products = Products(products: products);
      });
    });
    super.initState();
  }

  void onProductsChange(Products products) {
    setState(() {
      this.products = products;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ProductsInherited(
      products: products,
      onProductsChange: onProductsChange,
      child: widget.child,
    );
  }
}

class ProductsInherited extends InheritedWidget {
  const ProductsInherited({
    super.key,
    this.products = const Products(products: []),
    required this.onProductsChange,
    required super.child,
  });

  final Products products;
  final ValueChanged<Products> onProductsChange;

  static ProductsInherited of(BuildContext context) {
    final productsInherited =
        context.dependOnInheritedWidgetOfExactType<ProductsInherited>();
    if (productsInherited == null) {
      throw Exception('ProductsInherited not found');
    }
    return productsInherited;
  }

  @override
  bool updateShouldNotify(ProductsInherited oldWidget) =>
      products != oldWidget.products;
}

class Products extends Equatable {
  const Products({required this.products});

  final List<Product> products;

  @override
  List<Object> get props => [products];
}
