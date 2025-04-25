import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:herdrobe_app/app/modules/sellerDetails/controllers/seller_details_controller.dart';
import 'package:herdrobe_app/app/utils/app_colors.dart';
import 'package:herdrobe_app/app/utils/app_icons.dart';
import 'package:herdrobe_app/app/utils/my_utils.dart';
import 'package:herdrobe_app/app/widgets/circle_button.dart';
import 'package:herdrobe_app/app/widgets/custom_image.dart';
import 'package:herdrobe_app/app/widgets/custom_text.dart';
import 'package:herdrobe_app/app/widgets/my_container.dart';

class MySliverAppBar extends GetView<SellerDetailsController> {
  const MySliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 330.h, // Height when fully expanded
      floating: true, // App bar reappears as soon as you scroll down
      pinned: true, // App bar stays visible at the top when collapsed
      snap: false, // Set to true if you want the app bar to snap into view
      elevation: 0,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        background: Column(
          children: [
            CustomImage(
              MyUtils.getTempLink(),
              radius: 0,
              height: 200.h,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Expanded(
              child: Column(
                children: [
                  Align(
                    heightFactor: 0,
                    child: CircleAvatar(
                      backgroundColor: AppColors.brand,
                      radius: 45.r,
                    ),
                  ),
                  50.verticalSpace,
                  CustomText.boldParagraph('The groom house'),
                  4.verticalSpace,
                  CustomText.small12(
                    '03461599161',
                    color: AppColors.textColor2,
                  ),
                  MyContainer(
                    padding: EdgeInsets.symmetric(vertical: 24.h),
                    radius: 16.r,
                    child: Row(
                      children: [
                        Expanded(
                          child: _buildStatItem(
                            context,
                            showIcon: true,
                            title: 'Ratings',
                            value: "${4.9}",
                            secondValue: '(667)',
                          ),
                        ),
                        MyContainer(
                          height: 40.h,
                          width: 1.w,
                          color: AppColors.lightGrey,
                        ),
                        Expanded(
                          child: _buildStatItem(
                            context,
                            title: 'Products',
                            value: "${655}",
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ), // Content visible when expanded (replace with actual content)
        centerTitle: false,
      ),
      titleSpacing: 24.w,
      centerTitle: false,
      title: CircleButton(
        onTap: () {
          Get.back();
        },
        icon: const Icon(Icons.arrow_back, color: AppColors.black),
      ),
      automaticallyImplyLeading: false,
      scrolledUnderElevation: 6,
      shadowColor: Colors.black.withOpacity(0.2),
    );
  }

  _buildStatItem(
    BuildContext context, {
    required String title,
    required String value,
    String? secondValue,
    bool showIcon = false,
    bool leftAligned = false,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment:
          leftAligned ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (showIcon)
              CustomImage(
                AppIcons.starFilled,
                height: 18.h,
                width: 18.w,
                fit: BoxFit.cover,
              ),
            4.horizontalSpace,
            CustomText.smallHeading16(value),
            4.horizontalSpace,
            if (secondValue != null) CustomText.paragraph(secondValue),
          ],
        ),
        4.verticalSpace,
        CustomText.small12(title),
      ],
    );
  }
}
