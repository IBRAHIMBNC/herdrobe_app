enum RentPeriod {
  day,
  week,
  month;

  static RentPeriod fromString(String? value) {
    if (value == null || value.isEmpty) {
      return RentPeriod.day;
    }
    return RentPeriod.values.byName(value);
  }
}
