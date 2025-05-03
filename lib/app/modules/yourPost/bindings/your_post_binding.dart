import 'package:get/get.dart';

import '../controllers/your_post_controller.dart';

class YourPostBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<YourPostController>(
      () => YourPostController(),
    );
  }
}
