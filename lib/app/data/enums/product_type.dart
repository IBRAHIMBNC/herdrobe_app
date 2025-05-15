import 'dart:ui';

enum ProductType {
  sell(color: Color(0xFF4CAF50)),
  rent(color: Color(0xFF2196F3)),
  swap(color: Color(0xFFFF9800));

  static ProductType fromString(String value) {
    return ProductType.values.firstWhere(
      (element) => element.name == value,
      orElse: () => ProductType.sell,
    );
  }

  final Color color;

  const ProductType({required this.color});
}
