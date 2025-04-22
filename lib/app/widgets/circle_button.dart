import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:herdrobe_app/app/utils/app_colors.dart';
import 'package:herdrobe_app/app/widgets/custom_text.dart';

class CircleButton extends StatelessWidget {
  const CircleButton({
    super.key,
    this.icon,
    this.backgroundColor,
    this.radius,
    this.onTap,
    this.iconColor,
  });
  final Color? backgroundColor;
  final dynamic icon;
  final double? radius;
  final Function()? onTap;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    final iconWidget =
        icon is String
            ? SvgPicture.asset(
              icon,
              height: radius?.h ?? 20.h,
              width: radius?.w ?? 20.w,
              color: iconColor,
            )
            : icon is Widget
            ? icon
            : CustomText.small12(icon, color: Colors.white);
    return InkWell(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: backgroundColor ?? AppColors.cardColor,
        radius: radius ?? 20.r,
        child: iconWidget,
      ),
    );
  }
}
