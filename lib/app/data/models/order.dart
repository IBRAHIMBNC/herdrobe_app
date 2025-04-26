import 'package:herdrobe_app/app/data/models/cart_item.dart';
import '../enums/order_status.dart';

class OrderModel {
  final String uid;
  final String sellerUid;
  final String sellerName;
  final String? sellerProfileUrl;
  final String? buyerUid;
  final String buyerName;
  final String? buyerEmail;
  final String? phoneNumber;
  final String? buyerProfileUrl;
  // final double totalAmount;
  final double? shippingCost;
  final double salesTax;
  // final double? cardFee;
  final String? trxCode;
  final OrderStatus status;
  final List<CartItemModel> items;
  // final AddressModel? address;
  // final List<dynamic> productReviews;
  // final PaymentMethodType paymentType;
  final bool isPickup;
  // final GeoPoint? location;
  final String? trackingNumber;
  final String? courier;
  // final Map<OrderStatus, Timestamp> statusDates;
  // final Timestamp? dateCreated;

  const OrderModel({
    required this.uid,
    this.trxCode,
    required this.sellerUid,
    required this.sellerName,
    this.sellerProfileUrl,
    required this.buyerUid,
    required this.buyerName,
    this.buyerProfileUrl,
    // required this.totalAmount,
    this.shippingCost = 0,
    required this.salesTax,
    // this.productReviews = const [],
    this.status = OrderStatus.pending,
    required this.items,
    // this.address,
    // this.paymentType = OrderPaymentType.cash,
    this.buyerEmail,
    this.phoneNumber,
    required this.isPickup,
    // this.location,
    this.trackingNumber,
    this.courier,
    // required this.statusDates,
    // this.dateCreated,
    // this.cardFee,
  });

  double get grandTotal {
    return items.fold(
          0.0,
          (previousValue, element) => previousValue + element.totalPrice,
        ) +
        shippingCost! +
        salesTax +
        omniFee;
  }

  double get totalAmount {
    return items.fold(
      0.0,
      (previousValue, element) => previousValue + element.totalPrice,
    );
  }

  //Stripe Fee 3 percent
  double get cardFee => grandTotal * 0.03;

  // OMNI FEE IS 1.0 USD
  double get omniFee => 1.0;

  factory OrderModel.empty() {
    return OrderModel(
      uid: '',
      sellerUid: '',
      sellerName: '',
      buyerUid: '',
      buyerName: '',
      shippingCost: 0,
      salesTax: 0,
      trxCode: '',
      status: OrderStatus.pending,
      items: [
        CartItemModel(
          id: '',
          productModel: products.first,
          quantity: 0,
          calculatedPrice: 0,
        ),
      ],
      isPickup: false,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'sellerUid': sellerUid,
      'sellerName': sellerName,
      'sellerProfileUrl': sellerProfileUrl,
      'buyerUid': buyerUid,
      'buyerName': buyerName,
      'buyerProfileUrl': buyerProfileUrl,
      'shippingCost': shippingCost,
      'tax': salesTax,
      'status': status.name,
      // 'address': address?.toMap(),
      // 'productReviews': productReviews,
      'trxCode': trxCode,
      'items': items.map((x) => x.toMap()).toList(),
      // 'paymentType': paymentType.name,
      'buyerEmail': buyerEmail ?? '',
      'phoneNumber': phoneNumber ?? '',
      'isPickup': isPickup,
      // 'location': location,
      'trackingNumber': trackingNumber,
      'courier': courier,
      // 'statusDates': statusDates.map((key, value) => MapEntry(key.name, value)),
      // 'dateCreated': dateCreated ?? FieldValue.serverTimestamp(),
      // 'dateCreated': dateCreated ?? Timestamp.now(),
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    final List<CartItemModel> items = [];
    if (map['items'] != null) {
      for (var item in map['items']) {
        items.add(CartItemModel.fromMap(item));
      }
    }

    return OrderModel(
      uid: map['uid'],
      sellerUid: map['sellerUid'],
      sellerName: map['sellerName'],
      sellerProfileUrl: map['sellerProfileUrl'] as String?,
      buyerUid: map['buyerUid'] as String?,
      buyerName: map['buyerName'],
      buyerProfileUrl: map["buyerProfileUrl"] as String?,
      shippingCost: double.parse(map['shippingCost'].toString()),
      salesTax: double.parse(map['tax'].toString()),
      trxCode: map['trxCode'],
      status: OrderStatus.fromString(map['status']),
      // address:
      //     map['address'] == null ? null : AddressModel.fromMap(map['address']),
      items: items,
      // productReviews: map['productReviews'] ?? [],
      // paymentType:
      //     map['paymentType'] == null
      //         ? OrderPaymentType.card
      //         : OrderPaymentType.fromString(map['paymentType']),
      buyerEmail: map['buyerEmail'] as String?,
      phoneNumber: map['phoneNumber'] as String?,
      isPickup: (map['isPickup'] ?? false) as bool,
      // location: map['location'] as GeoPoint?,
      trackingNumber: map['trackingNumber'] as String?,
      courier: map['courier'] as String?,
      // statusDates: ((map['statusDates'] ?? {}) as Map<String, dynamic>).map(
      //   (key, value) => MapEntry(OrderStatus.fromString(key), value),
      // ),
      // dateCreated: map['dateCreated'] as Timestamp?,
    );
  }

  OrderModel copyWith({
    String? uid,
    String? sellerUid,
    String? sellerName,
    String? sellerProfileUrl,
    String? buyerUid,
    String? buyerName,
    String? buyerEmail,
    String? phoneNumber,
    String? buyerProfileUrl,
    double? shippingCost,
    double? salesTax,
    String? trxCode,
    OrderStatus? status,
    List<CartItemModel>? items,
    // AddressModel? address,
    List<dynamic>? productReviews,
    // Timestamp? dateCreated,
    // Timestamp? dateModified,
    // OrderPaymentType? paymentType,
    bool? isPickup,
    // GeoPoint? location,
    String? trackingNumber,
    String? courier,
    // Map<OrderStatus, Timestamp>? statusDates,
  }) {
    return OrderModel(
      uid: uid ?? this.uid,
      sellerUid: sellerUid ?? this.sellerUid,
      sellerName: sellerName ?? this.sellerName,
      sellerProfileUrl: sellerProfileUrl ?? this.sellerProfileUrl,
      buyerUid: buyerUid ?? this.buyerUid,
      buyerName: buyerName ?? this.buyerName,
      buyerEmail: buyerEmail ?? this.buyerEmail,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      buyerProfileUrl: buyerProfileUrl ?? this.buyerProfileUrl,
      shippingCost: shippingCost ?? this.shippingCost,
      salesTax: salesTax ?? this.salesTax,
      trxCode: trxCode ?? this.trxCode,
      status: status ?? this.status,
      items: items ?? this.items,
      // address: address ?? this.address,
      // productReviews: productReviews ?? this.productReviews,
      // paymentType: paymentType ?? this.paymentType,
      isPickup: isPickup ?? this.isPickup,
      // location: location ?? this.location,
      trackingNumber: trackingNumber ?? this.trackingNumber,
      courier: courier ?? this.courier,
      // statusDates: statusDates ?? this.statusDates,
    );
  }
}
