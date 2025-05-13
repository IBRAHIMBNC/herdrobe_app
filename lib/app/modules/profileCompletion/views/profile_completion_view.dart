import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:herdrobe_app/app/constants/paddings.dart';
import 'package:herdrobe_app/app/data/extensions/double.dart';
import 'package:herdrobe_app/app/data/services/auth_service.dart';
import 'package:herdrobe_app/app/routes/app_pages.dart';
import 'package:herdrobe_app/app/utils/app_colors.dart';
import 'package:herdrobe_app/app/utils/app_icons.dart';
import 'package:herdrobe_app/app/utils/auth_validators.dart';
import 'package:herdrobe_app/app/widgets/bottom_sheets/confirmation_sheet.dart';
import 'package:herdrobe_app/app/widgets/circle_button.dart';
import 'package:herdrobe_app/app/widgets/custom_image.dart';
import 'package:herdrobe_app/app/widgets/custom_tabbar.dart';
import 'package:herdrobe_app/app/widgets/custom_text.dart';
import 'package:herdrobe_app/app/widgets/custom_text_field.dart';
import 'package:herdrobe_app/app/widgets/multi_color_title.dart';
import 'package:herdrobe_app/app/widgets/my_appbar.dart';
import 'package:herdrobe_app/app/widgets/my_rounded_button.dart';

import '../controllers/profile_completion_controller.dart';

class ProfileCompletionView extends GetView<ProfileCompletionController> {
  const ProfileCompletionView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileCompletionController>(
      builder:
          (controller) => Scaffold(
            appBar: MyAppBar(
              actions: [
                IconButton(
                  onPressed: () {
                    Get.bottomSheet(
                      ConfirmationSheet(
                        title: 'Log out from your account?',

                        onConfirmTap: () {
                          Get.find<AuthService>().signOut().then(
                            (value) => Get.offAllNamed(Routes.WRAPPER),
                          );
                        },
                      ),
                    );
                  },
                  icon: const Icon(Icons.close, color: AppColors.textColor2),
                ),
                8.horizontalSpace,
              ],
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: kPadding20.hp,
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      20.verticalSpace,
                      MultiColorTitle(
                        titles: [
                          MultiColorTitleModel(
                            'Profile',
                            color: AppColors.brand,
                          ),
                          MultiColorTitleModel(' Completion'),
                        ],
                      ),
                      8.verticalSpace,
                      CustomText.paragraph(
                        'Gathering Vital Information for users to know you better.',
                        color: AppColors.textColor2,
                      ),
                      24.verticalSpace,

                      _buildPickImageContainer(controller),
                      24.verticalSpace,
                      CustomText.paragraph('User Type'),
                      8.verticalSpace,

                      CustomTabbar(
                        tabController: controller.tabController,
                        tabs: [
                          Tab(text: 'Buyer'),
                          Tab(text: 'Seller'),
                          Tab(text: 'Both'),
                        ],
                      ),
                      24.verticalSpace,
                      CustomTextField(
                        prefixIcon: AppIcons.map,
                        hinText: 'Location',
                        textInputAction: TextInputAction.next,
                        onSave: (val) => controller.location = val!.trim(),
                      ),
                      16.verticalSpace,
                      CustomTextField(
                        prefixIcon: AppIcons.cnic,
                        hinText: 'CNIC (Optional)',
                        validator: AuthValidators.cnic,
                        textInputAction: TextInputAction.done,
                        onSave: (val) => controller.cnic = val!.trim(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            bottomNavigationBar: Padding(
              padding: kPadding24.all,
              child: RoundedButton(
                'Continue',
                onTap: controller.completeProfile,
              ),
            ),
          ),
    );
  }

  Widget _buildPickImageContainer(ProfileCompletionController controller) {
    if (controller.imageFile == null) {
      return CircleButton(
        onTap: controller.pickImage,
        backgroundColor: AppColors.textField,
        radius: 50.r,
        icon: CustomImage.fromSize(
          AppIcons.userFilled,
          color: AppColors.textColor2,
          size: 50.sp,
        ),
      );
    }
    return InkWell(
      onTap: controller.pickImage,
      child: CustomImage.fromSize(
        controller.imageFile!.path,
        size: 100.sp,
        radius: 100,
      ),
    );
  }
}
