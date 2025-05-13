import 'package:get/get.dart';
import 'package:herdrobe_app/app/data/models/user.dart';
import 'package:herdrobe_app/app/data/services/auth_service.dart';
import 'package:herdrobe_app/app/utils/my_utils.dart';

class HomeController extends GetxController {
  final authService = Get.find<AuthService>();
  // Banner carousel related
  final currentBannerIndex = 0.obs;

  AppUser? get currentUser => authService.currentUser.value;

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
    ever(authService.currentUser, (user) {
      update();
    });
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
