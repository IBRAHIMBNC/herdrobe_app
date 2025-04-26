import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:herdrobe_app/app/constants/paddings.dart';
import 'package:herdrobe_app/app/data/extensions/double.dart';
import 'package:herdrobe_app/app/data/models/order.dart';
import 'package:herdrobe_app/app/modules/profileCompletion/views/profile_completion_view.dart';
import 'package:herdrobe_app/app/utils/app_colors.dart';
import 'package:herdrobe_app/app/utils/app_icons.dart';
import 'package:herdrobe_app/app/widgets/custom_image.dart';
import 'package:herdrobe_app/app/widgets/custom_tabbar.dart';
import 'package:herdrobe_app/app/widgets/custom_text.dart';
import 'package:herdrobe_app/app/widgets/my_appbar.dart';
import 'package:herdrobe_app/app/widgets/my_container.dart';
import 'package:herdrobe_app/app/widgets/product_details_card.dart';
import 'package:intl/intl.dart';
import '../controllers/orders_controller.dart';

class OrdersView extends GetView<OrdersController> {
  const OrdersView({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: MyAppBar(
          title: 'Orders',
          showBackButton: false,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(50.h),
            child: Padding(
              padding: kPadding24.hp,
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
              MyOrderContainer(onTap: () {}, orderModel: OrderModel.empty()),
            ],
          ),
        ),
      ),
    );
  }
}

class MyOrderContainer extends StatelessWidget {
  const MyOrderContainer({
    super.key,
    required this.onTap,
    required this.orderModel,
  });

  final Function() onTap;
  final OrderModel orderModel;

  @override
  Widget build(BuildContext context) {
    final orderStatus = orderModel.status;
    return InkWell(
      onTap: onTap,
      child: MyContainer(
        radius: 16.r,
        padding: EdgeInsets.all(10.sp),
        border: const BorderSide(width: 1, color: AppColors.lightGrey),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomImage.fromSize(AppIcons.search, size: 20.w),
                9.horizontalSpace,
                CustomText.small12(
                  'Order ID: ${44444}',
                  color: AppColors.textColor2,
                ),
                // CustomText.small12(
                //   DateFormat(
                //     'MMM dd, yyyy',
                //   ).format(orderModel.dateCreated!.toDate()),
                // ),
              ],
            ),
            const Divider(color: AppColors.lightGrey),

            ProductDetailsCard.listTile(showBorder: false),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   children: [
            // if (orderModel.items.isNotEmpty)
            //   CustomImage(
            //     orderModel.items.first.productModel.imageUrls.first,
            //     height: 105.w,
            //     width: 105.w,
            //     radius: 10.r,
            //   ),
            // 16.horizontalSpace,
            // Expanded(
            // child: Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     MyContainer(
            //       color: orderStatus.color.withOpacity(0.1),
            //       padding: EdgeInsets.symmetric(
            //         horizontal: kPadding8.w,
            //         vertical: kPadding4.h,
            //       ),
            //       child: CustomText.smaller(
            //         orderStatus.capitalizedName,
            //         color: orderStatus.color,
            //       ),
            //     ),
            //     8.verticalSpace,
            //     CustomText.smallBold12(
            //       orderModel.items.first.productModel.name,
            //     ),
            //     8.verticalSpace,
            //     CustomText.small12('Abdullah Town, Lahore '),
            //     4.verticalSpace,
            //     Visibility(
            //       visible: orderModel.items.length > 1,
            //       child: CustomText.smaller(
            //         '+${orderModel.items.length - 1} Products',
            //       ),
            //     ),
            //     4.verticalSpace,
            //     CustomText.small12(
            //       'total shopping: \$${orderModel.grandTotal}',
            //     ),
            //   ],
            // ),
            // ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
