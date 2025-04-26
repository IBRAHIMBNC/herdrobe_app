enum ProductsCategory {
  none,
  skinCareProducts,
  makeupProducts,
  hairProducts,
  nailProducts,
  beardProducts,
  fragrance,
  bodyCareProducts,
  tanningProducts,
  medSpaProducts;

  static ProductsCategory fromString(String value) {
    switch (value) {
      case 'none' || 'All':
        return ProductsCategory.none;
      case 'skinCareProducts' || 'skin care products' || 'Skin Care Products':
        return ProductsCategory.skinCareProducts;
      case 'makeupProducts' || 'makeup products' || 'Makeup Products':
        return ProductsCategory.makeupProducts;
      case 'hairProducts' || 'hair products' || 'Hair Products':
        return ProductsCategory.hairProducts;
      case 'nailProducts' || 'nail products' || 'Nail Products':
        return ProductsCategory.nailProducts;
      case 'beardProducts' || 'beard products' || 'Beard Products':
        return ProductsCategory.beardProducts;
      case 'fragrance' || 'Fragrance' || 'fragrance':
        return ProductsCategory.fragrance;
      case 'bodyCareProducts' || 'body care products' || 'Body Care Products':
        return ProductsCategory.bodyCareProducts;
      case 'tanningProducts' || 'tanning products' || 'Tanning Products':
        return ProductsCategory.tanningProducts;
      case 'medSpaProducts' || 'med spa products' || 'Med Spa Products':
        return ProductsCategory.medSpaProducts;

      default:
        throw Exception('ProductsCategory not found');
    }
  }

  String get title {
    switch (this) {
      case ProductsCategory.none:
        return 'none';
      case ProductsCategory.skinCareProducts:
        return 'Skin Care Products';
      case ProductsCategory.makeupProducts:
        return 'Makeup Products';
      case ProductsCategory.hairProducts:
        return 'Hair Products';
      case ProductsCategory.nailProducts:
        return 'Nail Products';
      case ProductsCategory.beardProducts:
        return 'Beard Products';
      case ProductsCategory.fragrance:
        return 'Fragrance';
      case ProductsCategory.bodyCareProducts:
        return 'Body Care Products';
      case ProductsCategory.tanningProducts:
        return 'Tanning Products';
      case ProductsCategory.medSpaProducts:
        return 'Med Spa Products';
      default:
        throw Exception('ProductsCategory not found');
    }
  }
}
