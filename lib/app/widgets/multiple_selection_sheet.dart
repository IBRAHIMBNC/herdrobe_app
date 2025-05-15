import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:herdrobe_app/app/constants/paddings.dart';
import 'package:herdrobe_app/app/data/extensions/enum.dart';
import 'package:herdrobe_app/app/utils/app_colors.dart';
import 'package:herdrobe_app/app/widgets/custom_text.dart';
import 'package:herdrobe_app/app/widgets/generic_bottom_sheet.dart';
import 'package:herdrobe_app/app/widgets/my_container.dart';
import 'package:herdrobe_app/app/widgets/my_rounded_button.dart';

class MultipleOptionSheet<T extends Enum> extends StatelessWidget {
  const MultipleOptionSheet({super.key, required this.items, this.title});
  final List<T> items;
  final String? title;

  @override
  Widget build(BuildContext context) {
    final selectedItems = RxList<T>([]);

    return GenericBottomSheet(
      body: Obx(
        () => Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                8.horizontalSpace,
                InkWell(
                  child: Icon(
                    Icons.close,
                    color: AppColors.textColor2,
                    size: 22.sp,
                  ),
                  onTap: () => Get.back(),
                ),
                16.horizontalSpace,
                Expanded(
                  child: CustomText.mediumHeading(
                    title ?? 'Select Options',
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                TextButton(
                  onPressed: () {
                    selectedItems.clear();
                  },
                  child: CustomText('Clear All'),
                ),
              ],
            ),
            16.verticalSpace,
            ...items.map((item) {
              final isSelected = selectedItems.contains(item);
              return MyContainer(
                radius: 8.r,
                color: isSelected ? AppColors.white : AppColors.cardColor,
                onTap: () {
                  if (selectedItems.contains(item)) {
                    selectedItems.remove(item);
                  } else {
                    selectedItems.add(item);
                  }
                },
                margin: EdgeInsets.only(bottom: kPadding8.h),
                padding: EdgeInsets.symmetric(
                  horizontal: kPadding16.w,
                  vertical: kPadding12.h,
                ),
                alignment: Alignment.centerLeft,
                border: BorderSide(
                  color: isSelected ? AppColors.brand : Colors.transparent,
                  width: 1,
                ),

                child: CustomText.paragraph(item.capitalizeFirst),
              );
            }).toList(),
            16.verticalSpace,
            RoundedButton.filledMedium(
              'Done',
              onTap: () {
                Get.back(result: selectedItems);
              },
            ),
          ],
        ),
      ),
    );
  }
}

showMulitpleSelectionSheet<T extends Enum>({
  required String title,
  required List<T> items,
}) {
  return Get.bottomSheet<List<T>?>(
    MultipleOptionSheet<T>(items: items),
    isScrollControlled: true,
  );
}
