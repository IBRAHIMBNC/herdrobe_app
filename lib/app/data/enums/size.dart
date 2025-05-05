enum ProductSize {
  xs('XS', 'Extra Small'),
  s('S', 'Small'),
  m('M', 'Medium'),
  l('L', 'Large'),
  xl('XL', 'Extra Large'),
  xxl('XXL', '2X Large'),
  xxxl('XXXL', '3X Large');

  final String displayName;
  final String description;

  const ProductSize(this.displayName, this.description);

  static ProductSize fromString(String? value) {
    if (value == null || value.isEmpty) {
      return ProductSize.m; // Default to medium if null or empty
    }
    return ProductSize.values.firstWhere(
      (element) =>
          element.name == value.toLowerCase() || element.displayName == value,
      orElse: () => ProductSize.m, // Default to medium if not found
    );
  }
}
