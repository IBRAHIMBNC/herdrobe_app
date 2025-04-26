import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:herdrobe_app/app/data/models/order.dart';
import 'package:herdrobe_app/app/utils/app_colors.dart';
import 'package:herdrobe_app/app/utils/app_icons.dart';
import 'package:herdrobe_app/app/widgets/custom_image.dart';
import 'package:herdrobe_app/app/widgets/custom_text.dart';
import 'package:herdrobe_app/app/widgets/my_container.dart';
import 'package:herdrobe_app/app/widgets/product_details_card.dart';

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
    return InkWell(
      onTap: onTap,
      child: MyContainer(
        radius: 16.r,
        padding: EdgeInsets.all(10.sp),
        shadow: BoxShadow(
          color: AppColors.black.withOpacity(0.1),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomImage.fromSize(
                  AppIcons.cart,
                  size: 20.w,
                  color: AppColors.black,
                ),
                9.horizontalSpace,
                CustomText.small12(
                  'Order ID: ${44444}',
                  color: AppColors.textColor1,
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
          ],
        ),
      ),
    );
  }
}
