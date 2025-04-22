import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:herdrobe_app/app/utils/app_colors.dart';
import 'package:herdrobe_app/app/utils/app_text_styles.dart';
/* import 'package:google_fonts/google_fonts.dart'; */

class CustomText extends StatelessWidget {
  final Color? color;
  final String text;
  final double height;
  final int size;
  final FontWeight fontWeight;
  final TextAlign? textAlign;
  final TextOverflow overflow;
  final TextStyle? style;
  final int? maxLines;
  final TextDecoration? decoration;
  final bool autoSized;
  final double? minSize;
  final double? maxSize;
  // final String fontFamily;

  const CustomText(
    this.text, {
    super.key,
    this.color,
    this.size = 12,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.center,
    this.height = 1,
    this.overflow = TextOverflow.visible,
    this.style,
    this.maxLines,
    this.decoration,
    this.autoSized = false,
    this.minSize,
    this.maxSize,
  });

  factory CustomText.largeHeading(
    String text, {
    Color? color,
    double? fontSize,
    TextAlign? textAlign,
    FontWeight? fontWeight,
  }) {
    return CustomText(
      text,
      style: AppTextStyles.largeHeading32.copyWith(
        color: color,
        fontSize: fontSize?.sp,
        fontWeight: fontWeight,
      ),
      textAlign: textAlign,
      autoSized: true,
      minSize: 12,
    );
  }

  factory CustomText.boldHeading26(
    String text, {
    Color? color,
    double? fontSize,
    TextAlign? textAlign,
  }) {
    return CustomText(
      text,
      style: AppTextStyles.boldHeading26.copyWith(
        color: color,
        fontSize: fontSize?.sp,
      ),
      textAlign: textAlign,
      autoSized: true,
      minSize: 12,
    );
  }

  factory CustomText.bigHeading(
    String text, {
    Color? color,
    double? fontSize,
    TextAlign? textAlign,
  }) {
    return CustomText(
      text,
      style: AppTextStyles.bigHeading24.copyWith(
        color: color,
        fontSize: fontSize?.sp,
      ),
      textAlign: textAlign,
      autoSized: true,
      minSize: 12,
    );
  }

  factory CustomText.mediumHeading(
    String text, {
    Color? color,
    double? fontSize,
    TextAlign? textAlign,
    FontWeight? fontWeight,
  }) {
    return CustomText(
      text,
      style: AppTextStyles.mediumHeading20.copyWith(
        color: color,
        fontSize: fontSize?.sp,
        fontWeight: fontWeight,
      ),
      textAlign: textAlign,
      autoSized: true,
      minSize: 12,
    );
  }

  factory CustomText.boldHeading18(
    String text, {
    Color? color,
    double? fontSize,
    TextAlign? textAlign,
  }) {
    return CustomText(
      text,
      style: AppTextStyles.boldHeading18.copyWith(
        color: color,
        fontSize: fontSize?.sp,
      ),
      textAlign: textAlign,
      autoSized: true,
      minSize: 12,
    );
  }

  factory CustomText.smallHeading16(
    String text, {
    Color? color,
    double? fontSize,
    TextAlign? textAlign,
  }) {
    return CustomText(
      text,
      style: AppTextStyles.smallHeading16.copyWith(
        color: color,
        fontSize: fontSize?.sp,
      ),
      textAlign: textAlign,
      autoSized: true,
      minSize: 12,
    );
  }

  factory CustomText.boldParagraph(
    String text, {
    Color? color,
    double? fontSize,
    TextAlign? textAlign,
  }) {
    return CustomText(
      text,
      style: AppTextStyles.boldParagraph14.copyWith(
        color: color,
        fontSize: fontSize?.sp,
      ),
      textAlign: textAlign,
      autoSized: true,
      minSize: 12,
    );
  }

  factory CustomText.paragraph(
    String text, {
    Color? color,
    double? fontSize,
    TextAlign? textAlign,
  }) {
    return CustomText(
      text,
      style: AppTextStyles.paragraph14.copyWith(
        color: color,
        fontSize: fontSize?.sp,
      ),

      textAlign: textAlign,
      autoSized: true,
      minSize: 12,
    );
  }

  factory CustomText.smallBold12(
    String text, {
    Color? color,
    double? fontSize,
    TextAlign? textAlign,
  }) {
    return CustomText(
      text,
      style: AppTextStyles.smallBold12.copyWith(
        color: color,
        fontSize: fontSize?.sp,
      ),
      textAlign: textAlign,
      autoSized: true,
      minSize: 12,
    );
  }

  factory CustomText.small12(
    String text, {
    Color? color,
    double? fontSize,
    TextAlign? textAlign,
  }) {
    return CustomText(
      text,
      style: AppTextStyles.small12.copyWith(
        color: color,
        fontSize: fontSize?.sp,
      ),
      textAlign: textAlign,
      autoSized: true,
      minSize: 10,
    );
  }

  factory CustomText.smaller(
    String text, {
    Color? color,
    double? fontSize,
    TextAlign? textAlign,
  }) {
    return CustomText(
      text,
      style: AppTextStyles.smaller.copyWith(
        color: color,
        fontSize: fontSize?.sp,
      ),
      textAlign: textAlign,
      autoSized: true,
      minSize: 8,
    );
  }
  @override
  Widget build(BuildContext context) {
    const defaultColor = AppColors.textColor1;

    if (autoSized) {
      return AutoSizeText(
        text,
        overflow: overflow,
        textAlign: textAlign,
        maxLines: maxLines,
        minFontSize: minSize ?? style?.fontSize!.round().toDouble() ?? 4,
        maxFontSize: maxSize ?? double.infinity,
        style:
            style ??
            TextStyle(
              color: color ?? defaultColor,
              fontSize: size.sp,
              fontWeight: fontWeight,
              height: height,
              decoration: decoration,
            ),
      );
    } else {
      return Text(
        text,
        textAlign: textAlign,
        style:
            style ??
            TextStyle(
              color: color ?? defaultColor,
              fontSize: size.sp,
              fontWeight: fontWeight,
              height: height,
              decoration: decoration,
            ),
      );
    }
  }
}
