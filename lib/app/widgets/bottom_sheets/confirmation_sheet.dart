import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:herdrobe_app/app/utils/app_colors.dart';
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
  });
  final Function()? onCancelTap;
  final Function()? onConfirmTap;
  final String? title;
  final String? message;
  final String? confirmBtnText;
  final String? cancelBtnText;

  @override
  Widget build(BuildContext context) {
    return GenericBottomSheet(
      body: Column(
        children: [
          CustomText.mediumHeading(
            title ?? 'Are you sure?',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          CustomText.paragraph(
            message ?? 'This action cannot be undone',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: RoundedButton(
                  onTap: onCancelTap ?? () => Get.back(),
                  cancelBtnText ?? 'Cancel',
                  backgroundColor: AppColors.white,
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
