import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:herdrobe_app/app/utils/app_colors.dart';
import 'package:smooth_corner/smooth_corner.dart';

class ElevatedButtonStyles {
  static Size get _defaultButtonSize => Size.fromHeight(57.h);
  static Size get _defaultMediumButtonSize => Size.fromHeight(48.h);
  static Size get _defaultSmallButtonSize => Size.fromHeight(40.h);
  static const int _defaultRadius = 50;

  static Color get _defaultOverlayColor => AppColors.brand.withOpacity(0.1);
  static const _primaryColor = AppColors.brand;

  static ButtonStyle get filledStyle => ElevatedButton.styleFrom(
    surfaceTintColor: AppColors.black,
    padding: EdgeInsets.zero,
    backgroundColor: _primaryColor,
    disabledBackgroundColor: AppColors.textColor2,
    maximumSize: _defaultButtonSize,
    fixedSize: _defaultButtonSize,
    overlayColor: _defaultOverlayColor,
    elevation: 0,
    shape: SmoothRectangleBorder(
      borderRadius: BorderRadius.circular(_defaultRadius.r),
      side: BorderSide.none,
      smoothness: 1,
    ),
  );

  static ButtonStyle get filledSmallStyle => filledStyle.copyWith(
    fixedSize: WidgetStateProperty.all<Size?>(_defaultSmallButtonSize),
    maximumSize: WidgetStateProperty.all<Size?>(_defaultSmallButtonSize),
  );

  static ButtonStyle get filledMediumStyle => filledStyle.copyWith(
    fixedSize: WidgetStateProperty.all<Size?>(_defaultMediumButtonSize),
    maximumSize: WidgetStateProperty.all<Size?>(_defaultMediumButtonSize),
  );

  static ButtonStyle get filledLightStyle => filledStyle.copyWith(
    backgroundColor: WidgetStateProperty.all<Color>(_defaultOverlayColor),
    elevation: WidgetStateProperty.all<double>(0),
  );

  static ButtonStyle get filledLightSmallStyle => filledLightStyle.copyWith(
    fixedSize: WidgetStateProperty.all(_defaultSmallButtonSize),
    maximumSize: WidgetStateProperty.all(_defaultSmallButtonSize),
  );

  static ButtonStyle get filledLightMediumStyle => filledLightStyle.copyWith(
    fixedSize: WidgetStateProperty.all(_defaultMediumButtonSize),
    maximumSize: WidgetStateProperty.all(_defaultMediumButtonSize),
  );

  static ButtonStyle get outlineStyle => OutlinedButton.styleFrom(
    surfaceTintColor: _primaryColor,
    padding: EdgeInsets.zero,
    backgroundColor: Colors.transparent,
    elevation: 0,
    side: const BorderSide(color: _primaryColor),
    disabledBackgroundColor: AppColors.textColor2,
    maximumSize: _defaultButtonSize,
    overlayColor: _defaultOverlayColor,
    fixedSize: _defaultButtonSize,
    shape: SmoothRectangleBorder(
      borderRadius: BorderRadius.circular(_defaultRadius.r),
      side: const BorderSide(color: _primaryColor),
      smoothness: 1,
    ),
  );

  static ButtonStyle get outlineSmallStyle => outlineStyle.copyWith(
    fixedSize: WidgetStateProperty.all<Size>(_defaultSmallButtonSize),
    maximumSize: WidgetStateProperty.all<Size>(_defaultSmallButtonSize),
  );

  static ButtonStyle get outlineMediumStyle => outlineStyle.copyWith(
    fixedSize: WidgetStateProperty.all<Size>(_defaultMediumButtonSize),
    maximumSize: WidgetStateProperty.all<Size>(_defaultMediumButtonSize),
  );
}
