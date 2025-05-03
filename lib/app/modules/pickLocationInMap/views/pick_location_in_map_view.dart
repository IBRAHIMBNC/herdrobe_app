import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:herdrobe_app/app/constants/paddings.dart';
import 'package:herdrobe_app/app/data/extensions/double.dart';
import 'package:herdrobe_app/app/utils/app_colors.dart';
import 'package:herdrobe_app/app/utils/app_icons.dart';
import 'package:herdrobe_app/app/widgets/custom_text.dart';
import 'package:herdrobe_app/app/widgets/custom_text_field.dart';
import 'package:herdrobe_app/app/widgets/generic_bottom_sheet.dart';
import 'package:herdrobe_app/app/widgets/my_appbar.dart';
import 'package:herdrobe_app/app/widgets/my_container.dart';
import 'package:herdrobe_app/app/widgets/my_rounded_button.dart';

import '../controllers/pick_location_in_map_controller.dart';

class PickLocationInMapView extends GetView<PickLocationInMapController> {
  const PickLocationInMapView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.lightGrey,
      appBar: MyAppBar(backgroundColor: Colors.transparent),
      body: const Center(
        child: Text(
          'PickLocationInMapView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
      bottomNavigationBar: MyContainer(
        padding: kPadding24.all,
        radius: BorderRadius.vertical(top: Radius.circular(24.r)),
        color: AppColors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomText.boldHeading26('Select location'),

            CustomText.paragraph('Pick your location for fast meal delivery.'),
            24.verticalSpace,
            CustomTextField(
              prefixIcon: AppIcons.search,
              hinText: 'Search here...',
            ),
            24.verticalSpace,
            RoundedButton('Save'),
          ],
        ),
      ),
    );
  }
}
