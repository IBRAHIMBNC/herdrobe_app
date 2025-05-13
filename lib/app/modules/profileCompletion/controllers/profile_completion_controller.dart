import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:herdrobe_app/app/data/constants/firebase_const.dart';
import 'package:herdrobe_app/app/data/enums/user_type.dart';
import 'package:herdrobe_app/app/data/services/auth_service.dart';
import 'package:herdrobe_app/app/data/services/db_service.dart';
import 'package:herdrobe_app/app/data/services/file_picker_service.dart';
import 'package:herdrobe_app/app/routes/app_pages.dart';
import 'package:herdrobe_app/app/utils/loading_overlay.dart';

class ProfileCompletionController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final authService = Get.find<AuthService>();
  final dbService = Get.find<DbService>();
  final formKey = GlobalKey<FormState>();
  late final TabController tabController = TabController(
    length: 3,
    vsync: this,
  );

  File? imageFile;
  String? location;
  String? cnic;

  pickImage() async {
    imageFile = await FilePickerService.pickImage();
    update();
  }

  completeProfile() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      isAppLoading = true;
      final String? imageUrl =
          imageFile == null
              ? null
              : await dbService.uploadProfileImage(file: imageFile!);

      final UserType userType = UserType.values[tabController.index];
      authService.firebaseUser?.updateDisplayName(kUserCompleted);
      authService.updateProfile(
        authService.currentUser.value!.copyWith(
          photoUrl: imageUrl,
          cnicNumber: cnic,
          userType: userType,
        ),
      );
      isAppLoading = false;
      Get.toNamed(Routes.WELCOME);
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
    super.onClose();
  }
}
