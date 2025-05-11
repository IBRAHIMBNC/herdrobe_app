import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:herdrobe_app/app/utils/app_colors.dart';
import 'package:herdrobe_app/app/widgets/circle_button.dart';
import 'package:herdrobe_app/app/widgets/custom_text.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final dynamic title;
  final bool showBackButton;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final Color? iconColor;
  final VoidCallback? onBackPressed;
  final double? height;
  final double? titleSpacing;
  final PreferredSizeWidget? bottom; // Added bottom property
  final Widget? leading;

  const MyAppBar({
    super.key,
    this.title,
    this.showBackButton = true,
    this.actions,
    this.backgroundColor,
    this.iconColor = Colors.black,
    this.onBackPressed,
    this.height,
    this.titleSpacing,
    this.bottom,
    this.leading, // Initialize bottom
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: height ?? 56.h,
      backgroundColor: backgroundColor ?? Colors.white,
      scrolledUnderElevation: 8,
      shadowColor: AppColors.black.withOpacity(0.2),
      centerTitle: false,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          12.horizontalSpace,
          if (leading != null)
            leading!
          else
            showBackButton && Navigator.canPop(context)
                ? Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: preferredSize.height / 7,
                  ),
                  child: CircleButton(
                    icon: Icon(
                      Icons.arrow_back_ios_rounded,
                      size: 18,
                      color: iconColor,
                    ),
                    onTap: onBackPressed ?? () => Navigator.of(context).pop(),
                  ),
                )
                : SizedBox.shrink(),
          (titleSpacing ?? 16.w).horizontalSpace,
          Expanded(
            child:
                (title != null && title is String
                    ? CustomText.mediumHeading(
                      title!,
                      fontWeight: FontWeight.w600,
                    )
                    : title is Widget
                    ? title
                    : SizedBox.shrink()),
          ),
        ],
      ),
      titleSpacing: 8.w,
      actions: actions,
      bottom: bottom, // Added bottom to AppBar
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
    (height ?? kToolbarHeight) +
        (bottom?.preferredSize.height ?? 0), // Adjust height for bottom
  );
}
