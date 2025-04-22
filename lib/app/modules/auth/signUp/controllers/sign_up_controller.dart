import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:herdrobe_app/app/widgets/bottom_sheets/otp_vertification_sheet.dart/VerificationCodeSentSheet.dart';

class SignUpController extends GetxController {
  final formKey = GlobalKey<FormState>();

  String username = '';
  String email = '';
  String phone = '';
  String password = '';

  signUp() {
    Get.bottomSheet(OtpVerificationSheet(), isScrollControlled: true);
    // if (formKey.currentState!.validate()) {
    //   formKey.currentState!.save();
    //   // Perform sign-up action
    // }
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
