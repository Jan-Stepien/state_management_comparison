import 'package:flutter/material.dart';
import 'package:products_repository/products_repository.dart';

class Products with ChangeNotifier {
  Products({required this.productsRepository}) {
    productsRepository.getAllProducts().then((value) {
      _products = value;
      notifyListeners();
    });
  }

  final ProductsRepository<Product> productsRepository;

  List<Product> _products = [];

  List<Product> get products => _products;
}
