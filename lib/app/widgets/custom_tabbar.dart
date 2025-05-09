import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:herdrobe_app/app/constants/paddings.dart';
import 'package:herdrobe_app/app/data/extensions/double.dart';
import 'package:herdrobe_app/app/utils/app_colors.dart';
import 'package:herdrobe_app/app/utils/app_text_styles.dart';
import 'package:smooth_corner/smooth_corner.dart';

class CustomTabbar extends StatelessWidget {
  const CustomTabbar({
    super.key,
    required this.tabs,
    this.tabController,
    this.onTabChanged,
    this.isDisabled = false,
  });

  final List<Tab> tabs;
  final TabController? tabController;
  final Function(int)? onTabChanged;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.h,
      decoration: ShapeDecoration(
        color: AppColors.textField,
        shape: SmoothRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      ),
      padding: kPadding8.all,
      child: IgnorePointer(
        ignoring: isDisabled,
        child: TabBar(
          labelColor: AppColors.black,
          labelStyle: AppTextStyles.paragraph14,
          unselectedLabelColor: AppColors.textColor2,
          dividerColor: Colors.transparent,
          padding: EdgeInsets.zero,
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: ShapeDecoration(
            shape: SmoothRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
            color: AppColors.white,
          ),
          indicatorColor: Colors.white,
          tabs: tabs,
          controller: tabController,
          onTap: onTabChanged,
        ),
      ),
    );
  }
}
