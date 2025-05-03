import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:herdrobe_app/app/constants/paddings.dart';
import 'package:herdrobe_app/app/data/extensions/double.dart';
import 'package:herdrobe_app/app/routes/app_pages.dart';
import 'package:herdrobe_app/app/utils/app_colors.dart';
import 'package:herdrobe_app/app/utils/app_icons.dart';
import 'package:herdrobe_app/app/utils/my_utils.dart';
import 'package:herdrobe_app/app/widgets/circle_button.dart';
import 'package:herdrobe_app/app/widgets/custom_image.dart';
import 'package:herdrobe_app/app/widgets/custom_text.dart';
import 'package:herdrobe_app/app/widgets/my_container.dart';
import 'package:herdrobe_app/app/widgets/my_list_tile.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.paddingOf(context).top;
    final iconSize = 20.w;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: topPadding + kPadding16.h,
          right: kPadding24.w,
          left: kPadding24.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyListTile(
              padding: kPadding16.all,
              border: BorderSide(color: AppColors.lightGrey, width: 0.5),
              leading: CustomImage.fromSize(
                MyUtils.getTempLink(),
                radius: 40.r,
                size: 56.w,
              ),
              verticalSpacing: 4.h,
              title: CustomText.boldHeading18(
                'Ibrahim Nisar',
                fontWeight: FontWeight.bold,
              ),
              subtitle: CustomText.small12(
                'roobye647@gmail.com',
                color: AppColors.textColor2,
              ),
              trailing: CircleButton(
                icon: AppIcons.logout,
                onTap: () {},
                iconColor: AppColors.black,
                radius: 25.r,
              ),
            ),
            16.verticalSpace,
            MyContainer(
              padding: kPadding24.all,
              border: BorderSide(color: AppColors.lightGrey, width: 0.5),
              child: Column(
                spacing: 28.h,
                children: [
                  _buildSettingButton(
                    title: 'Account',
                    path: AppIcons.profileUser,
                    onTap: () {
                      Get.toNamed(Routes.ACCOUNT);
                    },
                  ),
                  _buildSettingButton(
                    title: 'Your Ad',
                    path: AppIcons.profileUser,
                    onTap: () {
                      Get.toNamed(Routes.YOUR_POST);
                    },
                  ),
                  _buildSettingButton(
                    title: 'Whishlist',
                    path: AppIcons.heart,
                    onTap: () {
                      Get.toNamed(Routes.WHISHLIST);
                    },
                  ),
                ],
              ),
            ),
            16.verticalSpace,
            CustomText.boldParagraph('Other'),
            16.verticalSpace,
            MyContainer(
              padding: kPadding24.all,
              border: BorderSide(color: AppColors.lightGrey, width: 0.5),
              child: Column(
                spacing: 28.h,
                children: [
                  _buildSettingButton(
                    title: 'Customer Support',
                    path: AppIcons.support,
                  ),
                  _buildSettingButton(
                    title: 'FAQs',
                    path: AppIcons.faqs,
                    onTap: () {},
                  ),
                  _buildSettingButton(
                    title: 'Privacy Policy',
                    path: AppIcons.document,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  MyListTile _buildSettingButton({
    required String path,
    required String title,
    Function()? onTap,
  }) {
    return MyListTile(
      title: CustomText.paragraph(title, color: AppColors.textColor1),
      leading: CustomImage.fromSize(
        path,
        size: 20.sp,
        color: AppColors.black,
        fit: BoxFit.contain,
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 16.sp,
        color: AppColors.textColor2,
      ),
      onTap: onTap,
    );
  }
}
