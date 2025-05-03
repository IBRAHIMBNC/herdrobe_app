import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:herdrobe_app/app/constants/paddings.dart';
import 'package:herdrobe_app/app/utils/auth_validators.dart';
import 'package:herdrobe_app/app/widgets/custom_text_field.dart';
import 'package:herdrobe_app/app/widgets/my_appbar.dart';
import 'package:herdrobe_app/app/widgets/my_rounded_button.dart';

import '../controllers/change_password_controller.dart';

class ChangePasswordView extends GetView<ChangePasswordController> {
  const ChangePasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Change Password'),
      body: Container(
        padding: EdgeInsets.only(
          top: kPadding20.h,
          right: kPadding24.w,
          left: kPadding24.w,
        ),
        child: Form(
          key: controller.formKey,
          child: Column(
            spacing: kPadding16.h,
            children: [
              CustomTextField(
                hinText: 'Old Password',
                isPassword: true,
                textInputAction: TextInputAction.next,
                onChanged: (value) => controller.oldPassword = value!,
                validator: AuthValidators.password,
              ),

              CustomTextField(
                hinText: 'New Password',
                validator: AuthValidators.password,
                textInputAction: TextInputAction.next,
                onChanged: (value) => controller.newPassword = value!,
                isPassword: true,
              ),

              CustomTextField(
                hinText: 'Confirm Password',
                isPassword: true,
                textInputAction: TextInputAction.done,
                onChanged: (value) => controller.confirmPassword = value!,
                validator: controller.validateConfirmPassword,
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
        child: RoundedButton(
          'Change Password',
          onTap: controller.changePassword,
        ),
      ),
    );
  }
}
