import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:herdrobe_app/app/constants/paddings.dart';
import 'package:herdrobe_app/app/data/extensions/double.dart';
import 'package:herdrobe_app/app/modules/addEditPost/controllers/add_edit_post_controller.dart';
import 'package:herdrobe_app/app/utils/app_colors.dart';
import 'package:herdrobe_app/app/widgets/circle_button.dart';
import 'package:herdrobe_app/app/widgets/custom_image.dart';
import 'package:herdrobe_app/app/widgets/custom_text.dart';
import 'package:herdrobe_app/app/widgets/my_container.dart';

class UploadPhotos extends GetView<AddEditPostController> {
  const UploadPhotos({super.key});

  @override
  Widget build(BuildContext context) {
    if (controller.images.isNotEmpty) {
      return Wrap(
        alignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.start,
        spacing: kPadding8.w,
        runSpacing: kPadding8.h,
        children: List.generate(controller.images.length + 1, (index) {
          if (index == controller.images.length) {
            return MyContainer(
              onTap: () => controller.pickImages(),
              radius: 12.r,
              height: 100.w,
              width: 100.w,
              padding: kPadding8.all,
              color: AppColors.cardColor,
              child: Icon(Icons.add, color: AppColors.brand, size: 32.sp),
            );
          }
          final String path = controller.images[index];
          return Padding(
            padding: EdgeInsets.only(right: kPadding8.w, bottom: kPadding8.h),
            child: CustomImage.fromSize(
              path,
              size: 100.w,
              radius: 12.r,
              child: Align(
                alignment: Alignment.topRight,
                child: CircleButton(
                  icon: Icon(Icons.close, color: AppColors.black, size: 16.sp),
                  radius: 12.r,
                  onTap: () {
                    controller.images.removeAt(index);
                    controller.update();
                  },
                ),
              ),
            ),
          );
        }),
      );
    }
    return MyContainer(
      onTap: () => controller.pickImages(),
      radius: 10.r,
      padding: kPadding8.all,
      border: BorderSide(color: Colors.grey.shade300, width: 1),
      child: Row(
        children: [
          MyContainer(
            color: AppColors.brand,
            radius: 8.r,
            padding: EdgeInsets.symmetric(
              horizontal: kPadding20.w,
              vertical: kPadding12.h,
            ),
            child: CustomText('Upload Photos', color: AppColors.white),
          ),
          16.horizontalSpace,
          CustomText('No photos selected', color: AppColors.textColor2),
        ],
      ),
    );
  }
}
