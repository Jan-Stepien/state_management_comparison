import 'package:products_repository/products_repository.dart';
import 'package:state_comparison/helpers/helpers.dart';

class Cart {
  Cart({
    List<Product>? items,
  }) : _items = items ?? [];

  final List<Product> _items;

  List<Product> get items => _items;

  double get totalPrice => _items
      .fold<double>(
        0,
        (previousValue, element) => previousValue + (element.price ?? 0),
      )
      .toPrecision(2);

  void add(Product item) {
    _items.add(item);
  }

  void remove(Product item) {
    _items.remove(item);
  }

  void clear() {
    _items.clear();
  }

  Cart copyWith({
    List<Product>? items,
  }) =>
      Cart(items: items ?? this.items);
}
