import 'package:get/get.dart';
import 'package:herdrobe_app/app/data/models/user.dart';
import 'package:herdrobe_app/app/data/services/auth_service.dart';

class WelcomeController extends GetxController {
  final AuthService _authService = Get.find<AuthService>();

  AppUser? get currentUser => _authService.currentUser.value;
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
