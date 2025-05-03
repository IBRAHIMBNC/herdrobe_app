import 'package:flutter/material.dart';

class RatingStars extends StatelessWidget {
  const RatingStars({
    super.key,
    required this.rating,
    this.size = 25,
    this.onChanged,
    this.starsColor,
  });
  final double rating;
  final double size;
  final Function(double)? onChanged;
  final Color? starsColor;

  @override
  Widget build(BuildContext context) {
    final color = starsColor ?? const Color(0xffF69B26);

    return Wrap(
      children: List.generate(5, (index) {
        Icon icon;
        if (index >= rating) {
          icon = Icon(Icons.star_border_rounded, color: color, size: size);
        } else if (index > rating - 1 && index < rating) {
          icon = Icon(Icons.star_half_rounded, color: color, size: size);
        } else {
          icon = Icon(Icons.star_rounded, color: color, size: size);
        }

        return InkWell(
          onTap: () {
            if (onChanged != null) {
              onChanged!(index + 1);
            }
          },
          child: icon,
        );
      }),
    );
  }
}
