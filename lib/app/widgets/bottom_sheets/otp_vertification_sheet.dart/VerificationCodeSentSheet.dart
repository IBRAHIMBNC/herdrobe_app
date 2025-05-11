import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:herdrobe_app/app/constants/paddings.dart';
import 'package:herdrobe_app/app/routes/app_pages.dart';
import 'package:herdrobe_app/app/utils/app_colors.dart';
import 'package:herdrobe_app/app/widgets/custom_text.dart';
import 'package:herdrobe_app/app/widgets/generic_bottom_sheet.dart';
import 'package:herdrobe_app/app/widgets/my_rounded_button.dart';
import 'package:herdrobe_app/app/widgets/otp_textfield.dart';

class OtpVerificationSheet extends StatelessWidget {
  const OtpVerificationSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return GenericBottomSheet(
      body: Column(
        children: [
          CustomText.mediumHeading('Verification code'),
          kPadding8.verticalSpace,
          CustomText.paragraph(
            'A verification code will be sent to your email',
            color: AppColors.textColor2,
          ),
          CustomText.paragraph('ibrahim@tentwenty.me', color: AppColors.brand),
          kPadding24.verticalSpace,
          OTPField(
            onCompleted: (otp) async {
              Get.back<bool>(result: true);
            },
          ),
          kPadding24.verticalSpace,
          CustomText.paragraph('00:56', color: AppColors.textColor1),
          kPadding4.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText.paragraph(
                'Didn\'t receive code?',
                color: AppColors.textColor2,
              ),
              kPadding8.horizontalSpace,
              InkWell(
                onTap: () {
                  // controller.resendCode();
                },
                child: CustomText.boldParagraph(
                  'Resend Code',
                  color: AppColors.brand,
                ),
              ),
            ],
          ),
          kPadding24.verticalSpace,
          Row(
            spacing: kPadding16.w,
            children: [
              Expanded(
                child: RoundedButton(
                  'Go Back',
                  backgroundColor: AppColors.textField,
                  fontColor: AppColors.textColor1,
                  fontWeight: FontWeight.w600,
                  onTap: () {
                    // controller.verifyCode();
                  },
                ),
              ),
              Expanded(
                child: RoundedButton(
                  'Open Email',
                  fontWeight: FontWeight.w600,
                  onTap: () {
                    // controller.verifyCode();
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
