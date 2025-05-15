import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:herdrobe_app/app/routes/app_pages.dart';
import 'package:herdrobe_app/app/utils/app_colors.dart';
import 'package:herdrobe_app/app/utils/app_icons.dart';
import 'package:herdrobe_app/app/widgets/custom_image.dart';
import 'package:herdrobe_app/app/widgets/custom_text.dart';
import 'package:herdrobe_app/app/widgets/generic_bottom_sheet.dart';
import 'package:herdrobe_app/app/widgets/my_rounded_button.dart';

class LoginAlertSheet extends StatelessWidget {
  const LoginAlertSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return GenericBottomSheet(
      body: Column(
        children: [
          CircleAvatar(
            radius: 50.r,
            backgroundColor: AppColors.lightGrey,
            child: CustomImage.fromSize(
              AppIcons.signinRequired,
              size: 45.sp,
              fit: BoxFit.contain,
            ),
          ),
          16.verticalSpace,
          CustomText.mediumHeading('Account Required!'),
          8.verticalSpace,
          CustomText.paragraph(
            'Please log in or register to proceed further.',
            color: AppColors.textColor2,
          ),

          16.verticalSpace,

          RoundedButton.filledMedium(
            'Login / Create Account',
            onTap: () {
              Get.toNamed(Routes.LOGIN);
            },
          ),
        ],
      ),
    );
  }
}
