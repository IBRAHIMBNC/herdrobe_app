class SafeParsing {
  SafeParsing._();

  static double parseDouble(dynamic value, {double defaultValue = 0.0}) {
    if (value == null) {
      return defaultValue;
    }
    try {
      if (value is String) {
        return double.tryParse(value) ?? defaultValue;
      } else if (value is num) {
        return value.toDouble();
      }
      return defaultValue;
    } catch (e) {
      return defaultValue;
    }
  }

  static int parseInt(dynamic value, {int defaultValue = 0}) {
    if (value == null) {
      return defaultValue;
    }
    try {
      if (value is String) {
        return int.tryParse(value) ?? defaultValue;
      } else if (value is num) {
        return value.toInt();
      }
      return defaultValue;
    } catch (e) {
      return defaultValue;
    }
  }

  static bool parseBool(String? value) {
    if (value == null || value.isEmpty) {
      return false;
    }
    try {
      return value.toLowerCase() == 'true';
    } catch (e) {
      return false;
    }
  }

  static DateTime? parseDate(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }
    try {
      return DateTime.parse(value);
    } catch (e) {
      return null;
    }
  }

  static List<T> parseList<T>(
    List<dynamic>? value,
    T Function(String?) parseFunction,
  ) {
    if (value == null || value.isEmpty) {
      return [];
    }
    try {
      return value.map((e) => parseFunction(e.toString())).toList();
    } catch (e) {
      return [];
    }
  }

  static parseEnum<T extends Enum>(String? val, List<T> values) {
    if (val == null || val.isEmpty) {
      return null;
    }
    try {
      return values.byName(val);
    } catch (e) {
      return null;
    }
  }
}
