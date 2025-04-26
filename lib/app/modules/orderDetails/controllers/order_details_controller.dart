import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:herdrobe_app/app/data/models/order.dart';
import 'package:herdrobe_app/app/modules/orderDetails/views/widgets/order_details_tab.dart';
import 'package:herdrobe_app/app/modules/orderDetails/views/widgets/track_order_tab.dart';

class OrderDetailsController extends GetxController {
  final RxInt currentIndex = 0.obs;
  final OrderModel order = OrderModel.empty();

  final List<Widget> tabs = [const OrderDetailsTab(), const TrackOrderWidget()];

  Widget get currentTab => tabs[currentIndex.value];

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
