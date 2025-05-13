import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:herdrobe_app/app/constants/paddings.dart';
import 'package:herdrobe_app/app/data/extensions/double.dart';
import 'package:herdrobe_app/app/routes/app_pages.dart';
import 'package:herdrobe_app/app/utils/app_colors.dart';
import 'package:herdrobe_app/app/utils/my_utils.dart';
import 'package:herdrobe_app/app/widgets/custom_image.dart';
import 'package:herdrobe_app/app/widgets/custom_text.dart';
import 'package:herdrobe_app/app/widgets/multi_color_title.dart';
import 'package:herdrobe_app/app/widgets/my_rounded_button.dart';

import '../controllers/welcome_controller.dart';

class WelcomeView extends GetView<WelcomeController> {
  const WelcomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 150.h,
            left: -200.w,
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 88, sigmaY: 88),
              child: CircleAvatar(
                radius: 200.r,
                backgroundColor: AppColors.brand.withOpacity(0.15),
              ),
            ),
          ),
          Positioned(
            top: 350.h,
            right: -150.w,
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 88, sigmaY: 88),
              child: CircleAvatar(
                radius: 150.r,
                backgroundColor: Color(0xffFFF600).withOpacity(0.15),
              ),
            ),
          ),

          Center(
            child: Padding(
              padding: kPadding32.hp,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MultiColorTitle(
                    titles: [
                      MultiColorTitleModel(
                        'Welcome to ',
                        color: AppColors.textColor1,
                        fontWeight: FontWeight.normal,
                        fontSize: 20.sp,
                      ),
                      MultiColorTitleModel(
                        ' HERDROBE',
                        color: AppColors.brand,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp,
                      ),
                    ],
                  ),
                  8.verticalSpace,
                  CustomText.largeHeading(
                    controller.currentUser?.fullName ?? '',
                  ),
                  40.verticalSpace,

                  CircleAvatar(
                    radius: 104.r,
                    backgroundColor: AppColors.brand,
                    child: CustomImage.fromSize(
                      controller.currentUser?.imageUrl ?? '',
                      radius: 100.r,
                      size: 198.h,
                      backgroundColor: AppColors.white,
                    ),
                  ),
                  40.verticalSpace,
                  CustomText.paragraph(
                    'You’re all set! Start exploring a world of amazing products, seamless shopping, and exclusive deals—all at your fingertips.',
                    textAlign: TextAlign.center,
                    color: AppColors.textColor2,
                  ),
                  40.verticalSpace,
                  RoundedButton(
                    'Continue',
                    onTap: () {
                      Get.offAllNamed(Routes.NAVIGATION);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
