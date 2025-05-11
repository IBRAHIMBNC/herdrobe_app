import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:herdrobe_app/app/data/services/auth_service.dart';
import 'package:herdrobe_app/app/routes/app_pages.dart';
import 'package:herdrobe_app/app/utils/loading_overlay.dart';

class LoginController extends GetxController {
  final _authService = Get.find<AuthService>();
  final formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  login() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      isAppLoading = true;
      final result = await _authService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (result == true) {
        Get.offAllNamed(Routes.WRAPPER);
        return;
      }
      isAppLoading = false;
      Get.snackbar(
        'Login Failed',
        _authService.authError?.msg ?? 'Unknown error',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  final count = 0.obs;
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

  void increment() => count.value++;
}
