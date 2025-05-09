import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:herdrobe_app/app/constants/paddings.dart';
import 'package:herdrobe_app/app/data/enums/admin_sections.dart';
import 'package:herdrobe_app/app/data/extensions/double.dart';
import 'package:herdrobe_app/app/data/extensions/enum.dart';
import 'package:herdrobe_app/app/data/extensions/widget.dart';
import 'package:herdrobe_app/app/modules/adminDashboard/views/widgets/sliver_appbar.dart';
import 'package:herdrobe_app/app/modules/adminDashboard/views/widgets/user_details_card.dart';
import 'package:herdrobe_app/app/routes/app_pages.dart';
import 'package:herdrobe_app/app/utils/app_colors.dart';
import 'package:herdrobe_app/app/utils/app_icons.dart';
import 'package:herdrobe_app/app/utils/app_text_styles.dart';
import 'package:herdrobe_app/app/utils/my_utils.dart';
import 'package:herdrobe_app/app/widgets/custom_image.dart';
import 'package:herdrobe_app/app/widgets/custom_text.dart';
import 'package:herdrobe_app/app/widgets/my_container.dart';
import 'package:herdrobe_app/app/widgets/my_list_tile.dart';
import 'package:herdrobe_app/app/widgets/product_details_card.dart';
import '../controllers/admin_dashboard_controller.dart';

class AdminDashboardView extends GetView<AdminDashboardController> {
  const AdminDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[AdminSliverAppbar()];
        },
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Padding(
            padding: kPadding24.hp,
            child: Column(
              children: [
                kPadding8.verticalSpace,
                _buildHeadingWidget(title: 'Recent listings', onPressed: () {}),
                ListView.separated(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  separatorBuilder:
                      (context, index) => kPadding12.verticalSpace,
                  itemBuilder: (context, index) {
                    return ProductDetailsCard.listTile().boxShadow();
                  },
                ),
                kPadding8.verticalSpace,
                _buildHeadingWidget(title: 'New Users', onPressed: () {}),
                ListView.separated(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  separatorBuilder: (context, index) => kPadding8.verticalSpace,
                  itemBuilder: (context, index) {
                    return UserDetailsCard();
                  },
                ),
                kPadding24.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row _buildHeadingWidget({
    required String title,
    required VoidCallback onPressed,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText.smallHeading16(title),
        TextButton.icon(
          iconAlignment: IconAlignment.end,
          onPressed: onPressed,
          label: CustomText.paragraph('View All'),
          icon: CustomImage.fromSize(AppIcons.arrowUpRight, size: 10.sp),
        ),
      ],
    );
  }
}
