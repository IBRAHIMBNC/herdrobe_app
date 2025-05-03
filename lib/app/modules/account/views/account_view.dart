import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:herdrobe_app/app/constants/paddings.dart';
import 'package:herdrobe_app/app/data/extensions/double.dart';
import 'package:herdrobe_app/app/routes/app_pages.dart';
import 'package:herdrobe_app/app/utils/app_colors.dart';
import 'package:herdrobe_app/app/utils/app_icons.dart';
import 'package:herdrobe_app/app/utils/my_utils.dart';
import 'package:herdrobe_app/app/widgets/custom_image.dart';
import 'package:herdrobe_app/app/widgets/custom_text.dart';
import 'package:herdrobe_app/app/widgets/my_appbar.dart';
import 'package:herdrobe_app/app/widgets/my_container.dart';
import 'package:herdrobe_app/app/widgets/my_list_tile.dart';

import '../controllers/account_controller.dart';

class AccountView extends GetView<AccountController> {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Account'),
      body: Container(
        width: double.infinity,
        padding: kPadding24.hp,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            32.verticalSpace,
            Align(child: _buildProfilePicture(MyUtils.getTempLink(), () {})),
            16.verticalSpace,

            MyContainer(
              radius: 16.r,
              border: BorderSide(color: AppColors.black.withOpacity(0.05)),
              padding: kPadding16.all,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText.smallHeading16('Account Info'),
                  16.verticalSpace,
                  _buildAccountInfoContainer(
                    title: 'User Name',
                    value: 'Ibrahim Nisar',
                    onTap: () {},
                  ),
                  16.verticalSpace,
                  _buildAccountInfoContainer(
                    title: 'Email',
                    value: 'lovedose114@gmail.com',
                  ),
                ],
              ),
            ),
            16.verticalSpace,
            MyContainer(
              padding: kPadding20.all,
              border: BorderSide(color: AppColors.black.withOpacity(0.05)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText.smallHeading16('Account Management'),
                  24.verticalSpace,
                  _buildSettingButton(
                    path: AppIcons.lock,
                    title: 'Change Password',
                    onTap: () {
                      Get.toNamed(Routes.CHANGE_PASSWORD);
                    },
                  ),
                  24.verticalSpace,
                  _buildSettingButton(
                    path: AppIcons.document,
                    title: 'Delete Account',
                    onTap: () {
                      Get.toNamed(Routes.DELETE_ACCOUNT);
                    },
                  ),
                  12.verticalSpace,
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
        color: AppColors.lightGrey,
      ),
      onTap: onTap,
    );
  }

  MyContainer _buildAccountInfoContainer({
    required String title,
    required String value,
    Function()? onTap,
  }) {
    return MyContainer(
      onTap: onTap,
      radius: 10.r,
      padding: kPadding20.all,
      color: AppColors.cardColor,
      // shadow: kSTransparentShadow,
      border: BorderSide(color: AppColors.black.withOpacity(0.05)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText.small12(title, color: AppColors.textColor2),
          12.horizontalSpace,
          Expanded(
            child: CustomText.paragraph(value, textAlign: TextAlign.end),
          ),
          if (onTap != null) ...[
            12.horizontalSpace,
            SvgPicture.asset(AppIcons.edit),
          ],
        ],
      ),
    );
  }

  Stack _buildProfilePicture(String? imageUrl, Function()? onTap) {
    return Stack(
      alignment: Alignment.center,
      children: [
        MyContainer(
          padding: 2.0.all,
          radius: 150.r,
          color: AppColors.brand,
          child: MyContainer(
            height: 112.r,
            width: 112.r,
            radius: 150.r,
            color: AppColors.white,
            child: Icon(
              CupertinoIcons.person_fill,
              size: 60.sp,
              color: AppColors.grey,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 10,
          child: CircleAvatar(
            radius: 15.r,
            backgroundColor: AppColors.brand,
            child: SvgPicture.asset(
              AppIcons.edit,
              height: 15.sp,
              color: AppColors.white,
            ),
          ),
        ),
      ],
    );
  }
}
