import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:herdrobe_app/app/constants/paddings.dart';
import 'package:herdrobe_app/app/data/extensions/double.dart';
import 'package:herdrobe_app/app/data/extensions/widget.dart';
import 'package:herdrobe_app/app/routes/app_pages.dart';
import 'package:herdrobe_app/app/utils/app_colors.dart';
import 'package:herdrobe_app/app/utils/app_icons.dart';
import 'package:herdrobe_app/app/utils/my_utils.dart';
import 'package:herdrobe_app/app/widgets/custom_image.dart';
import 'package:herdrobe_app/app/widgets/custom_text.dart';
import 'package:herdrobe_app/app/widgets/my_container.dart';
import 'package:herdrobe_app/app/widgets/my_list_tile.dart';

class SupportCard extends StatelessWidget {
  const SupportCard({super.key});

  @override
  Widget build(BuildContext context) {
    return MyContainer(
      onTap: () => Get.toNamed(Routes.SELLER_DETAILS),
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
            title: CustomText.smallBold12('Savannah Nguyed'),
            verticalSpacing: 4.h,
            subtitle: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 8.h,
              children: [
                CustomText.smaller('23 july, 2025 1:00 pm'),
                StatusCard(status: 'Pending', color: AppColors.errorColor),
              ],
            ),
            trailing: Row(
              spacing: 6.w,
              children: [
                CustomText.small12('View Profile', color: AppColors.blue),
                CustomImage.fromSize(
                  AppIcons.arrowUpRight,
                  size: 10.sp,
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText.small12('Subject:'),
                12.horizontalSpace,
                Expanded(child: CustomText.small12('Cart System not working')),
              ],
            ),
          ),
          16.verticalSpace,
        ],
      ),
    ).boxShadow();
  }
}

class StatusCard extends StatelessWidget {
  const StatusCard({super.key, required this.status, required this.color});
  final String status;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return MyContainer(
      radius: 4.r,
      padding: EdgeInsets.symmetric(
        vertical: kPadding4.h,
        horizontal: kPadding8.w,
      ),
      child: CustomText.smaller(status, color: color),
      color: color.withOpacity(0.1),
    );
  }
}
