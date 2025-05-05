import 'package:equatable/equatable.dart';
import 'package:herdrobe_app/app/data/models/product.dart';
import 'package:herdrobe_app/app/utils/safe_parsing.dart';

/// Represents an item within the shopping cart.
class CartItemModel extends Equatable {
  /// Unique identifier for the cart item.
  final String id;

  /// The number of units of the product in the cart.
  final int quantity;

  /// The product associated with this cart item.
  final ProductModel productModel;

  /// Flag indicating if the user has reviewed this item after purchase.
  final bool isReviewed;

  /// The ID of the review associated with this item, if reviewed.
  final String? reviewId;

  /// Calculates the total price for this cart item (quantity * product price).
  double get totalPrice => quantity * productModel.price;

  /// Creates a CartItemModel instance.
  const CartItemModel({
    required this.id,
    required this.productModel,
    required this.quantity,
    this.isReviewed = false,
    this.reviewId,
  });

  /// Converts this CartItemModel instance to a Map (e.g., for database storage).
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'quantity': quantity,
      // Removed calculatedPrice
      'productModel': productModel.toMap(),
      'isReviewed': isReviewed,
      'reviewId': reviewId, // Corrected key name
    };
  }

  /// Creates a CartItemModel instance from a Map (e.g., from database).
  factory CartItemModel.fromMap(Map<String, dynamic> map) {
    // Helper function for safe boolean parsing

    // Ensure productModel map exists before passing to ProductModel.fromMap
    final productMap = map['productModel'] as Map<String, dynamic>?;
    final productModel =
        productMap != null
            ? ProductModel.fromMap(productMap)
            : ProductModel.empty(); // Use the new empty factory

    return CartItemModel(
      id: map['id'] as String? ?? '', // Handle potential null id
      quantity: SafeParsing.parseInt(
        map['quantity'],
      ), // Handle potential null quantity
      productModel: productModel, // Use the parsed or empty product model
      isReviewed: SafeParsing.parseBool(map['isReviewed']),
      reviewId: map['reviewId'] as String?, // Key name matches toMap
    );
  }

  /// Creates a copy of this CartItemModel instance with optional updated fields.
  CartItemModel copyWith({
    String? id,
    int? quantity,
    // Removed calculatedPrice
    ProductModel? productModel,
    bool? isReviewed,
    String? reviewId,
  }) {
    return CartItemModel(
      id: id ?? this.id,
      quantity: quantity ?? this.quantity,
      productModel: productModel ?? this.productModel,
      isReviewed: isReviewed ?? this.isReviewed,
      reviewId: reviewId ?? this.reviewId,
    );
  }

  @override
  List<Object?> get props => [id, quantity, productModel, isReviewed, reviewId];
}
