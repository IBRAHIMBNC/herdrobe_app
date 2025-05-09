import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:herdrobe_app/app/constants/paddings.dart';
import 'package:herdrobe_app/app/data/extensions/double.dart';
import 'package:herdrobe_app/app/data/models/order.dart';
import 'package:herdrobe_app/app/modules/orders/views/widgets/order_card.dart';
import 'package:herdrobe_app/app/routes/app_pages.dart';
import 'package:herdrobe_app/app/widgets/custom_tabbar.dart';
import 'package:herdrobe_app/app/widgets/my_appbar.dart';
import '../controllers/orders_controller.dart';

class OrdersView extends GetView<OrdersController> {
  const OrdersView({super.key});
  @override
  Widget build(BuildContext context) {
    print(controller.count);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: MyAppBar(
          title: 'Orders',
          showBackButton: false,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(50.h),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
              child: CustomTabbar(
                tabs: [
                  Tab(text: 'All'),
                  Tab(text: 'Active'),
                  Tab(text: 'Completed'),
                ],
              ),
            ),
          ),
        ),
        body: Padding(
          padding: kPadding24.all,
          child: Column(
            children: [
              MyOrderContainer(
                onTap: () {
                  Get.toNamed(Routes.ORDER_DETAILS);
                },
                orderModel: OrderModel.empty,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// enum OrderStatusTab { all, active, completed }

  // Obx(
              //   () => CupertinoSlidingSegmentedControl<OrderStatusTab>(
              //     groupValue: controller.selectTab.value,
              //     padding: kPadding8.all,
              //     thumbColor: AppColors.brand,
              //     backgroundColor: AppColors.textField,
              //     children: OrderStatusTab.values.asMap().map((key, status) {
              //       return MapEntry(
              //         status,
              //         Container(
              //           padding: kPadding8.all,
              //           child: Text(status.name.capitalizeFirst!),
              //         ),
              //       );
              //     }),
              //     onValueChanged: (value) {
              //       if (value != null) {
              //         controller.selectTab.value = value;
              //       }
              //     },
              //   ),
              // ),