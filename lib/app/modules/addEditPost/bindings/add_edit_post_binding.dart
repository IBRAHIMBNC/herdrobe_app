import 'package:get/get.dart';

import '../controllers/add_edit_post_controller.dart';

class AddEditPostBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddEditPostController>(
      () => AddEditPostController(),
    );
  }
}
