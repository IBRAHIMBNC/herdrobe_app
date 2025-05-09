import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:herdrobe_app/app/constants/paddings.dart';
import 'package:herdrobe_app/app/data/enums/order_status.dart';
import 'package:herdrobe_app/app/data/extensions/double.dart';
import 'package:herdrobe_app/app/data/models/order.dart';
import 'package:herdrobe_app/app/modules/orderDetails/views/widgets/order_status_card.dart';
import 'package:herdrobe_app/app/utils/app_colors.dart';
import 'package:herdrobe_app/app/utils/app_icons.dart';
import 'package:herdrobe_app/app/widgets/custom_text.dart';
import 'package:herdrobe_app/app/widgets/my_container.dart';

class TrackOrderWidget extends StatelessWidget {
  const TrackOrderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final order = OrderModel.empty;
    int index = 0;

    switch (order.status) {
      case OrderStatus.pending:
        index = 0;
        break;
      case OrderStatus.inProgress:
        index = 1;
        break;
      case OrderStatus.shipped:
        index = 2;
        break;
      case OrderStatus.completed:
        index = 3;
        break;
      default:
        index = -1;
    }

    return MyContainer(
      radius: 12.r,
      margin: EdgeInsets.symmetric(
        horizontal: kPadding24.w,
        vertical: kPadding12.h,
      ),
      padding: kPadding16.all,
      border: const BorderSide(color: AppColors.black5, width: 1),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText.boldParagraph('Order Status'),
          const Divider(color: AppColors.lightGrey),
          8.verticalSpace,
          OrderStatusCard(
            title: OrderStatus.pending.trackOrderName,
            // date: order.statusDates[OrderStatus.pending]?.toDate(),
            icon: AppIcons.orderPlaced,
            isEnabled: index >= 0,
          ),
          OrderStatusCard(
            title: OrderStatus.inProgress.trackOrderName,
            // date: order.statusDates[OrderStatus.inProgress]?.toDate(),
            icon: AppIcons.orderInProgress,
            isEnabled: index >= 1,
          ),
          OrderStatusCard(
            title: OrderStatus.shipped.trackOrderName,
            // date: order.statusDates[OrderStatus.shipped]?.toDate(),
            icon: AppIcons.orderShipped,
            isEnabled: index >= 2,
          ),
          OrderStatusCard(
            title: OrderStatus.completed.trackOrderName,
            // date: order.statusDates[OrderStatus.completed]?.toDate(),
            icon: AppIcons.orderDelivered,
            isEnabled: index >= 3,
            isLast: true,
          ),
          8.verticalSpace,
        ],
      ),
    );
  }
}
