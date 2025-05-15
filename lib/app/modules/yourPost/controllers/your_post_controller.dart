import 'package:get/get.dart';
import 'package:herdrobe_app/app/data/models/product.dart';
import 'package:herdrobe_app/app/data/services/product_service.dart';

class YourPostController extends GetxController {
  final productService = Get.find<ProductService>();
  List<ProductModel> get myProducts => productService.myPorducts;

  @override
  void onInit() {
    ever(productService.myPorducts, (products) {
      update();
    });
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
