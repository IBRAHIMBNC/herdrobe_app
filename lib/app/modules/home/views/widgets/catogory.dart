import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/state_manager.dart';
import 'package:herdrobe_app/app/constants/paddings.dart';
import 'package:herdrobe_app/app/data/extensions/double.dart';
import 'package:herdrobe_app/app/modules/home/controllers/home_controller.dart';
import 'package:herdrobe_app/app/utils/app_colors.dart';
import 'package:herdrobe_app/app/utils/app_icons.dart';
import 'package:herdrobe_app/app/utils/my_utils.dart';
import 'package:herdrobe_app/app/widgets/custom_image.dart';
import 'package:herdrobe_app/app/widgets/custom_text.dart';
import 'package:herdrobe_app/app/widgets/my_container.dart';

class Categories extends GetView<HomeController> {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      child: Row(
        children: [
          Expanded(
            child: ListView.separated(
              padding: kPadding36.left,
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              separatorBuilder: (context, index) => kPadding20.horizontalSpace,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return _buildItem(
                    title: 'Categories',
                    image: AppIcons.category,
                    index: 0,
                  );
                }
                return _buildItem(
                  title: 'Category $index',
                  image: MyUtils.getTempLink(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItem({required String title, String? image, int? index}) {
    if (image == null) {
      return const SizedBox();
    }
    if (index == 0) {
      return Column(
        children: [
          CircleAvatar(
            child: CustomImage.fromSize(image, size: 30.sp, radius: 50.r),
            backgroundColor: AppColors.cardColor,
            radius: 25.r,
          ),
          kPadding8.verticalSpace,
          CustomText.smaller(title),
        ],
      );
    }
    return Column(
      children: [
        CustomImage.fromSize(image, size: 50.sp, radius: 50.r),
        kPadding8.verticalSpace,
        CustomText.smaller(title),
      ],
    );
  }
}
