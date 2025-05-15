import 'package:get/get.dart';
import 'package:herdrobe_app/app/data/models/user.dart';
import 'package:herdrobe_app/app/data/services/auth_service.dart';

class ProfileController extends GetxController {
  final authService = Get.find<AuthService>();

  AppUser? get currentUser => authService.currentUser.value;

  logout() {
    authService.signOut();
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
