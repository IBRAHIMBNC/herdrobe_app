import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:herdrobe_app/app/constants/paddings.dart';
import 'package:herdrobe_app/app/data/extensions/double.dart';
import 'package:herdrobe_app/app/widgets/custom_tabbar.dart';
import 'package:herdrobe_app/app/widgets/custom_text.dart';
import 'package:herdrobe_app/app/widgets/my_appbar.dart';
import '../controllers/order_details_controller.dart';

class OrderDetailsView extends GetView<OrderDetailsController> {
  const OrderDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: MyAppBar(
          height: 75.h,
          showBackButton: false,
          title: Padding(
            padding: kPadding16.right,
            child: CustomTabbar(
              onTabChanged: (index) {
                controller.currentIndex.value = index;
              },
              tabs: [Tab(text: 'Order Details'), Tab(text: 'Track Order')],
            ),
          ),
        ),
        body: Obx(() => controller.tabs[controller.currentIndex.value]),
      ),
    );
  }
}

class OrderSummeryRow extends StatelessWidget {
  const OrderSummeryRow({
    super.key,
    required this.title,
    required this.trailing,
  });
  final String title;
  final Widget trailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [CustomText.small12(title), trailing],
    );
  }
}
