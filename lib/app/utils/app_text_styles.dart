import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:herdrobe_app/app/constants/strings.dart';
import 'package:herdrobe_app/app/utils/app_colors.dart';

class AppTextStyles {
  static const Color _defaultColor = AppColors.textColor1;

  // 32 , Outfit , Large Headings
  static TextStyle get largeHeading32 => TextStyle(
    fontFamily: kcFontFamily,
    fontSize: 32.sp,
    fontWeight: FontWeight.w700,
    color: _defaultColor,
  );

  //26 , Outfit , bold Headings
  static TextStyle get boldHeading26 => TextStyle(
    fontFamily: kcFontFamily,
    fontSize: 26.sp,
    fontWeight: FontWeight.w800,
    color: _defaultColor,
  );

  //24 , Outfit , Big Headings
  static TextStyle get bigHeading24 => TextStyle(
    fontFamily: kcFontFamily,
    fontSize: 24.sp,
    fontWeight: FontWeight.w800,
    color: _defaultColor,
  );

  // 20 , Outfit , Medium Headings
  static TextStyle get mediumHeading20 => TextStyle(
    fontFamily: kcFontFamily,
    fontSize: 20.sp,
    fontWeight: FontWeight.w800,
    color: _defaultColor,
  );

  //18 , Outfit ,bold Headings
  static TextStyle get boldHeading18 => TextStyle(
    fontFamily: kcFontFamily,
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    color: _defaultColor,
  );

  //16 , Outfit ,Small Headings
  static TextStyle get smallHeading16 => TextStyle(
    fontFamily: kcFontFamily,
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: _defaultColor,
  );
  //14 , Bold Paragraph
  static TextStyle get boldParagraph14 => TextStyle(
    fontFamily: kcFontFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: _defaultColor,
  );
  //14 , Paragraph
  static TextStyle get paragraph14 => TextStyle(
    fontFamily: kcFontFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
    color: _defaultColor,
  );

  // 12 , Small Bold
  static TextStyle get smallBold12 => TextStyle(
    fontFamily: kcFontFamily,
    fontSize: 12.sp,
    fontWeight: FontWeight.w700,
    color: _defaultColor,
  );
  //12 , Small
  static TextStyle get small12 => TextStyle(
    fontFamily: kcFontFamily,
    fontSize: 12.sp,
    fontWeight: FontWeight.normal,
    color: _defaultColor,
  );
  //10 , Smaller
  static TextStyle get smaller => TextStyle(
    fontFamily: kcFontFamily,
    fontSize: 10.sp,
    fontWeight: FontWeight.normal,
    color: _defaultColor,
  );
}
