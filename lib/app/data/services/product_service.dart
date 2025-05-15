import 'package:get/get.dart';
import 'package:herdrobe_app/app/data/models/product.dart';
import 'package:herdrobe_app/app/data/services/db_service.dart';
import 'package:herdrobe_app/main.dart';

class ProductService extends GetxService {
  final dbService = Get.find<DbService>();
  final RxList<ProductModel> myPorducts = <ProductModel>[].obs;

  fetchMyProducts() async {
    final products = await dbService.fetchUserProducts();
    infoLog.i('Fetched ${products.length} products');
    myPorducts.assignAll(products);
  }

  addProduct(ProductModel product) {
    myPorducts.add(product);
    dbService.addProduct(product);
  }

  removeProduct(ProductModel product) {
    myPorducts.remove(product);
    // dbService.deleteProduct(product);
  }

  updateProduct(ProductModel product) {
    final index = myPorducts.indexWhere((p) => p.id == product.id);
    if (index != -1) {
      myPorducts[index] = product;
    }
    dbService.updateProduct(product);
  }

  @override
  void onInit() {
    fetchMyProducts();
    super.onInit();
  }

  ProductModel? findProductById(String product) {
    return myPorducts.firstWhereOrNull((p) => p.id == product);
  }
}
