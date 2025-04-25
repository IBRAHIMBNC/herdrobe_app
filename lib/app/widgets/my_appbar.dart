import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:herdrobe_app/app/utils/app_colors.dart';
import 'package:herdrobe_app/app/utils/app_text_styles.dart';
import 'package:herdrobe_app/app/widgets/custom_text.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final dynamic title;
  final bool showBackButton;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final Color? iconColor;
  final VoidCallback? onBackPressed;
  final double? height;

  const MyAppBar({
    super.key,
    this.title,
    this.showBackButton = true,
    this.actions,
    this.backgroundColor,
    this.iconColor = Colors.black,
    this.onBackPressed,
    this.height,
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
        children: [
          showBackButton
              ? Padding(
                padding: EdgeInsets.symmetric(
                  vertical: preferredSize.height / 7,
                  horizontal: preferredSize.height / 7,
                ),
                child: InkWell(
                  onTap: onBackPressed ?? () => Navigator.of(context).pop(),
                  borderRadius: BorderRadius.circular(50),
                  child: CircleAvatar(
                    backgroundColor: AppColors.cardColor,
                    child: Icon(
                      Icons.arrow_back_ios_rounded,
                      size: 18,
                      color: iconColor,
                    ),
                  ),
                ),
              )
              : SizedBox.shrink(),
          Expanded(
            child:
                title != null && title is String
                    ? CustomText(
                      title!,
                      style: AppTextStyles.mediumHeading20.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    )
                    : title is Widget
                    ? title
                    : null,
          ),
        ],
      ),
      titleSpacing: 8.w,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? kToolbarHeight); // Default height of AppBar
}
