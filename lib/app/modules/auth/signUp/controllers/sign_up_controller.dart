import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:herdrobe_app/app/data/models/user.dart';
import 'package:herdrobe_app/app/data/services/app_state_service.dart';
import 'package:herdrobe_app/app/data/services/auth_service.dart';
import 'package:herdrobe_app/app/routes/app_pages.dart';
import 'package:herdrobe_app/app/utils/loading_overlay.dart';
import 'package:herdrobe_app/app/widgets/bottom_sheets/otp_vertification_sheet.dart/VerificationCodeSentSheet.dart';

class SignUpController extends GetxController {
  final _authService = Get.find<AuthService>();
  final formKey = GlobalKey<FormState>();
  String username = '';
  String email = '';
  String phone = '';
  String password = '';

  signUp() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      isAppLoading = true;
      final appUser = AppUser.create(
        name: username,
        email: email,
        phone: phone,
      );
      final result = await _authService.createUserWithEmailAndPassword(
        appUser: appUser,
        password: password,
        imageFile: null,
      );
      if (result == true) {
        Get.offAllNamed(Routes.WRAPPER);
        return;
      }
      isAppLoading = false;
      Get.snackbar(
        'Sign up Failed',
        _authService.authError?.msg ?? 'Unknown error',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );

      // final result = await Get.bottomSheet(
      //   OtpVerificationSheet(),
      //   isScrollControlled: true,
      // );
      // if (result == true) {
      //   // Handle successful OTP verification
      //   Get.toNamed(Routes.PROFILE_COMPLETION);
      // }
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
