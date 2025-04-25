import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:herdrobe_app/app/constants/paddings.dart';
import 'package:herdrobe_app/app/data/extensions/double.dart';
import 'package:herdrobe_app/app/modules/checkOut/views/widgets/checkout_item_card.dart';
import 'package:herdrobe_app/app/routes/app_pages.dart';
import 'package:herdrobe_app/app/utils/app_colors.dart';
import 'package:herdrobe_app/app/utils/app_icons.dart';
import 'package:herdrobe_app/app/utils/app_text_styles.dart';
import 'package:herdrobe_app/app/widgets/address_details_card.dart';
import 'package:herdrobe_app/app/widgets/custom_image.dart';
import 'package:herdrobe_app/app/widgets/custom_text.dart';
import 'package:herdrobe_app/app/widgets/my_appbar.dart';
import 'package:herdrobe_app/app/widgets/my_container.dart';
import 'package:herdrobe_app/app/widgets/my_rounded_button.dart';
import 'package:herdrobe_app/app/widgets/product_details_card.dart';
import 'package:herdrobe_app/main.dart';

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
                titleIcon: AppIcons.category,
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
                titleIcon: AppIcons.category,
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
                titleIcon: AppIcons.category,
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
            ],
          ),
        ),
      ),
      bottomNavigationBar: MyContainer(
        radius: 0,
        border: BorderSide(color: AppColors.lightGrey, width: 1),
        padding: EdgeInsets.symmetric(
          horizontal: kPadding24.w,
          vertical: kPadding24.h,
        ),
        child: RoundedButton.filledMedium(
          Row(
            children: [
              CustomText.boldParagraph('Chat Now', color: AppColors.white),
              8.horizontalSpace,
              Icon(CupertinoIcons.chevron_right, color: AppColors.white),
            ],
          ),
          onTap: () {
            // Get.toNamed(Routes.CHECK_OUT);
          },
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
