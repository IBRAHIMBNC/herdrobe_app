import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:herdrobe_app/app/constants/paddings.dart';
import 'package:herdrobe_app/app/data/extensions/double.dart';
import 'package:herdrobe_app/app/modules/searchProduct/views/widgets/product_result_listing.dart';
import 'package:herdrobe_app/app/utils/app_colors.dart';
import 'package:herdrobe_app/app/utils/app_icons.dart';
import 'package:herdrobe_app/app/widgets/bottom_sheets/filter_sheet.dart';
import 'package:herdrobe_app/app/widgets/circle_button.dart';
import 'package:herdrobe_app/app/widgets/custom_text.dart';
import 'package:herdrobe_app/app/widgets/custom_text_field.dart';
import 'package:herdrobe_app/app/widgets/my_appbar.dart';
import 'package:herdrobe_app/app/widgets/my_container.dart';

import '../controllers/search_product_controller.dart';

class SearchProductView extends GetView<SearchProductController> {
  const SearchProductView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        height: 80.h,
        title: CustomTextField(
          onTap: () {},
          onChanged: controller.onStartSearch,
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
        actions: [
          CircleButton(
            onTap: () {
              Get.bottomSheet(SearchFilterSheet(), isScrollControlled: true);
            },
            icon: AppIcons.filter,
            radius: 24.r,
          ),
          20.horizontalSpace,
        ],
      ),
      body: GetBuilder<SearchProductController>(
        builder: (context) {
          return MyContainer(
            radius: 0,
            width: double.infinity,
            border: BorderSide(
              color: AppColors.black.withOpacity(0.1),
              width: 1,
            ),
            padding: kPadding24.hp,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (!controller.isSearching) ...[
                  16.verticalSpace,
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
                        padding: EdgeInsets.symmetric(
                          horizontal: kPadding16.w,
                          vertical: kPadding8.h,
                        ),
                        child: CustomText.small12(' Wool sweater $index'),
                      );
                    }),
                  ),
                ] else
                  Expanded(child: ProductResultListing()),
              ],
            ),
          );
        },
      ),
    );
  }
}
