import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:herdrobe_app/app/constants/paddings.dart';
import 'package:herdrobe_app/app/data/extensions/double.dart';
import 'package:herdrobe_app/app/routes/app_pages.dart';
import 'package:herdrobe_app/app/utils/app_colors.dart';
import 'package:herdrobe_app/app/utils/app_icons.dart';
import 'package:herdrobe_app/app/utils/app_text_styles.dart';
import 'package:herdrobe_app/app/widgets/custom_text.dart';
import 'package:herdrobe_app/app/widgets/custom_text_field.dart';
import 'package:herdrobe_app/app/widgets/multi_color_title.dart';
import 'package:herdrobe_app/app/widgets/my_appbar.dart';
import 'package:herdrobe_app/app/widgets/my_container.dart';
import 'package:herdrobe_app/app/widgets/my_rounded_button.dart';
import 'package:smooth_corner/smooth_corner.dart';

import '../controllers/profile_completion_controller.dart';

class ProfileCompletionView extends GetView<ProfileCompletionController> {
  const ProfileCompletionView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: kPadding20.hp,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.verticalSpace,
              MultiColorTitle(
                titles: [
                  MultiColorTitleModel('Profile', color: AppColors.brand),
                  MultiColorTitleModel(' Completion'),
                ],
              ),
              8.verticalSpace,
              CustomText.paragraph(
                'Gathering Vital Information for users to know you better.',
                color: AppColors.textColor2,
              ),
              24.verticalSpace,
              CircleAvatar(
                backgroundColor: AppColors.textField,
                radius: 50.r,
                child: SvgPicture.asset(
                  AppIcons.userFilled,
                  color: AppColors.textColor2,
                  height: 50.h,
                  width: 50.w,
                ),
              ),
              24.verticalSpace,
              CustomText.paragraph('User Type'),
              8.verticalSpace,

              CustomTabbar(
                tabController: controller.tabController,
                tabs: [
                  Tab(text: 'Buyer'),
                  Tab(text: 'Seller'),
                  Tab(text: 'Both'),
                ],
                onTabChanged: (index) {
                  // controller.selectedIndex.value = index;
                },
              ),
              24.verticalSpace,
              CustomTextField(
                prefixIcon: AppIcons.map,
                hinText: 'Location',
                textInputAction: TextInputAction.next,
              ),
              16.verticalSpace,
              CustomTextField(
                prefixIcon: AppIcons.cnic,
                hinText: 'CNIC (Optional)',
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: kPadding24.all,
        child: RoundedButton(
          'SignUp',
          onTap: () {
            Get.toNamed(Routes.WELCOME);
          },
        ),
      ),
    );
  }
}

class CustomTabbar extends StatelessWidget {
  const CustomTabbar({
    super.key,
    required this.tabs,
    required this.tabController,
    this.onTabChanged,
  });

  final List<Tab> tabs;
  final TabController tabController;
  final Function(int)? onTabChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.h,
      decoration: ShapeDecoration(
        color: AppColors.textField,
        shape: SmoothRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      ),
      padding: EdgeInsets.all(4.r),
      child: TabBar(
        labelColor: AppColors.brand,
        labelStyle: AppTextStyles.paragraph14,
        unselectedLabelColor: AppColors.textColor1,
        dividerColor: Colors.transparent,
        padding: EdgeInsets.zero,
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: ShapeDecoration(
          shape: SmoothRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          color: AppColors.white,
        ),
        indicatorColor: Colors.white,
        tabs: tabs,
        controller: tabController,
        onTap: onTabChanged,
      ),
    );
  }
}
