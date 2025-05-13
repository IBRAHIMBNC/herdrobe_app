import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:herdrobe_app/app/utils/app_colors.dart';
import 'package:herdrobe_app/app/widgets/custom_image.dart';
import 'package:herdrobe_app/app/widgets/custom_text.dart';
import 'package:herdrobe_app/app/widgets/generic_bottom_sheet.dart';
import 'package:herdrobe_app/app/widgets/my_rounded_button.dart';

class ConfirmationSheet extends StatelessWidget {
  const ConfirmationSheet({
    super.key,
    this.onCancelTap,
    this.onConfirmTap,
    this.title,
    this.message,
    this.confirmBtnText,
    this.cancelBtnText,
    this.imagePath,
    this.size,
    this.titlePadding,
    this.iconColor = AppColors.brand,
  });
  final Function()? onCancelTap;
  final Function()? onConfirmTap;
  final String? title;
  final String? message;
  final String? confirmBtnText;
  final String? cancelBtnText;
  final String? imagePath;
  final double? size;
  final EdgeInsetsGeometry? titlePadding;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return GenericBottomSheet(
      body: Column(
        children: [
          if (imagePath != null)
            CustomImage.fromSize(
              imagePath!,
              size: size ?? 80.sp,
              fit: BoxFit.contain,
              color: iconColor,
            ),

          Padding(
            padding: titlePadding ?? EdgeInsets.zero,
            child: CustomText.mediumHeading(
              title ?? 'Are you sure?',
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          if (message != null)
            CustomText.paragraph(
              message!,
              textAlign: TextAlign.center,
              color: AppColors.textColor2,
            ),

          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: RoundedButton(
                  onTap: onCancelTap ?? () => Get.back(),
                  cancelBtnText ?? 'Cancel',
                  backgroundColor: AppColors.cardColor,
                  fontWeight: FontWeight.w600,
                  fontColor: AppColors.textColor1,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: RoundedButton(
                  onTap: onConfirmTap,
                  confirmBtnText ?? 'Confirm',
                  fontColor: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
