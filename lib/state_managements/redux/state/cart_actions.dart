import 'package:equatable/equatable.dart';
import 'package:products_repository/products_repository.dart';

class AddToCart extends Equatable {
  const AddToCart(this.item);
  final Product item;

  @override
  List<Object?> get props => [item];
}

class RemoveFromCart extends Equatable {
  const RemoveFromCart(this.item);
  final Product item;

  @override
  List<Object?> get props => [item];
}
