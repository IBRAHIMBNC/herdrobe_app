import 'package:get/get.dart';
import 'package:herdrobe_app/app/data/enums/order_status.dart';
import 'package:herdrobe_app/app/modules/orders/views/orders_view.dart';

class OrdersController extends GetxController {
  // final Rx<OrderStatusTab> selectTab = OrderStatusTab.all.obs;
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
