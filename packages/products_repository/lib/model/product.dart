import 'package:equatable/equatable.dart';

/// {@template product}
/// A model representing a product returned by the repository.
/// {@endtemplate}
class Product extends Equatable {
  /// {@macro product}
  const Product({
    this.id,
    this.assetImageFile,
    this.productName,
    this.productDescription,
    this.price,
  });

  /// Constructor for creating a [Product] from a JSON object.
  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'] as int?,
        assetImageFile: json['assetImageFile'] as String?,
        productName: json['productName'] as String?,
        productDescription: json['productDescription'] as String?,
        price: json['price'] as double?,
      );

  /// The id of the product.
  final int? id;

  /// The asset image file of the product.
  final String? assetImageFile;

  /// The name of the product.
  final String? productName;

  /// The description of the product.
  final String? productDescription;

  /// The price of the product.
  final double? price;

  @override
  List<Object?> get props => [
        id,
        assetImageFile,
        productName,
        productDescription,
        price,
      ];
}
