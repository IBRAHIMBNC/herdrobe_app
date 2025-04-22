import 'package:get/get.dart';

class SearchProductController extends GetxController {
  bool isSearching = false;

  String searchText = '';

  onStartSearch(value) {
    searchText = value!.trim();
    isSearching = value.isNotEmpty;
    update();
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
