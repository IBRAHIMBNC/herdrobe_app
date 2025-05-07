// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:herdrobe_app/app/data/models/cart_item.dart';
import 'package:herdrobe_app/app/utils/safe_parsing.dart';

import '../enums/order_status.dart';

/// Represents an order placed within the application.
class OrderModel extends Equatable {
  final String id;
  final String? buyerUid;
  final String? phoneNumber;
  final double shippingCost;
  final OrderStatus status;
  final List<CartItemModel> items;
  final bool isPickup;
  final String? trackingNumber;
  final String? courier;

  const OrderModel({
    required this.id,
    required this.buyerUid,
    this.shippingCost = 0.0, // Default to 0.0
    this.status = OrderStatus.pending, // Default status
    required this.items,
    this.phoneNumber,
    required this.isPickup,
    this.trackingNumber,
    this.courier,
  });

  static const empty = OrderModel(
    id: '',
    buyerUid: null,
    shippingCost: 0.0,
    status: OrderStatus.pending,
    items: [],
    isPickup: false,
  );

  /// Converts this OrderModel instance into a map.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'buyerUid': buyerUid,
      'phoneNumber': phoneNumber,
      'shippingCost': shippingCost,
      'status': status.name, // Store enum name as string
      'items': items.map((item) => item.toMap()).toList(),
      'isPickup': isPickup,
      'trackingNumber': trackingNumber,
      'courier': courier,
    };
  }

  /// Creates an OrderModel instance from a map.
  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      id: map['id'] as String,
      buyerUid: map['buyerUid'] as String?,
      phoneNumber: map['phoneNumber'] as String?,
      shippingCost: SafeParsing.parseDouble(
        map['shippingCost'],
      ), // Provide default if missing
      status:
          SafeParsing.parseEnum(map['status'] as String?, OrderStatus.values) ??
          OrderStatus.pending,
      items: SafeParsing.parseList<CartItemModel>(
        map['items'] as List<dynamic>?,
        (item) => CartItemModel.fromMap(item as Map<String, dynamic>),
      ),
      isPickup: SafeParsing.parseBool(
        map['isPickup'],
      ), // Provide default if missing
      trackingNumber: map['trackingNumber'] as String?,
      courier: map['courier'] as String?,
    );
  }

  @override
  List<Object?> get props => [
    id,
    buyerUid,
    phoneNumber,
    shippingCost,
    status,
    items,
    isPickup,
    trackingNumber,
    courier,
  ];

  OrderModel copyWith({
    String? id,
    String? buyerUid,
    String? phoneNumber,
    double? shippingCost,
    OrderStatus? status,
    List<CartItemModel>? items,
    bool? isPickup,
    String? trackingNumber,
    String? courier,
  }) {
    return OrderModel(
      id: id ?? this.id,
      buyerUid: buyerUid ?? this.buyerUid,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      shippingCost: shippingCost ?? this.shippingCost,
      status: status ?? this.status,
      items: items ?? this.items,
      isPickup: isPickup ?? this.isPickup,
      trackingNumber: trackingNumber ?? this.trackingNumber,
      courier: courier ?? this.courier,
    );
  }
}
