import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:herdrobe_app/app/constants/paddings.dart';
import 'package:herdrobe_app/app/utils/app_colors.dart';
import 'package:herdrobe_app/app/utils/app_text_styles.dart';
import 'package:herdrobe_app/app/widgets/custom_text.dart';
import 'package:herdrobe_app/app/widgets/my_container.dart';

class StatsWidget extends StatelessWidget {
  const StatsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(
        top: 80.h + kToolbarHeight,
        left: 20.w,
        right: 20.w,
      ),
      crossAxisCount: 2,
      crossAxisSpacing: 16.w,
      mainAxisSpacing: 16.h,
      childAspectRatio: 1.4,
      children: [
        GridCountWidget(title: 'Total Users', value: '1000'),
        GridCountWidget(title: 'Active Users', value: '5000'),
        GridCountWidget(title: 'Total Sales', value: '100k'),
        GridCountWidget(title: 'Revenue', value: '2000'),
      ],
    );
  }
}

class GridCountWidget extends StatelessWidget {
  const GridCountWidget({super.key, required this.title, required this.value});
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return MyContainer(
      radius: 24.r,
      height: 120.h,
      width: 165.w,
      color: Colors.white30,
      border: BorderSide(color: AppColors.white.withOpacity(0.3), width: 2.w),
      padding: EdgeInsets.symmetric(
        horizontal: kPadding16.w,
        vertical: kPadding16.h,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText.boldParagraph(title, color: AppColors.white),
          24.verticalSpace,
          CustomText(
            value,
            style: AppTextStyles.largeHeading32.copyWith(
              color: AppColors.white,
              fontSize: 28.sp,
            ),
            maxLines: 1,
            minSize: 12,
            autoSized: true,
          ),
        ],
      ),
    );
  }
}
