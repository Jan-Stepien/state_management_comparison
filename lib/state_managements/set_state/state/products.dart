import 'package:products_repository/products_repository.dart';

class Products {
  Products({required this.productsRepository}) {
    productsRepository.getAllProducts().then((value) {
      _products = value;
    });
  }

  final ProductsRepository<Product> productsRepository;

  List<Product> _products = [];

  List<Product> get products => _products;
}
