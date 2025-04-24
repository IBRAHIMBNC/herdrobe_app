import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:herdrobe_app/app/utils/my_utils.dart';

class ProductDetailsController extends GetxController {
  final pageViewController = PageController();

  final currentImageIndex = 0.obs;

  final images = [
    MyUtils.getTempLink(),
    MyUtils.getTempLink(),
    MyUtils.getTempLink(),
    MyUtils.getTempLink(),
  ];

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
