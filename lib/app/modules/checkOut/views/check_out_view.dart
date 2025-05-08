import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:herdrobe_app/app/constants/paddings.dart';
import 'package:herdrobe_app/app/data/enums/payment_method.dart';
import 'package:herdrobe_app/app/data/extensions/double.dart';
import 'package:herdrobe_app/app/modules/checkOut/views/widgets/checkout_item_card.dart';
import 'package:herdrobe_app/app/utils/app_colors.dart';
import 'package:herdrobe_app/app/utils/app_icons.dart';
import 'package:herdrobe_app/app/utils/app_text_styles.dart';
import 'package:herdrobe_app/app/widgets/address_details_card.dart';
import 'package:herdrobe_app/app/widgets/bottom_sheets/confirmation_sheet.dart';
import 'package:herdrobe_app/app/widgets/custom_text.dart';
import 'package:herdrobe_app/app/widgets/my_appbar.dart';
import 'package:herdrobe_app/app/widgets/my_container.dart';
import 'package:herdrobe_app/app/widgets/my_list_tile.dart';
import 'package:herdrobe_app/app/widgets/my_rounded_button.dart';
import 'package:herdrobe_app/app/widgets/product_details_card.dart';
import '../controllers/check_out_controller.dart';

class CheckOutView extends GetView<CheckOutController> {
  const CheckOutView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Checkout'),
      body: SingleChildScrollView(
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
                  child: Obx(
                    () => Column(
                      children: [
                        MyListTile(
                          leading: CircleAvatar(),
                          title: 'EasyPaisa',
                          subtitle: '0346 1599161',
                          trailing: Radio<PaymentMethodType>(
                            value: PaymentMethodType.easyPaisa,
                            groupValue: controller.selectedPaymentMethod.value,
                            onChanged: (value) {
                              controller.selectedPaymentMethod.value = value!;
                            },
                          ),
                        ),
                        Divider(
                          color: AppColors.textColor2.withOpacity(0.2),
                          height: 40.h,
                        ),
                        MyListTile(
                          leading: CircleAvatar(),
                          title: 'Jazz Cash',
                          subtitle: '0346 1599161',
                          trailing: Radio<PaymentMethodType>(
                            value: PaymentMethodType.jazzCash,
                            groupValue: controller.selectedPaymentMethod.value,
                            onChanged: (value) {
                              controller.selectedPaymentMethod.value = value!;
                            },
                          ),
                        ),
                      ],
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
      ),
      bottomNavigationBar: Hero(
        tag: 'bottomNavigationBar',
        child: MyContainer(
          radius: 0,
          border: BorderSide(color: AppColors.black5, width: 1),
          padding: EdgeInsets.symmetric(
            horizontal: kPadding24.w,
            vertical: kPadding24.h,
          ),
          child: RoundedButton.filledMedium(
            Row(
              children: [
                CustomText.boldParagraph(
                  'Confirm Order',
                  color: AppColors.white,
                ),
                8.horizontalSpace,
                Icon(CupertinoIcons.chevron_right, color: AppColors.white),
              ],
            ),
            onTap: () {
              Get.bottomSheet(
                ConfirmationSheet(
                  imagePath: 'assets/lottie/done.json',
                  size: 180.w,
                  title: 'Order Placed Successfully',
                  message:
                      'Thank you! Your order is confirmed. Check your email for details.',
                  onCancelTap: () {
                    // Get.toNamed(Routes.CHECK_OUT);
                  },
                  confirmBtnText: 'View Order',
                  cancelBtnText: 'Go Home',
                  onConfirmTap: () {
                    // Get.offAllNamed(Routes.HOME);
                  },
                ),
              );
            },
          ),
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
