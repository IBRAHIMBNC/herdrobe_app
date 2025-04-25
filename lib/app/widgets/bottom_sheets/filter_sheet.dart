import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:herdrobe_app/app/constants/paddings.dart';
import 'package:herdrobe_app/app/modules/profileCompletion/views/profile_completion_view.dart';
import 'package:herdrobe_app/app/utils/app_colors.dart';
import 'package:herdrobe_app/app/widgets/address_details_card.dart';
import 'package:herdrobe_app/app/widgets/circle_button.dart';
import 'package:herdrobe_app/app/widgets/custom_text.dart';
import 'package:herdrobe_app/app/widgets/generic_bottom_sheet.dart';
import 'package:herdrobe_app/app/widgets/my_list_tile.dart';
import 'package:herdrobe_app/app/widgets/my_choice_chip.dart';
import 'package:herdrobe_app/app/widgets/my_container.dart';
import 'package:herdrobe_app/app/widgets/my_rounded_button.dart';

class SearchFilterSheet extends GetView<SearchController> {
  const SearchFilterSheet({super.key});
  @override
  Widget build(BuildContext context) {
    // Initialize range values with controller or with local state
    // RangeValues _currentRangeValues = const RangeValues(0, 1000);

    return GenericBottomSheet(
      body: DefaultTabController(
        length: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleButton(
                  onTap: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.close,
                    size: 26.r,
                    color: AppColors.textColor2,
                  ),
                  backgroundColor: Colors.transparent,
                ),
                CustomText.mediumHeading(
                  'Filters',
                  fontWeight: FontWeight.w600,
                ),

                GestureDetector(child: CustomText.small12('Clear All')),
              ],
            ),
            10.verticalSpace,
            Builder(
              builder: (ctx) {
                return CustomTabbar(
                  tabs: [Tab(text: 'Verified'), Tab(text: 'Unverified')],
                  tabController: DefaultTabController.of(ctx),
                );
              },
            ),
            16.verticalSpace,
            CustomText.paragraph('Type'),
            12.verticalSpace,
            Row(
              children: [
                MyChoiceChip(text: 'Sell', value: true),
                MyChoiceChip(text: 'Rent', value: false),
              ],
            ),
            16.verticalSpace,
            CustomText.paragraph('Categories'),
            12.verticalSpace,
            Wrap(
              spacing: 8.w,
              runSpacing: 10.h,
              children: [
                MyChoiceChip(text: 'women', value: true),
                MyChoiceChip(text: 'Men', value: false),
                MyChoiceChip(text: 'Kids', value: false),
                MyChoiceChip(text: 'Unisex', value: false),
                MyChoiceChip(text: 'Accessories', value: false),
              ],
            ),
            16.verticalSpace,
            CustomText.paragraph('Price Range'),

            RangeSlider(
              values: RangeValues(20, 500),
              min: 0,
              max: 2000,
              divisions: 20,
              activeColor: AppColors.brand,
              inactiveColor: AppColors.textColor2.withOpacity(0.3),
              labels: RangeLabels('\$${20.toInt()}', '\$${30.toInt()}'),
              onChanged: (RangeValues values) {
                // controller.priceRange.value = values;
              },
            ),
            4.verticalSpace,
            CustomText.paragraph('Selling Ratings'),
            12.verticalSpace,
            Row(
              children: [
                MyChoiceChip(text: '3+', value: true),
                MyChoiceChip(text: '4+', value: false),
                MyChoiceChip(text: '5+', value: false),
              ],
            ),
            16.verticalSpace,
            MyContainer(
              border: BorderSide(
                color: AppColors.black.withOpacity(0.1),
                width: 1,
              ),
              child: AddressDetailsCard(),
            ),
            16.verticalSpace,
            RoundedButton.filledMedium('Apply filter', onTap: () {}),
          ],
        ),
      ),
    );
  }
}
