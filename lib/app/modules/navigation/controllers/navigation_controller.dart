import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:herdrobe_app/app/modules/home/controllers/home_controller.dart';
import 'package:herdrobe_app/app/routes/app_pages.dart';

class NavigationController extends GetxController {
  final currentIndex = 0.obs;
  final pageController = PageController(initialPage: 0);
  late final homeCont = Get.find<HomeController>();
  final List<Widget> pages = [
    GetRouterOutlet(initialRoute: Routes.HOME),
    GetRouterOutlet(initialRoute: Routes.ORDERS),
    Center(child: Text('Add')),
    Center(child: Text('Chat')),
    GetRouterOutlet(initialRoute: Routes.PROFILE),
  ];

  onTabChanged(int index) {
    if (index == 2) {
      Get.toNamed(Routes.ADD_EDIT_POST);
      return;
    }
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    currentIndex.value = index;
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
