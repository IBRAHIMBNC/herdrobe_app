import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:herdrobe_app/app/constants/paddings.dart';
import 'package:herdrobe_app/app/data/extensions/double.dart';
import 'package:herdrobe_app/app/data/extensions/widget.dart';
import 'package:herdrobe_app/app/utils/app_colors.dart';
import 'package:herdrobe_app/app/utils/app_icons.dart';
import 'package:herdrobe_app/app/utils/my_utils.dart';
import 'package:herdrobe_app/app/widgets/custom_image.dart';
import 'package:herdrobe_app/app/widgets/custom_text.dart';
import 'package:herdrobe_app/app/widgets/my_container.dart';
import 'package:herdrobe_app/app/widgets/my_list_tile.dart';

class UserDetailsCard extends StatelessWidget {
  const UserDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return MyContainer(
      padding: kPadding16.hp,
      border: BorderSide(color: AppColors.black5, width: 1.w),
      child: Column(
        children: [
          MyListTile(
            padding: kPadding12.vp,
            horizontalSpacing: 8.w,
            leading: CircleAvatar(
              radius: 23.r,
              backgroundColor: AppColors.brand,
              child: CustomImage.fromSize(
                MyUtils.getTempLink(),
                size: 43.sp,
                radius: 100.r,
                fit: BoxFit.cover,
              ),
            ),
            title: Row(
              children: [
                CustomImage(
                  AppIcons.starFilled,
                  height: 14.h,
                  width: 14.w,
                  fit: BoxFit.cover,
                ),
                4.horizontalSpace,
                CustomText.smaller('4.9'),
                4.horizontalSpace,
                CustomText.smaller('(10)', color: AppColors.textColor2),
              ],
            ),
            verticalSpacing: 4.h,
            subtitle: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 4.h,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 5,
                      child: CustomText.smallBold12('Savannah Nguyed'),
                    ),
                    _buildVerticalDivider(),
                    CustomText.smaller('Buyer', color: AppColors.darkBlue),
                    Spacer(),
                  ],
                ),
                CustomText.smaller('4517 Washington Ave. Manchester'),
              ],
            ),
            trailing: Row(
              spacing: 4.w,
              children: [
                CustomText.smaller('View Detail', color: AppColors.blue),
                CustomImage.fromSize(
                  AppIcons.arrowUpRight,
                  size: 8.sp,
                  color: AppColors.blue,
                ),
              ],
            ),
          ),
          MyContainer(
            padding: EdgeInsets.symmetric(
              vertical: kPadding8.h,
              horizontal: kPadding16.w,
            ),
            color: AppColors.cardColor,
            radius: 50.r,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomImage.fromSize(
                  AppIcons.email,
                  size: 16.sp,
                  color: Colors.black,
                ),
                8.horizontalSpace,
                CustomText.smaller('SavaNguyen@gmail.com'),
                _buildVerticalDivider(),
                CustomImage.fromSize(
                  AppIcons.phone,
                  size: 16.sp,
                  color: Colors.black,
                ),
                8.horizontalSpace,
                CustomText.smaller('0345 65 43 234'),
              ],
            ),
          ),
          16.verticalSpace,
        ],
      ),
    ).boxShadow();
  }

  SizedBox _buildVerticalDivider() {
    return SizedBox(
      height: 12.h,
      child: VerticalDivider(color: AppColors.lightGrey, thickness: 1.w),
    );
  }
}
