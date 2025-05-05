import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:herdrobe_app/app/data/enums/product_type.dart';
import 'package:herdrobe_app/app/data/enums/products_category.dart';
import 'package:herdrobe_app/app/data/enums/rent_type.dart';
import 'package:herdrobe_app/app/data/enums/size.dart';
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
  final ProductsCategory? category;
  final List<String> reviewsIds;
  final ProductType productType;
  final List<ProductSize> availableSizes;
  final RentType? rentType;
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
    this.category,
    this.reviewsIds = const [],
    required this.productType,
    this.availableSizes = const [],
    this.rentType,
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
    required int stock,
    ProductsCategory? category,
    double rating = 0,
    List<String> reviewsIds = const [],
    int? totalSold,
    bool isDeleted = false,
  }) {
    return ProductModel._(
      id: id,
      sellerUid: sellerUid,
      name: name,
      description: description,
      price: price,
      imageUrls: imageUrls,
      availableSizes: availableSizes,
      category: category,
      productType: ProductType.sell,
      rating: rating,
      reviewsIds: reviewsIds,
      isDeleted: isDeleted,
      // Rent/Swap specific fields are null
      rentType: null,
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
    required int stock,
    required RentType rentType,
    required double depositAmount,
    ProductsCategory? category,
    double rating = 0,
    List<String> reviewsIds = const [],
    int? totalSold,
    bool isDeleted = false,
  }) {
    return ProductModel._(
      id: id,
      sellerUid: sellerUid,
      name: name,
      description: description,
      price: price,
      imageUrls: imageUrls,
      availableSizes: availableSizes,
      category: category,
      productType: ProductType.rent,
      rentType: rentType,
      // depositAmount: depositAmount,
      rating: rating,
      reviewsIds: reviewsIds,
      isDeleted: isDeleted,
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
    required List<String> acceptedCategories,
    String? swapCondition,
    ProductsCategory? category,
    double rating = 0,
    List<String> reviewsIds = const [],
    int? totalSold,
    bool isDeleted = false,
  }) {
    return ProductModel._(
      id: id,
      sellerUid: sellerUid,
      name: name,
      description: description,
      price: 0, // Price is typically 0 for swaps
      imageUrls: imageUrls,
      availableSizes: availableProductSizes,
      category: category,
      productType: ProductType.swap,
      // swapCondition: swapCondition,
      rating: rating,
      reviewsIds: reviewsIds,
      isDeleted: isDeleted,
      // Rent specific fields are null
      rentType: null,
      // depositAmount: null,
    );
  }

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
    );
  }

  // Static method for dummy data
  static ProductModel dummy() {
    final random = Random();
    final productType =
        ProductType.values[random.nextInt(ProductType.values.length)];
    final sizes = ProductSize.values.toList()..shuffle();
    final availableSizes =
        sizes.take(random.nextInt(ProductSize.values.length) + 1).toList();

    switch (productType) {
      case ProductType.sell:
        return ProductModel.forSale(
          id: 'dummy_id_${random.nextInt(1000)}',
          sellerUid: 'dummy_seller_${random.nextInt(100)}',
          name: 'Dummy Sell Product ${random.nextInt(100)}',
          description: 'This is a dummy description for a sell product.',
          price: (random.nextDouble() * 100).roundToDouble() + 10,
          imageUrls: [
            'https://via.placeholder.com/150/FF0000/FFFFFF?text=Dummy1',
            'https://via.placeholder.com/150/00FF00/FFFFFF?text=Dummy2',
          ],
          availableSizes: availableSizes,
          stock: random.nextInt(50) + 1,
          category:
              ProductsCategory.values[random.nextInt(
                ProductsCategory.values.length,
              )],
          rating: (random.nextDouble() * 5).roundToDouble(),
          reviewsIds: List.generate(
            random.nextInt(5),
            (index) => 'review_${random.nextInt(500)}',
          ),
          totalSold: random.nextInt(200),
        );
      case ProductType.rent:
        return ProductModel.forRent(
          id: 'dummy_id_${random.nextInt(1000)}',
          sellerUid: 'dummy_seller_${random.nextInt(100)}',
          name: 'Dummy Rent Product ${random.nextInt(100)}',
          description: 'This is a dummy description for a rent product.',
          price:
              (random.nextDouble() * 50).roundToDouble() +
              5, // Rent price per period
          imageUrls: [
            'https://via.placeholder.com/150/0000FF/FFFFFF?text=DummyRent1',
            'https://via.placeholder.com/150/FFFF00/000000?text=DummyRent2',
          ],
          availableSizes: availableSizes,
          stock: random.nextInt(10) + 1, // Lower stock for rentals typically
          rentType: RentType.values[random.nextInt(RentType.values.length)],
          depositAmount: (random.nextDouble() * 50).roundToDouble() + 20,
          category:
              ProductsCategory.values[random.nextInt(
                ProductsCategory.values.length,
              )],
          rating: (random.nextDouble() * 5).roundToDouble(),
          reviewsIds: List.generate(
            random.nextInt(5),
            (index) => 'review_${random.nextInt(500)}',
          ),
          totalSold: random.nextInt(50), // Total rentals
        );
      case ProductType.swap:
        final categories = ProductsCategory.values.toList()..shuffle();
        final acceptedCats =
            categories
                .take(random.nextInt(ProductsCategory.values.length) + 1)
                .map((c) => c.name)
                .toList();
        return ProductModel.forSwap(
          id: 'dummy_id_${random.nextInt(1000)}',
          sellerUid: 'dummy_seller_${random.nextInt(100)}',
          name: 'Dummy Swap Product ${random.nextInt(100)}',
          description: 'This is a dummy description for a swap product.',
          imageUrls: [
            'https://via.placeholder.com/150/FF00FF/FFFFFF?text=DummySwap1',
            'https://via.placeholder.com/150/00FFFF/000000?text=DummySwap2',
          ],
          availableProductSizes: availableSizes,
          stock: random.nextInt(5) + 1, // Usually single items for swap
          acceptedCategories: acceptedCats,
          swapCondition: 'Good condition, looking for similar value items.',
          category:
              ProductsCategory.values[random.nextInt(
                ProductsCategory.values.length,
              )],
          rating:
              (random.nextDouble() * 5)
                  .roundToDouble(), // Rating might be less relevant for swap
          reviewsIds: List.generate(
            random.nextInt(2),
            (index) => 'review_${random.nextInt(500)}',
          ), // Fewer reviews likely
          totalSold: random.nextInt(10), // Total swaps completed
        );
    }
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
    ProductsCategory? category,
    List<String>? reviewsIds,
    ProductType? productType,
    List<ProductSize>? availableSizes,
    int? stock,
    int? totalSold,
    RentType? rentType,
    double? depositAmount,
    List<String>? acceptedCategories,
    String? swapCondition,
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
      category: category ?? this.category,
      reviewsIds: reviewsIds ?? this.reviewsIds,
      productType: productType ?? this.productType,
      availableSizes: availableSizes ?? this.availableSizes,
      rentType: rentType ?? this.rentType,
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
      'category': category?.name, // Store enum name
      'reviewsIds': reviewsIds,
      'productType': productType.name, // Store enum name
      'availableSizes':
          availableSizes.map((size) => size.name).toList(), // Store enum names
      // Conditionally add rent/swap specific fields
      // if (productType == ProductType.rent) ...{
      //   'rentType': rentType?.name,
      //   'depositAmount': depositAmount,
      // },
      // if (productType == ProductType.swap) ...{'swapCondition': swapCondition},
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
      isDeleted: SafeParsing.parseBool(map['isDeleted']) ?? false,
      category: ProductsCategory.fromString(
        map['category'] as String?,
      ), // Default to null if parsing fails
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
      // Conditionally parse rent/swap fields based on determined productType
      rentType: SafeParsing.parseEnum(map['rentType'], RentType.values),
      // depositAmount: SafeParsing.parseDouble(map['depositAmount']),
      // swapCondition: '',
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
    category,
    reviewsIds,
    productType,
    availableSizes,
    rentType,
    // depositAmount,
    // swapCondition,
  ];
}
