import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileCompletionController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late final TabController tabController = TabController(
    length: 3,
    vsync: this,
  );

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
