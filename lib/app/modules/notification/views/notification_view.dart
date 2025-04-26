import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:herdrobe_app/app/constants/paddings.dart';
import 'package:herdrobe_app/app/data/extensions/double.dart';
import 'package:herdrobe_app/app/utils/app_colors.dart';
import 'package:herdrobe_app/app/utils/app_icons.dart';
import 'package:herdrobe_app/app/widgets/custom_image.dart';
import 'package:herdrobe_app/app/widgets/custom_text.dart';
import 'package:herdrobe_app/app/widgets/my_appbar.dart';
import 'package:herdrobe_app/app/widgets/my_list_tile.dart';

import '../controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Notifications'),
      body: ListView.separated(
        padding: kPadding24.all,
        itemCount: 10,
        separatorBuilder: (context, index) {
          if (index == 0) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Divider(color: AppColors.black.withOpacity(0.1), height: 20),
                12.verticalSpace,
                Padding(
                  padding: kPadding16.bottom,
                  child: CustomText.smallHeading16('Old'),
                ),
              ],
            );
          }
          return Divider(color: AppColors.black.withOpacity(0.1), height: 20);
        },
        itemBuilder: (context, index) {
          return _buildNotificationCard();
        },
      ),
    );
  }

  MyListTile _buildNotificationCard() {
    return MyListTile(
      crossAxisAlignment: CrossAxisAlignment.start,
      leading: CircleAvatar(
        backgroundColor: AppColors.cardColor,
        child: CustomImage.fromSize(
          AppIcons.bell,
          size: 16.sp,
          color: AppColors.black,
        ),
      ),
      title: 'Order Confirmation!',
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          4.verticalSpace,
          CustomText.small12(
            'Thank you for your purchase! Your order #6674 is confirmed. Track it in My Orders.',
          ),
          4.verticalSpace,
          CustomText.small12('Order Date: 2023-10-01', color: Colors.grey),
        ],
      ),
    );
  }
}
