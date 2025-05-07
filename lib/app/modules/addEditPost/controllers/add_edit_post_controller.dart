import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:herdrobe_app/app/data/enums/rent_period.dart';

class AddEditPostController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final List<File> images = [];
  final List<String> imageUrls = [];

  PostType type = PostType.sell;

  onTypeChanged(int index) {
    final value = PostType.values[index];
    type = value;
    update();
  }

  final titleCont = TextEditingController();
  final descriptionCont = TextEditingController();
  final stockCont = TextEditingController();
  final priceCont = TextEditingController();
  final contactCont = TextEditingController();

  bool hideIdentity = false;

  RentPeriod rentType = RentPeriod.day;

  addPost() {
    if (formKey.currentState!.validate()) {
      // Perform the add post action
      // You can use the values from the controllers here
      final title = titleCont.text;
      final description = descriptionCont.text;
      final stock = int.tryParse(stockCont.text);
      final price = double.tryParse(priceCont.text);
      final contact = contactCont.text;

      // Add your logic to handle the post creation here
    }
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
    titleCont.dispose();
    descriptionCont.dispose();
    stockCont.dispose();
    priceCont.dispose();
    contactCont.dispose();

    super.onClose();
  }
}

enum PostType { sell, swap, rent }
