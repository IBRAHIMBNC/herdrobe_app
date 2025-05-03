import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:herdrobe_app/app/constants/paddings.dart';
import 'package:herdrobe_app/app/data/extensions/double.dart';
import 'package:herdrobe_app/app/utils/app_colors.dart';
import 'package:herdrobe_app/app/utils/auth_validators.dart';
import 'package:herdrobe_app/app/widgets/custom_text.dart';
import 'package:herdrobe_app/app/widgets/custom_text_field.dart';
import 'package:herdrobe_app/app/widgets/my_appbar.dart';
import 'package:herdrobe_app/app/widgets/my_rounded_button.dart';

import '../controllers/delete_account_controller.dart';

class DeleteAccountView extends GetView<DeleteAccountController> {
  const DeleteAccountView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Delete Account'),
      body: Container(
        padding: kPadding24.hp,
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              20.verticalSpace,
              CustomText.paragraph(
                '"Please share your feedback on the issue you encountered with our app, enabling us to improve.',
                color: AppColors.textColor2,
              ),
              16.verticalSpace,
              CustomTextField(
                hinText: 'Your explanation is entirely optional..',
                lines: 5,
                onSave: (val) => controller.reason = val!.trim(),
              ),
              16.verticalSpace,

              CustomTextField(
                hinText: 'Password',
                isPassword: true,
                onSave: (val) => controller.password = val!.trim(),
                validator: AuthValidators.password,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(
          horizontal: kPadding20.w,
          vertical: kPadding40.h,
        ),
        child: RoundedButton('Delete Account', onTap: controller.deleteAccount),
      ),
    );
  }
}
