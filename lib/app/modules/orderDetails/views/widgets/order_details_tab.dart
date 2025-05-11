import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:herdrobe_app/app/constants/paddings.dart';
import 'package:herdrobe_app/app/data/enums/payment_method.dart';
import 'package:herdrobe_app/app/data/extensions/double.dart';
import 'package:herdrobe_app/app/data/models/order.dart';
import 'package:herdrobe_app/app/modules/checkOut/views/widgets/checkout_item_card.dart';
import 'package:herdrobe_app/app/utils/app_colors.dart';
import 'package:herdrobe_app/app/utils/app_icons.dart';
import 'package:herdrobe_app/app/utils/app_text_styles.dart';
import 'package:herdrobe_app/app/widgets/address_details_card.dart';
import 'package:herdrobe_app/app/widgets/custom_text.dart';
import 'package:herdrobe_app/app/widgets/my_list_tile.dart';
import 'package:herdrobe_app/app/widgets/product_details_card.dart';

class OrderDetailsTab extends StatelessWidget {
  const OrderDetailsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final order = OrderModel.empty;
    return SingleChildScrollView(
      child: Padding(
        padding: kPadding24.hp,
        child: Column(
          children: [
            16.verticalSpace,
            CheckoutItemCard(
              titleIcon: AppIcons.map,
              title: 'Delivery Address',
              child: Column(children: [AddressDetailsCard()]),
            ),
            16.verticalSpace,
            CheckoutItemCard(
              titleIcon: AppIcons.cart,
              title: 'Your Order',
              child: Column(
                children: [
                  Padding(
                    padding: kPadding8.all,
                    child: ProductDetailsCard.listTile(showBorder: false),
                  ),
                ],
              ),
            ),
            16.verticalSpace,
            CheckoutItemCard(
              titleIcon: AppIcons.paymentMethod,
              title: 'Payment Method',
              child: Padding(
                padding: kPadding16.all,
                child: MyListTile(
                  leading: CircleAvatar(),
                  title: 'EasyPaisa',
                  subtitle: '0346 1599161',
                  trailing: Radio<PaymentMethodType>(
                    value: PaymentMethodType.easyPaisa,
                    groupValue: PaymentMethodType.easyPaisa,
                    onChanged: (value) {
                      // controller.selectedPaymentMethod.value = value!;
                    },
                  ),
                ),
              ),
            ),
            16.verticalSpace,
            CheckoutItemCard(
              titleIcon: AppIcons.summary,
              title: 'Review Summary',
              child: Padding(
                padding: kPadding16.all,
                child: Column(
                  children: [
                    _buildInfoCard({
                      'Subtotal': 'PKR 500',
                      'Shipping': 'PKR 50',
                    }),
                    Divider(
                      color: AppColors.textColor2.withOpacity(0.2),
                      height: 20.h,
                    ),
                    _buildInfoCard({'Total': 'PKR 550'}, isBold: true),
                  ],
                ),
              ),
            ),
            16.verticalSpace,
            CheckoutItemCard(
              titleIcon: AppIcons.info,
              title: 'Purchase Details',
              child: Padding(
                padding: kPadding16.all,
                child: _buildInfoCard({
                  'purchase date': '23 July, 2023',
                  'Shipping': 'Cash on delivery',
                  'Receipt Number': '#123456789',
                }),
              ),
            ),
            16.verticalSpace,
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(Map<String, String> data, {bool isBold = false}) {
    return Column(
      children: [
        Column(
          spacing: 8.h,
          children: [
            ...data.entries.map(
              (entry) => Row(
                children: [
                  CustomText(
                    entry.key,
                    style: AppTextStyles.paragraph14.copyWith(
                      fontWeight: isBold ? FontWeight.w600 : FontWeight.w400,
                      color: isBold ? AppColors.black : AppColors.textColor2,
                    ),
                  ),
                  const Spacer(),
                  CustomText(
                    entry.value,
                    style: AppTextStyles.paragraph14.copyWith(
                      fontWeight: isBold ? FontWeight.w600 : FontWeight.w400,
                      color: isBold ? AppColors.black : AppColors.textColor2,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class TitleAndPrice extends StatelessWidget {
  const TitleAndPrice({
    super.key,
    required this.title,
    required this.price,
    this.time,
  });
  final String title;
  final String price;
  final int? time;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: kPadding8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: CustomText.small12(title)),
          if (time == null)
            CustomText.smallBold12(price, textAlign: TextAlign.end)
          else
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CustomText.small12('$time mins'),
                CustomText.smallBold12(price),
              ],
            ),
        ],
      ),
    );
  }
}
