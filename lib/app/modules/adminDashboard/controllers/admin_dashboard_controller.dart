import 'package:get/get.dart';
import 'package:herdrobe_app/app/data/enums/admin_sections.dart';

class AdminDashboardController extends GetxController {
  final RxBool isAppBarCollapsed = false.obs;

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
