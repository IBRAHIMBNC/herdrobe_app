enum ProductType {
  sell,
  swap,
  rent;

  static ProductType fromString(String value) {
    return ProductType.values.firstWhere(
      (element) => element.name == value,
      orElse: () => ProductType.sell,
    );
  }
}
