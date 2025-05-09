import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:herdrobe_app/app/constants/paddings.dart';
import 'package:herdrobe_app/app/data/extensions/double.dart';
import 'package:herdrobe_app/app/modules/sellerDetails/controllers/seller_details_controller.dart';
import 'package:herdrobe_app/app/utils/app_colors.dart';
import 'package:herdrobe_app/app/utils/app_icons.dart';
import 'package:herdrobe_app/app/utils/my_utils.dart';
import 'package:herdrobe_app/app/widgets/circle_button.dart';
import 'package:herdrobe_app/app/widgets/custom_image.dart';
import 'package:herdrobe_app/app/widgets/custom_tabbar.dart';
import 'package:herdrobe_app/app/widgets/custom_text.dart';
import 'package:herdrobe_app/app/widgets/my_container.dart';
import 'package:herdrobe_app/app/widgets/my_rounded_button.dart';

class MySliverAppBar extends GetView<SellerDetailsController> {
  const MySliverAppBar({super.key, this.additionalExpandedHeight});
  final double? additionalExpandedHeight;

  @override
  Widget build(BuildContext context) {
    final bool isAdmin = Get.find<SellerDetailsController>().isAdmin;
    final expandedHeight =
        !isAdmin ? 350.h : (400.h + 60.h + (additionalExpandedHeight ?? 0));
    final collapsedHeight =
        isAdmin ? kToolbarHeight + 20.h : kToolbarHeight + 10.h;

    return SliverAppBar(
      expandedHeight: expandedHeight, // Height when fully expanded
      floating: true, // App bar reappears as soon as you scroll down
      pinned: true, // App bar stays visible at the top when collapsed
      snap: false, // Set to true if you want the app bar to snap into view
      elevation: 0,
      stretch: true,
      collapsedHeight: collapsedHeight,
      bottom: _buildTabBar(),
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        stretchModes: const [StretchMode.fadeTitle],
        background: Column(
          children: [
            CustomImage(
              MyUtils.getTempLink(),
              radius: 0,
              height: 220.h,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Expanded(
              child: Column(
                children: [
                  Align(
                    heightFactor: 0,
                    child: CustomImage.fromSize(
                      MyUtils.getTempLink(),
                      size: 90.w,
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
                    padding: EdgeInsets.symmetric(vertical: kPadding16.h),
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
                  if (isAdmin)
                    Padding(
                      padding: kPadding24.hp,
                      child: RoundedButton.outlinedMedium(
                        'Suspend',
                        onTap: () {},
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
        icon: Icon(CupertinoIcons.chevron_left, color: AppColors.black),
      ),
      automaticallyImplyLeading: false,
      scrolledUnderElevation: 6,
      shadowColor: AppColors.black20,
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

  _buildTabBar() {
    final bool isAdmin = Get.find<SellerDetailsController>().isAdmin;
    if (!isAdmin) return null;

    return PreferredSize(
      preferredSize: Size.fromHeight(55.h),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: kPadding24.w,
          vertical: kPadding12.h,
        ),
        child: CustomTabbar(
          tabController: controller.mainTabController,
          onTabChanged: (index) {
            controller.currentIndex.value = index;
          },
          tabs: [Tab(text: 'Personal Details'), Tab(text: 'Listings')],
        ),
      ),
    );
  }
}
