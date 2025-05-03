import 'package:get/get.dart';

import '../controllers/pick_location_in_map_controller.dart';

class PickLocationInMapBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PickLocationInMapController>(
      () => PickLocationInMapController(),
    );
  }
}
