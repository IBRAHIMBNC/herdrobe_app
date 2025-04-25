import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:herdrobe_app/app/constants/paddings.dart';
import 'package:herdrobe_app/app/data/extensions/double.dart';
import 'package:herdrobe_app/app/routes/app_pages.dart';
import 'package:herdrobe_app/app/utils/app_colors.dart';
import 'package:herdrobe_app/app/utils/app_icons.dart';
import 'package:herdrobe_app/app/utils/app_images.dart';
import 'package:herdrobe_app/app/utils/app_text_styles.dart';
import 'package:herdrobe_app/app/utils/auth_validators.dart';
import 'package:herdrobe_app/app/widgets/custom_text.dart';
import 'package:herdrobe_app/app/widgets/custom_text_field.dart';
import 'package:herdrobe_app/app/widgets/multi_color_title.dart';
import 'package:herdrobe_app/app/widgets/my_rounded_button.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: kPadding24.hp,
            child: Form(
              key: controller.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppImages.logo, height: 100.h, width: 100.w),
                  kPadding40.verticalSpace,

                  MultiColorTitle(
                    titles: [
                      MultiColorTitleModel('Welcome'),
                      MultiColorTitleModel(' back!', color: AppColors.brand),
                    ],
                  ),

                  kPadding12.verticalSpace,
                  CustomText.paragraph(
                    'Enter your credentials to access your account.',
                    color: AppColors.textColor2,
                  ),
                  kPadding40.verticalSpace,
                  CustomTextField(
                    prefixIcon: AppIcons.email,
                    hinText: 'Enter email address',
                    textInputAction: TextInputAction.next,
                    onSave: (val) => controller.email = val!.trim(),
                    validator: AuthValidators.email,
                  ),
                  kPadding16.verticalSpace,
                  CustomTextField(
                    prefixIcon: AppIcons.lock,
                    hinText: 'Enter password',
                    onSave: (val) => controller.password = val!.trim(),
                    textInputAction: TextInputAction.done,
                    validator: AuthValidators.password,
                    isPassword: true,
                  ),
                  kPadding8.verticalSpace,
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () => Get.toNamed(Routes.FORGOT_PASSWORD),
                      child: CustomText.smallBold12('Forgot password?'),
                    ),
                  ),

                  kPadding40.verticalSpace,
                  RoundedButton('Login', onTap: controller.login),
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
                  CustomText.paragraph("Don’t have account?"),
                  kPadding8.verticalSpace,
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.SIGN_UP);
                    },
                    child: CustomText.boldParagraph(
                      'Sign up',
                      color: AppColors.brand,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
