import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:herdrobe_app/app/widgets/my_appbar.dart';
import 'package:herdrobe_app/main.dart';

import '../controllers/f_a_qs_controller.dart';

class FAQsView extends GetView<FAQsController> {
  const FAQsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'FAQs'),
      body: const Center(
        child: Text('FAQsView is working', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
