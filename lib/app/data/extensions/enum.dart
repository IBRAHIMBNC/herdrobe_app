extension EnumExt<T extends Enum> on Enum {
  String get capitalizeFirst {
    final str = name;
    if (str.isEmpty) {
      return '';
    }
    return '${str[0].toUpperCase()}${str.substring(1)}';
  }
}
