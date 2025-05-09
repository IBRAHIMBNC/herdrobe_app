import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:herdrobe_app/app/data/services/auth_service.dart';

class SellerDetailsController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final authService = Get.find<AuthService>();
  bool get isAdmin => authService.isAdmin;
  late final TabController mainTabController;
  final RxInt currentIndex = 0.obs;

  @override
  void onInit() {
    currentIndex.value = isAdmin ? 0 : 1;
    mainTabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: currentIndex.value,
    );
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
