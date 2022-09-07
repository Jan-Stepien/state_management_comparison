import 'package:flutter/material.dart';
import 'package:products_repository/products_repository.dart';
import 'package:products_service/products_service.dart';
import 'package:state_comparison/common/common.dart';

class SetStateHome extends StatefulWidget {
  const SetStateHome({super.key, required this.updateCart});

  final ValueSetter<Product> updateCart;

  @override
  State<SetStateHome> createState() => _SetStateHomeState();
}

class _SetStateHomeState extends State<SetStateHome> {
  List<Product> products = [];

  @override
  void initState() {
    SpecificProductsRepository(service: SpecificProductsService())
        .getAllProducts()
        .then((value) => setState(() => products = value));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SharedHomeScaffold(
      title: 'SetState',
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) => ProductCard(
          product: products[index],
          onAddToCart: () => widget.updateCart(products[index]),
        ),
      ),
    );
  }
}
