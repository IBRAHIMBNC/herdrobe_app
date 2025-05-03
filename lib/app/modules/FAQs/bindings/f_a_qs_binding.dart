import 'package:get/get.dart';

import '../controllers/f_a_qs_controller.dart';

class FAQsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FAQsController>(
      () => FAQsController(),
    );
  }
}
