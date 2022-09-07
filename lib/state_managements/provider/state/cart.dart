import 'package:flutter/cupertino.dart';
import 'package:products_repository/products_repository.dart';
import 'package:state_comparison/helpers/helpers.dart';

class Cart with ChangeNotifier {
  final List<Product> _items = [];

  List<Product> get items => _items;

  double get totalPrice => _items
      .fold<double>(
        0,
        (previousValue, element) => previousValue + (element.price ?? 0),
      )
      .toPrecision(2);

  void add(Product item) {
    _items.add(item);
    notifyListeners();
  }

  void remove(Product item) {
    _items.remove(item);
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}
