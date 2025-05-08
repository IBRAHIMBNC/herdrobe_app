import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:herdrobe_app/app/constants/paddings.dart';
import 'package:herdrobe_app/app/utils/app_colors.dart';
import 'package:herdrobe_app/app/widgets/custom_image.dart';
import 'package:herdrobe_app/app/widgets/custom_text.dart';
import 'package:herdrobe_app/app/widgets/my_container.dart';

class CheckoutItemCard extends StatelessWidget {
  const CheckoutItemCard({
    super.key,
    required this.titleIcon,
    required this.title,
    this.child,
  });
  final String title;
  final String titleIcon;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return MyContainer(
      border: BorderSide(color: AppColors.black5, width: 1),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: kPadding16.w,
              vertical: kPadding8.h,
            ),
            child: Row(
              children: [
                CustomImage.fromSize(
                  titleIcon,
                  size: 20.sp,
                  fit: BoxFit.contain,
                  color: AppColors.black,
                ),
                8.horizontalSpace,
                CustomText.boldParagraph(title),
              ],
            ),
          ),
          Divider(
            color: AppColors.black.withOpacity(0.1),
            thickness: 1,
            height: 0,
          ),
          if (child != null) child!,
        ],
      ),
    );
  }
}
