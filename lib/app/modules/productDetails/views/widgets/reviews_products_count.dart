import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:herdrobe_app/app/constants/paddings.dart';
import 'package:herdrobe_app/app/utils/app_colors.dart';
import 'package:herdrobe_app/app/widgets/custom_text.dart';
import 'package:herdrobe_app/app/widgets/my_container.dart';

class ReviewsProductsCount extends StatelessWidget {
  const ReviewsProductsCount({super.key});

  @override
  Widget build(BuildContext context) {
    return MyContainer(
      radius: 8.r,
      padding: EdgeInsets.symmetric(
        horizontal: kPadding20.w,
        vertical: kPadding12.h,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                CustomText.boldParagraph('4.5'),
                4.verticalSpace,
                CustomText.small12('Ratings'),
              ],
            ),
          ),
          SizedBox(
            height: 34.h,
            child: VerticalDivider(
              color: AppColors.black.withOpacity(0.1),

              width: 1,
            ),
          ),
          Expanded(
            child: Column(
              children: [
                CustomText.boldParagraph('655'),
                4.verticalSpace,
                CustomText.small12('Listing'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
