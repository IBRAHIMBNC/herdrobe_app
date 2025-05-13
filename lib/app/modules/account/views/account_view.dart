import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:herdrobe_app/app/constants/paddings.dart';
import 'package:herdrobe_app/app/data/extensions/double.dart';
import 'package:herdrobe_app/app/modules/adminNavigation/views/admin_navigation_view.dart';
import 'package:herdrobe_app/app/routes/app_pages.dart';
import 'package:herdrobe_app/app/utils/app_colors.dart';
import 'package:herdrobe_app/app/utils/app_icons.dart';
import 'package:herdrobe_app/app/utils/my_utils.dart';
import 'package:herdrobe_app/app/widgets/bottom_sheets/edit_field_sheet.dart';
import 'package:herdrobe_app/app/widgets/circle_button.dart';
import 'package:herdrobe_app/app/widgets/custom_image.dart';
import 'package:herdrobe_app/app/widgets/custom_text.dart';
import 'package:herdrobe_app/app/widgets/custom_text_field.dart';
import 'package:herdrobe_app/app/widgets/generic_bottom_sheet.dart';
import 'package:herdrobe_app/app/widgets/my_appbar.dart';
import 'package:herdrobe_app/app/widgets/my_container.dart';
import 'package:herdrobe_app/app/widgets/my_list_tile.dart';
import 'package:herdrobe_app/app/widgets/my_rounded_button.dart';

import '../controllers/account_controller.dart';

class AccountView extends GetView<AccountController> {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AccountController>(
      builder:
          (controller) => Scaffold(
            appBar: MyAppBar(leading: _buildDrawerButton(), title: 'Account'),
            body: Container(
              width: double.infinity,
              padding: kPadding24.hp,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  32.verticalSpace,
                  Align(
                    child: _buildProfilePicture(
                      controller.currentUser?.imageUrl,
                      () {},
                    ),
                  ),
                  16.verticalSpace,

                  MyContainer(
                    radius: 16.r,
                    border: BorderSide(color: AppColors.black5),
                    padding: kPadding16.all,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText.smallHeading16('Account Info'),
                        16.verticalSpace,
                        _buildAccountInfoContainer(
                          title: 'Name',
                          value: controller.currentUser?.fullName ?? '',
                          onTap: controller.changeName,
                        ),
                        16.verticalSpace,
                        _buildAccountInfoContainer(
                          title: 'Email',
                          value: controller.currentUser?.email ?? '',
                        ),
                      ],
                    ),
                  ),
                  16.verticalSpace,
                  MyContainer(
                    padding: kPadding20.all,
                    border: BorderSide(color: AppColors.black5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText.smallHeading16('Account Management'),
                        24.verticalSpace,
                        _buildSettingButton(
                          iconPath: AppIcons.lock,
                          title: 'Change Password',
                          onTap: () {
                            Get.toNamed(Routes.CHANGE_PASSWORD);
                          },
                        ),
                        if (controller.isAdmin) ...[
                          24.verticalSpace,
                          _buildSettingButton(
                            iconPath: AppIcons.document,
                            title: 'Delete Account',
                            onTap: () {
                              Get.toNamed(Routes.DELETE_ACCOUNT);
                            },
                          ),
                        ],
                        12.verticalSpace,
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
    );
  }

  MyListTile _buildSettingButton({
    required String iconPath,
    required String title,
    Function()? onTap,
  }) {
    return MyListTile(
      title: CustomText.paragraph(title, color: AppColors.textColor1),
      leading: CustomImage.fromSize(
        iconPath,
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
      border: BorderSide(color: AppColors.black5),
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
          onTap: controller.changeProfile,
          padding: 2.0.all,
          radius: 150.r,
          color: AppColors.brand,
          child: CustomImage.fromSize(
            imageUrl ?? '',
            backgroundColor: AppColors.white,
            radius: 150.r,
            errorWidget: Icon(
              CupertinoIcons.person_fill,
              size: 60.sp,
              color: AppColors.grey,
            ),

            size: 112.r,
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

  _buildDrawerButton() {
    return !controller.isAdmin
        ? null
        : CircleButton(
          icon: Icon(Icons.menu, color: AppColors.black),
          onTap: () {
            adminNavigationScafoldKey.currentState?.openDrawer();
          },
        );
  }
}
