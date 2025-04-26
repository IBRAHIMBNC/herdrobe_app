import 'package:get/get.dart';
import 'package:herdrobe_app/app/utils/my_utils.dart';

class HomeController extends GetxController {
  // Banner carousel related
  final currentBannerIndex = 0.obs;
  final List<String> banners = [
    MyUtils.getTempLink(),
    MyUtils.getTempLink(),
    MyUtils.getTempLink(),
    MyUtils.getTempLink(),
  ];

  void onBannerChanged(int index) {
    currentBannerIndex.value = index;
  }

  @override
  void onInit() {
    print('HomeController initialized');
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
