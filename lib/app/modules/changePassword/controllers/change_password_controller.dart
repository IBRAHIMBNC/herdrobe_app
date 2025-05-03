import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController {
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
    if (formKey.currentState!.validate()) {}
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
