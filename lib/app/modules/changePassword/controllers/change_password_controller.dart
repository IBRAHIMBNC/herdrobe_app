import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:herdrobe_app/app/data/services/auth_service.dart';
import 'package:herdrobe_app/app/utils/loading_overlay.dart';
import 'package:herdrobe_app/app/utils/snackbars.dart';

class ChangePasswordController extends GetxController {
  final authService = Get.find<AuthService>();
  final formKey = GlobalKey<FormState>();

  String oldPassword = '';
  String newPassword = '';
  String confirmPassword = '';

  // final log = getLogger('ChangePasswordViewModel');
  String? validateConfirmPassword(String? val) {
    if (val!.isEmpty) {
      return 'Please enter confirm password';
    }
    if (val != newPassword) {
      return 'Password do not match';
    }
    return null;
  }

  changePassword() async {
    if (formKey.currentState!.validate()) {
      isAppLoading = true;
      final result = await authService.changePassword(oldPassword, newPassword);
      isAppLoading = false;
      if (result == true) {
        Get.back();
        showSuccessSnackBar(
          title: 'Passowrd Changed',
          message: 'Password changed successfully',
        );
        return;
      }
      formKey.currentState!.reset();
      showErrorSnackBar(
        title: 'Password Change Failed',
        message: authService.authError?.msg ?? 'Unknown error',
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
