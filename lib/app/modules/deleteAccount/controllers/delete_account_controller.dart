import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:herdrobe_app/app/constants/paddings.dart';
import 'package:herdrobe_app/app/data/extensions/double.dart';
import 'package:herdrobe_app/app/utils/app_icons.dart';
import 'package:herdrobe_app/app/widgets/bottom_sheets/confirmation_sheet.dart';

class DeleteAccountController extends GetxController {
  final formKey = GlobalKey<FormState>();

  String password = '';
  String reason = '';

  void deleteAccount() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      print('Password: $password');
      print('Reason: $reason');
      Get.bottomSheet(
        ConfirmationSheet(
          size: 50.sp,
          titlePadding: kPadding16.top,
          imagePath: AppIcons.alert,
          title: 'Are you sure?',
          message:
              'Irreversibly delete your account, including all data and access, with no option for recovery.',
        ),
      );
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
