import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:herdrobe_app/app/routes/app_pages.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  login() {
    Get.offNamed(Routes.NAVIGATION);
    // if (formKey.currentState!.validate()) {
    //   formKey.currentState!.save();
    //   // Perform login action
    // }
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
