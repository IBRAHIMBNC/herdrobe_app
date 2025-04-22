import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:herdrobe_app/app/constants/paddings.dart';
import 'package:herdrobe_app/app/extensions/double.dart';
import 'package:herdrobe_app/app/utils/app_colors.dart';
import 'package:herdrobe_app/app/utils/app_icons.dart';
import 'package:herdrobe_app/app/widgets/circle_button.dart';
import 'package:herdrobe_app/app/widgets/custom_text.dart';
import 'package:herdrobe_app/app/widgets/custom_text_field.dart';
import 'package:herdrobe_app/app/widgets/my_appbar.dart';
import 'package:herdrobe_app/app/widgets/my_container.dart';

class SearchView extends GetView<SearchController> {
  const SearchView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        height: 80.h,
        title: CustomTextField(
          onTap: () {},
          bgColor: Colors.white,
          borderRadius: 50.r,
          hinText: 'Search here...',
          verticalPadding: kPadding16.h,
          borderColor: AppColors.black.withOpacity(0.05),
          suffixWidget: Padding(
            padding: kPadding8.right,
            child: CircleButton(
              icon: AppIcons.search,
              onTap: () {},
              backgroundColor: AppColors.brand,
              iconColor: AppColors.white,
            ),
          ),
        ),
        actions: [24.horizontalSpace],
      ),
      body: MyContainer(
        radius: 0,
        border: BorderSide(color: AppColors.black.withOpacity(0.1), width: 1),
        padding: kPadding24.all,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset(AppIcons.recent),
                8.horizontalSpace,
                CustomText.boldParagraph('Recent searches'),
              ],
            ),
            16.verticalSpace,
            Wrap(
              spacing: 8.w,
              runSpacing: 10.h,
              children: List.generate(7, (index) {
                return MyContainer(
                  color: AppColors.cardColor,
                  radius: 30.r,
                  padding: REdgeInsets.symmetric(
                    horizontal: kPadding16.w,
                    vertical: kPadding8.h,
                  ),
                  child: CustomText.small12(' Wool sweater $index'),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
