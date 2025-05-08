import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:herdrobe_app/app/constants/paddings.dart';
import 'package:herdrobe_app/app/data/extensions/double.dart';
import 'package:herdrobe_app/app/data/extensions/widget.dart';
import 'package:herdrobe_app/app/modules/home/views/widgets/catogory.dart';
import 'package:herdrobe_app/app/modules/home/views/widgets/near_you_section.dart';
import 'package:herdrobe_app/app/modules/home/views/widgets/promotion_banner.dart';
import 'package:herdrobe_app/app/modules/home/views/widgets/recently_viewed_section.dart';
import 'package:herdrobe_app/app/routes/app_pages.dart';
import 'package:herdrobe_app/app/utils/app_colors.dart';
import 'package:herdrobe_app/app/utils/app_icons.dart';
import 'package:herdrobe_app/app/utils/my_utils.dart';
import 'package:herdrobe_app/app/widgets/circle_button.dart';
import 'package:herdrobe_app/app/widgets/custom_image.dart';
import 'package:herdrobe_app/app/widgets/custom_text.dart';
import 'package:herdrobe_app/app/widgets/custom_text_field.dart';
import 'package:herdrobe_app/app/widgets/generic_bottom_sheet.dart';
import 'package:herdrobe_app/app/widgets/my_list_tile.dart';
import 'package:herdrobe_app/app/widgets/my_container.dart';
import 'package:herdrobe_app/app/widgets/my_rounded_button.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                180.verticalSpace,
                PromotionBanner(),
                16.verticalSpace,
                16.verticalSpace,
                Categories(),
                16.verticalSpace,
                NearYouSection(),
                16.verticalSpace,
                RecentViewedSection(),
                16.verticalSpace,
              ],
            ),
          ),
          _buildAppBar(context),
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return SizedBox(
      height: 180.h,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: MyContainer(
              height: 151.h,
              radius: BorderRadius.vertical(bottom: Radius.circular(24.r)),
              padding: EdgeInsets.only(top: MediaQuery.paddingOf(context).top),
              gradient: AppColors.appBarGradient,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(
              children: [
                SizedBox(
                  height: 48.h,
                  child: MyListTile(
                    onTap: () {},
                    crossAxisAlignment: CrossAxisAlignment.start,
                    padding: kPadding24.hp,
                    horizontalSpacing: 10.w,
                    leading: CircleAvatar(
                      radius: 24.r,
                      backgroundColor: AppColors.white,
                      child: CustomImage.fromSize(
                        MyUtils.getTempLink(),
                        radius: 50.r,
                        size: 45.sp,

                        fit: BoxFit.cover,
                      ),
                    ),
                    title: CustomText.boldHeading18(
                      'Hi Morgan!',
                      color: AppColors.white,
                    ),
                    verticalSpacing: 4.h,
                    subtitle: CustomText.small12(
                      'Hope you will be doing great',
                      color: AppColors.white,
                    ),
                    trailing: CircleButton(
                      icon: AppIcons.bell,
                      onTap: () {
                        // Get.toNamed(Routes.NOTIFICATION);
                      },
                      backgroundColor: AppColors.white.withOpacity(0.2),
                      iconColor: AppColors.white,
                    ),
                  ),
                ),
                16.verticalSpace,
                Padding(
                  padding: kPadding24.hp,
                  child: SizedBox(
                    width: 1.sw, // Full width minus padding
                    child:
                        CustomTextField(
                          onTap: () {
                            Get.toNamed(Routes.SEARCH_PRODUCT);
                          },
                          bgColor: Colors.white,
                          borderRadius: 50.r,
                          hinText: 'Search here...',
                          verticalPadding: kPadding20.h,
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
                        ).boxShadow(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LoginAlertSheet extends StatelessWidget {
  const LoginAlertSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return GenericBottomSheet(
      body: Column(
        children: [
          CircleAvatar(
            radius: 50.r,
            backgroundColor: AppColors.lightGrey,
            child: CustomImage.fromSize(
              AppIcons.signinRequired,
              size: 45.sp,
              fit: BoxFit.contain,
            ),
          ),
          16.verticalSpace,
          CustomText.mediumHeading('Account Required!'),
          8.verticalSpace,
          CustomText.paragraph(
            'Please log in or register to proceed further.',
            color: AppColors.textColor2,
          ),

          16.verticalSpace,

          RoundedButton.filledMedium(
            'Login / Create Account',
            onTap: () {
              Get.toNamed(Routes.LOGIN);
            },
          ),
        ],
      ),
    );
  }
}
