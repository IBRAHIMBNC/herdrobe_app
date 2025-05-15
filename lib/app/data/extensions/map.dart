import 'dart:convert';

extension PrettyMap on Map {
  String get prettyPrint {
    final convertor = JsonEncoder.withIndent('  ');
    final prettyString = convertor.convert(this);
    return prettyString;
  }
}
