import 'package:get/get.dart';
import 'package:herdrobe_app/app/data/models/user.dart';
import 'package:herdrobe_app/app/data/services/auth_service.dart';

class ProfileController extends GetxController {
  final authService = Get.find<AuthService>();

  AppUser? get currentUser => authService.currentUser.value;
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
