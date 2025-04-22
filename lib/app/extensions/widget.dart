import 'package:flutter/material.dart';

extension WidgetExtension on Widget {
  Widget shadow({
    Color? color,
    Offset? offset,
    double? blurRadius,
    double? spreadRadius,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        boxShadow: [
          BoxShadow(
            color: color ?? Colors.black.withOpacity(0.05),
            offset: offset ?? const Offset(4, 4),
            blurRadius: blurRadius ?? 16,
            spreadRadius: spreadRadius ?? 0,
          ),
        ],
      ),
      child: this,
    );
  }
}
