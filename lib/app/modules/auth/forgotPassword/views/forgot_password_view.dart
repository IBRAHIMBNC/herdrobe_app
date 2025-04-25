import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:herdrobe_app/app/constants/paddings.dart';
import 'package:herdrobe_app/app/data/extensions/double.dart';
import 'package:herdrobe_app/app/utils/app_colors.dart';
import 'package:herdrobe_app/app/utils/app_icons.dart';
import 'package:herdrobe_app/app/widgets/bottom_sheets/confirmation_sheet.dart';
import 'package:herdrobe_app/app/widgets/custom_text.dart';
import 'package:herdrobe_app/app/widgets/custom_text_field.dart';
import 'package:herdrobe_app/app/widgets/multi_color_title.dart';
import 'package:herdrobe_app/app/widgets/my_rounded_button.dart';

import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: kPadding24.hp,
        child: Column(
          children: [
            85.verticalSpace,
            MultiColorTitle(
              titles: [
                MultiColorTitleModel('Forget', color: AppColors.brand),
                MultiColorTitleModel(' Password', color: AppColors.textColor1),
              ],
            ),
            kPadding8.verticalSpace,
            CustomText.paragraph(
              'Please provide your registered email address to receive the verification email.',
              color: AppColors.textColor2,
              textAlign: TextAlign.center,
            ),
            kPadding40.verticalSpace,
            CustomTextField(
              prefixIcon: AppIcons.email,
              hinText: 'Enter you email',
            ),
            kPadding40.verticalSpace,
            RoundedButton('Continue', onTap: sendEmail),
            kPadding12.verticalSpace,
            TextButton.icon(
              onPressed: () {
                Get.back();
              },
              label: CustomText.boldParagraph(
                'Go Back',
                color: AppColors.brand,
              ),
              icon: Icon(Icons.arrow_back, color: AppColors.brand, size: 20.sp),
            ),
          ],
        ),
      ),
    );
  }

  sendEmail() {
    Get.bottomSheet(
      ConfirmationSheet(
        title: 'Password Reset Link Sent To Your Email',
        message:
            'Password reset link has been sent to your registered email address',
        confirmBtnText: 'Open Mail',
        cancelBtnText: 'Go Back',
        onConfirmTap: () {},
      ),
      isDismissible: false,
    );
  }
}
