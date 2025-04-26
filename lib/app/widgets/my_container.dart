import 'package:flutter/material.dart';
import 'package:herdrobe_app/app/utils/app_colors.dart';
import 'package:smooth_corner/smooth_corner.dart';

class MyContainer extends Container {
  MyContainer({
    this.border,
    this.onTap,
    this.backgroundImage,
    this.radius = 16,
    this.height,
    this.width,
    this.shadow,
    super.key,
    super.child,
    super.color,
    super.decoration,
    super.foregroundDecoration,
    super.padding,
    super.alignment,
    super.margin,
    super.transform,
    super.transformAlignment,
    this.gradient,
  });
  final dynamic radius;
  final double? height;
  final double? width;
  final DecorationImage? backgroundImage;
  final Function()? onTap;
  final BoxShadow? shadow;
  final BorderSide? border;
  final Gradient? gradient;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        overlayColor: WidgetStateProperty.all(Colors.transparent),
        onTap: onTap,
        child: Container(
          key: key,
          height: height,
          width: width,
          decoration:
              decoration ??
              ShapeDecoration(
                gradient: gradient,
                // shadows: [
                //   shadow ??
                //       BoxShadow(
                //         color: AppColors.black.withOpacity(0.03),
                //         offset: const Offset(4, 4),
                //         blurRadius: 20,
                //         spreadRadius: 0,
                //       ),
                // ],
                color: gradient != null ? null : color ?? AppColors.white,
                image: backgroundImage,
                shape: SmoothRectangleBorder(
                  borderRadius:
                      radius.runtimeType == int || radius.runtimeType == double
                          ? BorderRadius.circular(radius.toDouble())
                          : radius.runtimeType == BorderRadius
                          ? radius
                          : BorderRadius.zero,
                  smoothness: 1,
                  side: border ?? BorderSide.none,
                ),
              ),
          foregroundDecoration: foregroundDecoration,
          padding: padding ?? EdgeInsets.zero,
          alignment: alignment,
          margin: margin,
          transform: transform,
          transformAlignment: transformAlignment,
          child: child,
        ),
      ),
    );
  }
}
