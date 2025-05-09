import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:herdrobe_app/app/data/enums/admin_sections.dart';
import 'package:herdrobe_app/app/routes/app_pages.dart';

class AdminNavigationController extends GetxController {
  AdminSections _selectedSection = AdminSections.dashboard;
  AdminSections get selectedSection => _selectedSection;
  set selectedSection(AdminSections value) {
    _selectedSection = value;
    update();
  }

  final List<Widget> sections = [
    GetRouterOutlet(initialRoute: Routes.ADMIN_DASHBOARD),
    GetRouterOutlet(initialRoute: Routes.ACCOUNT),
    Container(),
    Container(),
  ];

  Widget get selectedPage => sections[selectedSection.index];

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
