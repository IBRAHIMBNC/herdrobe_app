import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:herdrobe_app/app/constants/paddings.dart';
import 'package:herdrobe_app/app/data/extensions/double.dart';
import 'package:herdrobe_app/app/utils/app_colors.dart';
import 'package:herdrobe_app/app/utils/app_icons.dart';
import 'package:herdrobe_app/app/utils/app_images.dart';
import 'package:herdrobe_app/app/utils/auth_validators.dart';
import 'package:herdrobe_app/app/widgets/bottom_sheets/otp_vertification_sheet.dart/VerificationCodeSentSheet.dart';
import 'package:herdrobe_app/app/widgets/bottom_sheets/confirmation_sheet.dart';
import 'package:herdrobe_app/app/widgets/custom_text.dart';
import 'package:herdrobe_app/app/widgets/custom_text_field.dart';
import 'package:herdrobe_app/app/widgets/general_bottom_sheet.dart';
import 'package:herdrobe_app/app/widgets/multi_color_title.dart';
import 'package:herdrobe_app/app/widgets/my_rounded_button.dart';

import '../controllers/sign_up_controller.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: kPadding24.hp,
            child: Form(
              key: controller.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  kPadding40.verticalSpace,
                  Image.asset(AppImages.logo),
                  kPadding40.verticalSpace,
                  MultiColorTitle(
                    titles: [
                      MultiColorTitleModel('Create Your'),
                      MultiColorTitleModel(' Account', color: AppColors.brand),
                    ],
                  ),
                  kPadding12.verticalSpace,
                  CustomText.paragraph(
                    'Provide your basic info to set up your Account.',
                    color: AppColors.textColor2,
                  ),
                  kPadding40.verticalSpace,
                  CustomTextField(
                    prefixIcon: AppIcons.user,
                    hinText: 'Enter username',
                    textInputAction: TextInputAction.next,
                    onSave: (val) => controller.username = val!.trim(),
                    validator: AuthValidators.username,
                  ),
                  kPadding16.verticalSpace,
                  CustomTextField(
                    prefixIcon: AppIcons.email,
                    hinText: 'Enter email address',
                    onSave: (val) => controller.email = val!.trim(),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    validator: AuthValidators.email,
                  ),
                  kPadding16.verticalSpace,
                  CustomTextField(
                    prefixIcon: AppIcons.phone,
                    hinText: 'Enter phone number',
                    onSave: (val) => controller.phone = val!.trim(),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.phone,
                    validator: AuthValidators.phoneNumber,
                  ),
                  kPadding16.verticalSpace,
                  CustomTextField(
                    prefixIcon: AppIcons.lock,
                    hinText: 'Enter password',
                    isPassword: true,
                    onSave: (val) => controller.password = val!.trim(),
                    textInputAction: TextInputAction.done,
                    validator: AuthValidators.password,
                  ),
                  kPadding40.verticalSpace,
                  RoundedButton('Sign Up', onTap: controller.signUp),
                  kPadding24.verticalSpace,
                  Row(
                    spacing: kPadding8.w,
                    children: [
                      if (GetPlatform.isIOS)
                        Expanded(
                          child: RoundedButton(
                            SvgPicture.asset(AppIcons.apple),
                            backgroundColor: AppColors.textField,
                          ),
                        ),
                      Expanded(
                        child: RoundedButton(
                          SvgPicture.asset(AppIcons.google),
                          backgroundColor: AppColors.textField,
                        ),
                      ),
                      Expanded(
                        child: RoundedButton(
                          SvgPicture.asset(AppIcons.facebook),
                          backgroundColor: AppColors.textField,
                        ),
                      ),
                    ],
                  ),
                  kPadding24.verticalSpace,
                  CustomText.paragraph("Already have account?"),
                  kPadding8.verticalSpace,
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: CustomText.boldParagraph(
                      'Login',
                      color: AppColors.brand,
                    ),
                  ),
                  kPadding20.verticalSpace,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
