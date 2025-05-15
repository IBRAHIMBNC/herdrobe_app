import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:herdrobe_app/app/data/enums/product_type.dart';
import 'package:herdrobe_app/app/data/enums/products_category.dart';
import 'package:herdrobe_app/app/data/enums/rent_period.dart';
import 'package:herdrobe_app/app/data/enums/size.dart';
import 'package:herdrobe_app/app/data/extensions/map.dart';
import 'package:herdrobe_app/app/utils/safe_parsing.dart';

class ProductModel extends Equatable {
  final String id;
  final String sellerUid;
  final String name;
  final String description;
  final double rating;
  final double price;
  final bool isDeleted;
  final List<String> imageUrls;
  final List<ProductsCategory> categories;
  final List<String> reviewsIds;
  final ProductType productType;
  final List<ProductSize> availableSizes;
  final RentPeriod? rentPeriod;
  final String? contactNumber;
  final DateTime createdAt;
  final String? swapWith;
  // final
  // final double? depositAmount;
  // final String? swapCondition;r

  // Private constructor - used by factory constructors
  const ProductModel._({
    this.isDeleted = false,
    required this.id,
    required this.sellerUid,
    required this.name,
    required this.description,
    this.rating = 0,
    required this.price,
    required this.imageUrls,
    this.categories = const [],
    this.reviewsIds = const [],
    required this.productType,
    this.availableSizes = const [],
    this.rentPeriod,
    this.contactNumber,
    required this.createdAt,
    this.swapWith,
    // this.depositAmount,
    // this.swapCondition,
  });

  // Factory constructor for Sell products
  factory ProductModel.forSale({
    required String id,
    required String sellerUid,
    required String name,
    required String description,
    required double price,
    required List<String> imageUrls,
    required List<ProductSize> availableSizes,
    List<ProductsCategory> categories = const [],
    double rating = 0,
    List<String> reviewsIds = const [],
    int? totalSold,
    bool isDeleted = false,
    String? contactNumber,
    DateTime? createdAt,

    // this.depositAmount,
    // this.swapCondition,
  }) {
    return ProductModel._(
      id: id,
      sellerUid: sellerUid,
      name: name,
      description: description,
      price: price,
      imageUrls: imageUrls,
      availableSizes: availableSizes,
      categories: categories,
      productType: ProductType.sell,
      rating: rating,
      reviewsIds: reviewsIds,
      isDeleted: isDeleted,
      // Rent/Swap specific fields are null
      rentPeriod: null,
      contactNumber: contactNumber,
      createdAt: createdAt ?? DateTime.now(),

      // depositAmount: null,
      // swapCondition: null,
    );
  }

  // Factory constructor for Rent products
  factory ProductModel.forRent({
    required String id,
    required String sellerUid,
    required String name,
    required String description,
    required double price, // Price per rent period
    required List<String> imageUrls,
    required List<ProductSize> availableSizes,
    int stock = 0,
    required RentPeriod rentType,
    required double depositAmount,
    List<ProductsCategory> categories = const [],
    double rating = 0,
    List<String> reviewsIds = const [],
    int? totalSold,
    bool isDeleted = false,
    String? contactNumber,
    DateTime? createdAt,
  }) {
    return ProductModel._(
      id: id,
      sellerUid: sellerUid,
      name: name,
      description: description,
      price: price,
      imageUrls: imageUrls,
      availableSizes: availableSizes,
      categories: categories,
      productType: ProductType.rent,
      rentPeriod: rentType,
      // depositAmount: depositAmount,
      rating: rating,
      reviewsIds: reviewsIds,
      isDeleted: isDeleted,
      contactNumber: contactNumber,
      createdAt: createdAt ?? DateTime.now(),
      // swapCondition: null,
    );
  }

  // Factory constructor for Swap products
  factory ProductModel.forSwap({
    required String id,
    required String sellerUid,
    required String name,
    required String description,
    required List<String> imageUrls,
    required List<ProductSize> availableProductSizes,
    required int stock,
    String? swapCondition,
    List<ProductsCategory> categories = const [],
    double rating = 0,
    List<String> reviewsIds = const [],
    int? totalSold,
    bool isDeleted = false,
    String? contactNumber,
    DateTime? createdAt,
    String? swapWith,
  }) {
    return ProductModel._(
      id: id,
      sellerUid: sellerUid,
      name: name,
      description: description,
      price: 0, // Price is typically 0 for swaps
      imageUrls: imageUrls,
      availableSizes: availableProductSizes,
      categories: categories,
      productType: ProductType.swap,
      rating: rating,
      reviewsIds: reviewsIds,
      isDeleted: isDeleted,
      rentPeriod: null,
      contactNumber: contactNumber,
      createdAt: createdAt ?? DateTime.now(),
      swapWith: swapWith,
    );
  }

