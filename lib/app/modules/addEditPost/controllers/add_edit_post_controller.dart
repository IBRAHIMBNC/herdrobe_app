import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:herdrobe_app/app/constants/paddings.dart';
import 'package:herdrobe_app/app/data/enums/product_type.dart';
import 'package:herdrobe_app/app/data/enums/products_category.dart';
import 'package:herdrobe_app/app/data/enums/rent_period.dart';
import 'package:herdrobe_app/app/data/enums/size.dart';
import 'package:herdrobe_app/app/data/extensions/double.dart';
import 'package:herdrobe_app/app/data/extensions/enum.dart';
import 'package:herdrobe_app/app/data/models/product.dart';
import 'package:herdrobe_app/app/data/services/auth_service.dart';
import 'package:herdrobe_app/app/data/services/db_service.dart';
import 'package:herdrobe_app/app/data/services/file_picker_service.dart';
import 'package:herdrobe_app/app/data/services/product_service.dart';
import 'package:herdrobe_app/app/utils/app_icons.dart';
import 'package:herdrobe_app/app/utils/loading_overlay.dart';
import 'package:herdrobe_app/app/utils/snackbars.dart';
import 'package:herdrobe_app/app/widgets/bottom_sheets/confirmation_sheet.dart';
import 'package:herdrobe_app/app/widgets/multiple_selection_sheet.dart';
import 'package:herdrobe_app/main.dart';

class AddEditPostController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final productService = Get.find<ProductService>();
  final dbService = Get.find<DbService>();
  final titleCont = TextEditingController(text: 'Product 1');
  final descriptionCont = TextEditingController(
    text:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
  );
  final stockCont = TextEditingController(text: '10');
  final priceCont = TextEditingController(text: '100.0');
  final contactCont = TextEditingController(text: '1234567890');
  final sizeCont = TextEditingController();
  final categoryCont = TextEditingController(text: 'Tops, Bottoms');

  List<String> images = [];
  List<ProductSize> sizes = [];
  List<ProductsCategory> categories = [];

  PostType type = PostType.sell;
  bool hideIdentity = false;
  RentPeriod rentType = RentPeriod.day;

  ProductModel? product;
  bool get isEditProduct => Get.arguments != null;

  init() {
    final args = Get.arguments;

    if (isEditProduct) {
      final productId = args as String;
      product = productService.findProductById(productId);
      titleCont.text = product?.name ?? '';
      descriptionCont.text = product?.description ?? '';
      stockCont.text = product.toString();
      priceCont.text = product?.price.toString() ?? '';
      contactCont.text = product?.contactNumber ?? '';
      images = product?.imageUrls ?? [];
      sizes = product?.availableSizes ?? [];
      categories = product?.categories ?? [];
      type =
          product?.productType == ProductType.rent
              ? PostType.rent
              : PostType.sell;
      print('Product: $product');
      print(images);
    }
  }

  onTypeChanged(int index) {
    final value = PostType.values[index];
    type = value;
    update();
  }

  addPost() async {
    if (!formKey.currentState!.validate()) return;
    if (images.isEmpty) {
      showErrorSnackBar(title: 'Please select at least one image');
      return;
    }
    final sheetResult = await Get.bottomSheet(
      ConfirmationSheet(
        imagePath: AppIcons.alert,
        titlePadding: kPadding12.top,
        title: 'Post Your Ad',
        message:
            'Are you sure you want to post this ad? It will be visible to all users.',
        confirmBtnText: 'Confirm',
        cancelBtnText: 'Go Back',
        onConfirmTap: () {
          Get.back(result: true);
        },
      ),
    );
    if (sheetResult != true) {
      return;
    }

    // Perform the add post action
    // You can use the values from the controllers here
    final productId =
        isEditProduct ? this.product?.id ?? '' : dbService.generateDocId;
    final title = titleCont.text;
    final description = descriptionCont.text;
    final stock = int.tryParse(stockCont.text);
    final price = double.tryParse(priceCont.text);
    final contact = contactCont.text;
    final sellerUid = Get.find<AuthService>().currentUser.value!.uid;

    isAppLoading = true;

    images.addAll(
      await dbService.uploadProductImages(
        productId: productId,
        files:
            images.where((e) => !GetUtils.isURL(e)).map((e) {
              final file = File(e);
              return file;
            }).toList(),
      ),
    );

    ProductModel? p = product ?? ProductModel.empty();
    product = p.copyWith(
      id: productId,
      sellerUid: sellerUid,
      name: title,
      description: description,
      imageUrls: images,
      categories: categories,
      availableSizes: sizes,
      contactNumber: contact,
    );
    print('Product: $product');

    if (type == PostType.rent) {
      product = product?.copyWith(
        productType: ProductType.rent,
        stock: stock ?? 0,
        rentType: rentType,
        depositAmount: price ?? 0.0,
      );
    } else if (type == PostType.swap) {
      product = product?.copyWith(
        productType: ProductType.swap,
        swapCondition: description,
      );
    }

    if (isEditProduct) {
      await productService.updateProduct(product!);
    } else {
      await productService.addProduct(product!);
    }
    isAppLoading = false;
    Get.back(result: true);
    if (isEditProduct) {
      showSuccessSnackBar(
        title: 'Product Updated',
        message: 'Your product has been updated successfully.',
      );
    } else {
      showSuccessSnackBar(
        title: 'Product Added',
        message: 'Your product has been added successfully.',
      );
    }
  }

  pickImages() async {
    final result = await FilePickerService.pickMultipleImages();
    images.addAll(result.map((e) => e.path).toList());
    infoLog.i('Picked images: ${images.length}');
    update();
  }

  @override
  void onInit() {
    init();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    titleCont.dispose();
    descriptionCont.dispose();
    stockCont.dispose();
    priceCont.dispose();
    contactCont.dispose();
    sizeCont.dispose();
    categoryCont.dispose();

    super.onClose();
  }

  showSizeSelectionSheet() async {
    final result = await showMulitpleSelectionSheet(
      title: 'Select Sizes',
      items: ProductSize.values,
    );
    if (result != null) {
      sizes = result;
      sizeCont.text = sizes.map((e) => e.capitalizeFirst).join(', ');
      update();
    }
  }

  showCategorySelectionSheet() async {
    final result = await showMulitpleSelectionSheet(
      title: 'Select Categories',
      items: ProductsCategory.values,
    );
    if (result != null) {
      categories = result;
      categoryCont.text = categories.map((e) => e.capitalizeFirst).join(', ');
      update();
    }
  }
}

enum PostType { sell, swap, rent }
