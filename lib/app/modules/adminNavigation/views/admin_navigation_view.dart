import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:herdrobe_app/app/constants/paddings.dart';
import 'package:herdrobe_app/app/data/enums/admin_sections.dart';
import 'package:herdrobe_app/app/data/extensions/double.dart';
import 'package:herdrobe_app/app/modules/adminDashboard/views/admin_dashboard_view.dart';
import 'package:herdrobe_app/app/utils/app_colors.dart';
import 'package:herdrobe_app/app/utils/my_utils.dart';
import 'package:herdrobe_app/app/widgets/custom_image.dart';
import 'package:herdrobe_app/app/widgets/custom_text.dart';
import 'package:herdrobe_app/app/widgets/my_list_tile.dart';

import '../controllers/admin_navigation_controller.dart';

final GlobalKey<ScaffoldState> adminNavigationScafoldKey =
    GlobalKey<ScaffoldState>();

class AdminNavigationView extends GetView<AdminNavigationController> {
  const AdminNavigationView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdminNavigationController>(
      builder:
          (controller) => Scaffold(
            key: adminNavigationScafoldKey,
            drawer: Drawer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  100.verticalSpace,
                  MyListTile(
                    radius: 0,
                    padding: EdgeInsets.symmetric(
                      horizontal: kPadding24.w,
                      vertical: kPadding12.h,
                    ),
                    color: AppColors.cardColor,
                    leading: CustomImage.cirlce(
                      MyUtils.getTempLink(),
                      size: 40.sp,
                    ),
                    title: CustomText.smallHeading16('Admin'),
                    subtitle: CustomText.smaller('moragan135@gmail.com'),
                    trailing: Icon(
                      Icons.chevron_right,
                      color: AppColors.textColor2,
                      size: 30.sp,
                    ),
                  ),
                  44.verticalSpace,
                  Padding(
                    padding: kPadding24.hp,
                    child: SelectableContainers<AdminSections>(
                      sections: AdminSections.values,
                      currentValue: controller.selectedSection,
                      onChanged: (value) {
                        controller.selectedSection = value;
                        Get.back();
                      },
                    ),
                  ),
                ],
              ),
            ),

            body: controller.selectedPage,
          ),
    );
  }
}
