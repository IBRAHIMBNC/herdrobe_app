import 'package:flutter/material.dart';
import 'package:herdrobe_app/app/constants/strings.dart';
import 'package:herdrobe_app/app/utils/app_colors.dart';
import 'package:herdrobe_app/app/utils/app_text_styles.dart';

class MultiColorTitle extends StatelessWidget {
  const MultiColorTitle({super.key, required this.titles});
  final List<MultiColorTitleModel> titles;
  @override
  Widget build(BuildContext context) {
    final style = AppTextStyles.largeHeading32.copyWith(
      color: AppColors.textColor1,
    );
    return RichText(
      text: TextSpan(
        children:
            titles
                .map(
                  (title) => TextSpan(
                    text: title.text,
                    style: style.copyWith(
                      color: title.color,
                      fontSize: title.fontSize ?? style.fontSize,
                      fontWeight: title.fontWeight ?? style.fontWeight,
                    ),
                  ),
                )
                .toList(),
      ),
    );
  }
}

class MultiColorTitleModel {
  final String text;
  final Color color;
  final double? fontSize;
  final FontWeight? fontWeight;

  const MultiColorTitleModel(
    this.text, {
    this.color = AppColors.textColor1,
    this.fontSize,
    this.fontWeight,
  });
}
