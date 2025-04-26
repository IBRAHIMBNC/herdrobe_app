import 'dart:math';

import 'package:herdrobe_app/app/data/enums/products_category.dart';

class CartItemModel {
  final String id;
  final int quantity;
  final double calculatedPrice;
  final ProductModel productModel;
  final bool isReviewed;
  final String? reviewId;

  double get totalPrice => quantity * productModel.price;

  const CartItemModel({
    required this.id,
    required this.productModel,
    required this.quantity,
    required this.calculatedPrice,
    this.isReviewed = false,
    this.reviewId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'quantity': quantity,
      'calculatedPrice': calculatedPrice,
      'productModel': productModel.toMap(),
      'isReviewed': isReviewed,
      'review': reviewId,
    };
  }

  factory CartItemModel.fromMap(Map<String, dynamic> map) {
    return CartItemModel(
      id: map['id'] as String,
      quantity: map['quantity'] as int,
      calculatedPrice: (map['calculatedPrice'] as num).toDouble(),
      productModel: ProductModel.fromMap(
        map['productModel'] as Map<String, dynamic>,
      ),
      isReviewed: (map['isReviewed'] ?? false) as bool,
      reviewId: map['reviewId'] as String?,
    );
  }

  CartItemModel copyWith({
    String? id,
    int? quantity,
    double? calculatedPrice,
    ProductModel? productModel,
    bool? isReviewed,
    String? reviewId,
  }) {
    return CartItemModel(
      id: id ?? this.id,
      quantity: quantity ?? this.quantity,
      calculatedPrice: calculatedPrice ?? this.calculatedPrice,
      productModel: productModel ?? this.productModel,
      isReviewed: isReviewed ?? this.isReviewed,
      reviewId: reviewId ?? this.reviewId,
    );
  }
}

class ProductModel {
  final String uid;
  final String sellerUid;
  final String name;
  final String description;
  final int totalSold;
  final int stock;
  final double rating;
  final double price;
  final bool isDeleted;
  final List<String> imageUrls;
  final ProductsCategory? category;
  final List<String> reviewsIds;

  const ProductModel({
    this.isDeleted = false,
    required this.uid,
    required this.sellerUid,
    required this.name,
    required this.description,
    this.totalSold = 0,
    required this.stock,
    this.rating = 0,
    required this.price,
    required this.imageUrls,
    this.category,
    this.reviewsIds = const [],
  });

  ProductModel copyWith({
    String? uid,
    String? sellerUid,
    String? name,
    String? description,
    int? totalSold,
    int? stock,
    double? rating,
    double? price,
    List<String>? imageUrls,
    bool? isDeleted,
    ProductsCategory? category,
    List<String>? reviewsIds,
  }) {
    return ProductModel(
      uid: uid ?? this.uid,
      sellerUid: sellerUid ?? this.sellerUid,
      name: name ?? this.name,
      description: description ?? this.description,
      totalSold: totalSold ?? this.totalSold,
      stock: stock ?? this.stock,
      rating: rating ?? this.rating,
      price: price ?? this.price,
      imageUrls: imageUrls ?? this.imageUrls,
      isDeleted: isDeleted ?? this.isDeleted,
      category: category ?? this.category,
      reviewsIds: reviewsIds ?? this.reviewsIds,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'selleruid': sellerUid,
      'name': name,
      'description': description,
      'totalSold': totalSold,
      'stock': stock,
      'rating': rating,
      'price': price,
      'imageUrls': imageUrls,
      'isDeleted': isDeleted,
      'category': category?.name,
      'reviewsIds': reviewsIds,
    };
  }

  static fromListOfMap(List<dynamic> map) {
    return map
        .map((e) => ProductModel.fromMap(e as Map<String, dynamic>))
        .toList();
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    // print(ProductsCategory.fromString(map['category'] as String));

    return ProductModel(
      uid: map['uid'] as String,
      sellerUid: map['selleruid'] as String,
      name: map['name'] as String,
      description: map['description'] ?? '',
      totalSold: map['totalSold'],
      stock: int.parse(map['stock'].toString()).toInt(),
      rating: double.parse(map['rating'].toString()),
      price: double.parse(map['price'].toString()),
      isDeleted: map['isDeleted'] ?? false,
      imageUrls: List<String>.from(map['imageUrls'] as List<dynamic>),
      category:
          map['category'] != null
              ? ProductsCategory.fromString(map['category'] as String)
              : null,
      reviewsIds: List<String>.from(map['reviewsIds'] ?? []),
    );
  }
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductModel && other.uid == uid;
  }

  @override
  int get hashCode => uid.hashCode;
}

List<ProductModel> products = List<ProductModel>.generate(20, (i) {
  final random = Random();
  final randomNum = random.nextInt(300) + 100;

  return ProductModel(
    uid: 'product$i',
    sellerUid: 'seller$i',
    name: 'Product $i',
    description:
        'Sollicitudin vulputate felis lectus neque nam fermentum aliquam. Accumsan nulla lectus massa id feugiat. At lorem sodales porttitor semper. Metus eleifend et nunc in malesuada eget nisl eget. Lectus erat sit aenean facilisi quis. Amet montes sapien enim ut.More...',
    totalSold: i * 10,
    stock: 100 - i,
    rating: (i % 5).toDouble(),
    price: 99.99 + i,
    isDeleted: false,
    imageUrls: [
      'https://picsum.photos/$randomNum',
      'https://picsum.photos/${randomNum + 2}/${randomNum + 3}',
      'https://picsum.photos/${randomNum + 4}',
      'https://picsum.photos/${randomNum + 5}/${randomNum + 5}',
      'https://picsum.photos/${randomNum + 6}',
      'https://picsum.photos/${randomNum + 3}/${randomNum + 8}',
    ],
  );
});