  ProductModel copyWith({
    String? id,
    String? sellerUid,
    String? name,
    String? description,
    double? rating,
    double? price,
    List<String>? imageUrls,
    bool? isDeleted,
    List<ProductsCategory>? categories,
    List<String>? reviewsIds,
    ProductType? productType,
    List<ProductSize>? availableSizes,
    int? stock,
    int? totalSold,
    RentPeriod? rentType,
    double? depositAmount,
    List<String>? acceptedCategories,
    String? swapCondition,
    String? contactNumber,
    DateTime? createdAt,
    String? swapWith,
  }) {
    // Use the private constructor for copyWith as well
    return ProductModel._(
      id: id ?? this.id,
      sellerUid: sellerUid ?? this.sellerUid,
      name: name ?? this.name,
      description: description ?? this.description,
      rating: rating ?? this.rating,
      price: price ?? this.price,
      imageUrls: imageUrls ?? this.imageUrls,
      isDeleted: isDeleted ?? this.isDeleted,
      categories: categories ?? this.categories,
      reviewsIds: reviewsIds ?? this.reviewsIds,
      productType: productType ?? this.productType,
      availableSizes: availableSizes ?? this.availableSizes,
      rentPeriod: rentType ?? this.rentPeriod,
      contactNumber: contactNumber ?? this.contactNumber,
      createdAt: createdAt ?? this.createdAt,
      swapWith: swapWith ?? this.swapWith,
      // depositAmount: depositAmount ?? this.depositAmount,
      // swapCondition: swapCondition ?? this.swapCondition,
    );
  }

  /// Converts this ProductModel instance to a Map (e.g., for database storage).
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id, // Changed 'uid' to 'id' to match field name
      'sellerUid': sellerUid, // Changed 'selleruid' to 'sellerUid'
      'name': name,
      'description': description,
      'rating': rating,
      'price': price,
      'imageUrls': imageUrls,
      'isDeleted': isDeleted,
      'categories':
          categories.map((cat) => cat.name).toList(), // Store enum names
      'reviewsIds': reviewsIds,
      'productType': productType.name, // Store enum name
      'availableSizes':
          availableSizes.map((size) => size.name).toList(), // Store enum names
      'contactNumber': contactNumber,
      'rentPeriod': rentPeriod?.name,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'swapWith': swapWith,
    };
  }

  /// Creates a ProductModel instance from a Map (e.g., from database).
  factory ProductModel.fromMap(Map<String, dynamic> map) {
    // Helper function for safe enum parsing from String name

    return ProductModel._(
      id: map['id'] as String? ?? '', // Use 'id' key
      sellerUid: map['sellerUid'] as String? ?? '', // Use 'sellerUid' key
      name: map['name'] as String? ?? '',
      description: map['description'] as String? ?? '',
      rating: SafeParsing.parseDouble(map['rating']),
      price: SafeParsing.parseDouble(map['price']),
      imageUrls: SafeParsing.parseList(
        map['imageUrls'],
        (url) => url.toString(),
      ),
      isDeleted: SafeParsing.parseBool(map['isDeleted']),
      categories: SafeParsing.parseList(
        map['categories'],
        (cat) => ProductsCategory.fromString(cat),
      ),
      // reviewsIds: List<String>.from(
      //   (map['reviewsIds'] as List<dynamic>? ?? []).map((e) => e.toString()),
      // ),
      reviewsIds: SafeParsing.parseList(
        map['reviewsIds'],
        (id) => id.toString(),
      ),
      productType:
          SafeParsing.parseEnum(map['productType'], ProductType.values) ??
          ProductType.sell, // Default to sell if parsing fails
      availableSizes: SafeParsing.parseList(
        map['availableSizes'],
        (size) => ProductSize.fromString(size),
      ),
      rentPeriod: SafeParsing.parseEnum(map['rentType'], RentPeriod.values),
      contactNumber: map['contactNumber'] as String?,
      createdAt: SafeParsing.parseDate(map['createdAt']) ?? DateTime.now(),
      swapWith: map['swapWith'] as String?,
    );
  }

  @override
  List<Object?> get props => [
    id,
    sellerUid,
    name,
    description,
    rating,
    price,
    isDeleted,
    imageUrls,
    categories,
    reviewsIds,
    productType,
    availableSizes,
    rentPeriod,
    contactNumber,
    createdAt,
    swapWith,
  ];

  // Factory constructor for creating an empty ProductModel
  factory ProductModel.empty() {
    // Returns a basic 'sell' type product with minimal default values
    return ProductModel._(
      id: '',
      sellerUid: '',
      name: '',
      description: '',
      price: 0.0,
      imageUrls: [],
      productType: ProductType.sell, // Default to sell or handle as needed
      availableSizes: [],
      createdAt: DateTime.now(),
    );
  }
  @override
  String toString() {
    return toMap().prettyPrint;
  }
}
