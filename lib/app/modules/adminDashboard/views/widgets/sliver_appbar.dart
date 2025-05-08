import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:herdrobe_app/app/constants/paddings.dart';
import 'package:herdrobe_app/app/data/extensions/double.dart';
import 'package:herdrobe_app/app/modules/adminDashboard/controllers/admin_dashboard_controller.dart';
import 'package:herdrobe_app/app/modules/adminDashboard/views/widgets/stats_widget.dart';
import 'package:herdrobe_app/app/modules/adminNavigation/views/admin_navigation_view.dart';
import 'package:herdrobe_app/app/modules/home/views/home_view.dart';
import 'package:herdrobe_app/app/utils/app_colors.dart';
import 'package:herdrobe_app/app/utils/app_icons.dart';
import 'package:herdrobe_app/app/utils/my_utils.dart';
import 'package:herdrobe_app/app/widgets/circle_button.dart';
import 'package:herdrobe_app/app/widgets/custom_image.dart';
import 'package:herdrobe_app/app/widgets/custom_text.dart';
import 'package:herdrobe_app/app/widgets/my_container.dart';
import 'package:herdrobe_app/app/widgets/my_list_tile.dart';
import 'package:smooth_corner/smooth_corner.dart';

class AdminSliverAppbar extends StatelessWidget {
  const AdminSliverAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AdminDashboardController>();
    return SliverAppBar(
      onStretchTrigger: () async {
        controller.isAppBarCollapsed.value = false;
        // This is called when the app bar is stretched
        // You can perform any action here if needed
      },
      backgroundColor: AppColors.appBarGradient.colors.first,
      shape: SmoothRectangleBorder(
        smoothness: 1,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.r),
          bottomRight: Radius.circular(20.r),
        ),
      ),
      collapsedHeight:
          kToolbarHeight + 20, // The height of the app bar when it is collapsed
      expandedHeight:
          310.0 + kToolbarHeight, // Optional: if you want an expanded app bar
      floating:
          true, // The app bar will become visible as soon as you scroll up
      pinned: true, // The app bar will remain visible at the top
      snap: false, // Set to true if you want the app bar to snap into view
      leading: IconButton(
        icon: Icon(Icons.menu),
        color: AppColors.white,
        onPressed: () {
          adminNavigationScafoldKey.currentState?.openDrawer();
        },
      ),
      title: MyListTile(
        onTap: () {},
        crossAxisAlignment: CrossAxisAlignment.start,
        padding: kPadding16.right,
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
        title: CustomText.boldHeading18('Hi Morgan!', color: AppColors.white),
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

      titleSpacing: 0,
      centerTitle: false,
      // Optional: You can add a flexibleSpace for a more custom look
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        background: MyContainer(
          gradient: AppColors.appBarGradient,
          child: StatsWidget(), // Or any other widget
        ),
      ),
    );
  }
}
