import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:products_repository/products_repository.dart';
import 'package:state_comparison/helpers/helpers.dart';

class CartStateWidget extends StatefulWidget {
  const CartStateWidget({super.key, required this.child});

  final Widget child;

  @override
  State<CartStateWidget> createState() => _CartState();
}

class _CartState extends State<CartStateWidget> {
  Cart cart = const Cart(items: []);

  void onMyFieldChange(Cart cart) {
    setState(() {
      this.cart = cart;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CartInherited(
      cart: cart,
      onMyFieldChange: onMyFieldChange,
      child: widget.child,
    );
  }
}

class CartInherited extends InheritedWidget {
  const CartInherited({
    super.key,
    this.cart = const Cart(items: []),
    required this.onMyFieldChange,
    required super.child,
  });

  final Cart cart;
  final ValueChanged<Cart> onMyFieldChange;

  static CartInherited of(BuildContext context) {
    final cartInherited =
        context.dependOnInheritedWidgetOfExactType<CartInherited>();
    if (cartInherited == null) {
      throw Exception('CartInherited not found');
    }
    return cartInherited;
  }

  @override
  bool updateShouldNotify(CartInherited oldWidget) => cart != oldWidget.cart;
}

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
