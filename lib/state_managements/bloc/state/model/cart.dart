import 'package:equatable/equatable.dart';
import 'package:products_repository/products_repository.dart';
import 'package:state_comparison/helpers/helpers.dart';

class Cart extends Equatable {
  const Cart({
    required List<Product> items,
  }) : _items = items;

  Cart copyWith({List<Product>? items}) => Cart(items: items ?? this.items);

  final List<Product> _items;

  List<Product> get items => _items;

  double get totalPrice => _items
      .fold<double>(
        0,
        (previousValue, element) => previousValue + (element.price ?? 0),
      )
      .toPrecision(2);

  @override
  List<Object?> get props => [_items];
}
