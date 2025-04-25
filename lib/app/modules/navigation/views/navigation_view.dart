import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:herdrobe_app/app/constants/paddings.dart';
import 'package:herdrobe_app/app/data/extensions/double.dart';
import 'package:herdrobe_app/app/utils/app_colors.dart';
import 'package:herdrobe_app/app/utils/app_icons.dart';
import 'package:herdrobe_app/app/utils/app_text_styles.dart';
import 'package:herdrobe_app/app/widgets/my_container.dart';
import '../controllers/navigation_controller.dart';

class NavigationView extends GetView<NavigationController> {
  const NavigationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        children: controller.pages,
      ),
      bottomNavigationBar: Obx(
        () => MyContainer(
          radius: 0,
          border: BorderSide(color: AppColors.lightGrey, width: 0.5),
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            currentIndex: controller.currentIndex.value,
            unselectedLabelStyle: AppTextStyles.smaller.copyWith(
              color: AppColors.lightGrey,
            ),
            selectedIconTheme: const IconThemeData(color: AppColors.brand),
            unselectedIconTheme: const IconThemeData(
              color: AppColors.lightGrey,
            ),
            selectedLabelStyle: AppTextStyles.smaller.copyWith(
              color: AppColors.brand,
              fontWeight: FontWeight.bold,
            ),
            useLegacyColorScheme: false,
            showSelectedLabels: controller.currentIndex.value != 2,
            showUnselectedLabels: false,
            onTap: controller.onTabChanged,
            items: [
              bottomNavigationBarItem(
                label: 'Home',
                icon: AppIcons.searchFilled,
              ),
              bottomNavigationBarItem(label: 'Orders', icon: AppIcons.orders),
              bottomNavigationBarItem(
                label: '',
                icon: CircleAvatar(
                  child: Icon(Icons.add),
                  radius: 26.r,
                  backgroundColor: AppColors.brand,
                ),
              ),
              bottomNavigationBarItem(label: 'Chat', icon: AppIcons.chat),
              bottomNavigationBarItem(
                label: 'Profile',
                icon: AppIcons.userFilled,
              ),
            ],
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem bottomNavigationBarItem({
    required dynamic icon,
    String? label,
  }) {
    final iconSize = 28.sp;
    if (icon is String) {
      final path = icon;
      final normalIcon = SvgPicture.asset(
        path,
        color: AppColors.lightGrey,
        height: iconSize,
        width: iconSize,
      );
      final activeIcon = Padding(
        padding: kPadding4.bottom,
        child: SvgPicture.asset(
          path,
          color: AppColors.brand,
          height: iconSize,
          width: iconSize,
        ),
      );
      return BottomNavigationBarItem(
        icon: normalIcon,
        activeIcon: activeIcon,
        label: label,
      );
    } else if (icon is Widget) {
      return BottomNavigationBarItem(icon: icon, label: label);
    } else {
      throw Exception('Invalid icon type');
    }
  }
}
