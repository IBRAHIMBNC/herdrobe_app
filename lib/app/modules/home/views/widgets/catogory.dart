import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/state_manager.dart';
import 'package:herdrobe_app/app/constants/paddings.dart';
import 'package:herdrobe_app/app/extensions/double.dart';
import 'package:herdrobe_app/app/modules/home/controllers/home_controller.dart';
import 'package:herdrobe_app/app/utils/app_colors.dart';
import 'package:herdrobe_app/app/utils/app_icons.dart';
import 'package:herdrobe_app/app/utils/my_utils.dart';
import 'package:herdrobe_app/app/widgets/custom_text.dart';

class Categories extends GetView<HomeController> {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      child: ListView.separated(
        padding: kPadding36.left,
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        separatorBuilder: (context, index) => kPadding20.horizontalSpace,

        itemBuilder: (context, index) {
          if (index == 0) {
            return _buildItem(title: 'Category', icon: AppIcons.category);
          }
          return _buildItem(
            title: 'Category $index',
            image: MyUtils.getTempLink(),
          );
        },
      ),
    );
  }

  Column _buildItem({required String title, String? image, String? icon}) {
    return Column(
      children: [
        CircleAvatar(
          radius: 27.r,
          backgroundColor: AppColors.cardColor,
          backgroundImage: MyUtils.buildImageProvider(image),
          child:
              icon == null
                  ? null
                  : SvgPicture.asset(
                    icon,
                    color: AppColors.textColor2,
                    height: 24.h,
                    width: 24.w,
                  ),
        ),
        kPadding8.verticalSpace,
        CustomText.smaller(title),
      ],
    );
  }
}
