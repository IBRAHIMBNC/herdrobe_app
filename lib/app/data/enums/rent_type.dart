enum RentType {
  perDay,
  perWeek,
  perMonth;

  static RentType fromString(String? value) {
    if (value == null || value.isEmpty) {
      return RentType.perDay;
    }
    return RentType.values.firstWhere(
      (element) => element.name == value,
      orElse: () => RentType.perDay,
    );
  }
}
