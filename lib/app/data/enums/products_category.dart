enum ProductsCategory {
  tops,
  bottoms,
  dresses,
  outerwear,
  accessories,
  footwear,
  sets,
  other;

  static ProductsCategory fromString(String? value) {
    if (value == null || value.isEmpty) {
      return ProductsCategory.other;
    }
    return ProductsCategory.values.firstWhere(
      (element) => element.name == value,
      orElse: () => ProductsCategory.other,
    );
  }
}
