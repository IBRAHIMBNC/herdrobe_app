import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:herdrobe_app/app/widgets/my_appbar.dart';

import '../controllers/privacy_policy_controller.dart';

class PrivacyPolicyView extends GetView<PrivacyPolicyController> {
  const PrivacyPolicyView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Privacy Policy'),
      body: const Center(
        child: Text(
          'PrivacyPolicyView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
