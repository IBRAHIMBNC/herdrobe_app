import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:herdrobe_app/app/constants/paddings.dart';
import 'package:herdrobe_app/app/data/extensions/double.dart';
import 'package:herdrobe_app/app/modules/productDetails/views/widgets/related_product_section.dart';
import 'package:herdrobe_app/app/modules/productDetails/views/widgets/reviews_products_count.dart';
import 'package:herdrobe_app/app/routes/app_pages.dart';
import 'package:herdrobe_app/app/utils/app_colors.dart';
import 'package:herdrobe_app/app/utils/app_icons.dart';
import 'package:herdrobe_app/app/widgets/circle_button.dart';
import 'package:herdrobe_app/app/widgets/custom_image.dart';
import 'package:herdrobe_app/app/widgets/custom_text.dart';
import 'package:herdrobe_app/app/widgets/my_appbar.dart';
import 'package:herdrobe_app/app/widgets/my_container.dart';
import 'package:herdrobe_app/app/widgets/my_list_tile.dart';
import 'package:herdrobe_app/app/widgets/my_rounded_button.dart';
import '../controllers/product_details_controller.dart';

class ProductDetailsView extends GetView<ProductDetailsController> {
  const ProductDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(title: ''),
      body: SingleChildScrollView(
        child: Padding(
          padding: kPadding24.hp,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              16.verticalSpace,
              SizedBox(
                height: 337.h,
                child: PageView(
                  onPageChanged: (value) {
                    controller.currentImageIndex.value = value;
                  },
                  controller: controller.pageViewController,
                  children:
                      controller.images
                          .map(
                            (image) => CustomImage(
                              image,
                              height: 337.h,
                              radius: 20,
                              width: 1.sh,
                            ),
                          )
                          .toList(),
                ),
              ),
              16.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                    List.generate(
                      controller.images.length,
                      (index) => index,
                    ).map((i) {
                      return Obx(
                        () => MyContainer(
                          width: 8.w,
                          height: 8.h,
                          margin: EdgeInsets.symmetric(horizontal: 4.w),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                                controller.currentImageIndex.value == i
                                    ? AppColors.brand
                                    : AppColors.lightGrey,
                          ),
                        ),
                      );
                    }).toList(),
              ),
              MyListTile(
                color: AppColors.white,
                title: CustomText.mediumHeading('₹400'),
                subtitle: CustomText.boldParagraph(
                  'new electronic egg toy for kids ',
                ),
                trailing: Row(
                  children: [
                    CircleButton(
                      icon: AppIcons.heart,
                      iconColor: AppColors.black,
                    ),
                    8.horizontalSpace,
                    CircleButton(icon: AppIcons.share),
                  ],
                ),
              ),
              30.verticalSpace,
              _buildDetailsCard(),
              16.verticalSpace,
              _buildDescriptionCard(),
              16.verticalSpace,
              MyContainer(
                onTap: () {
                  Get.toNamed(Routes.SELLER_DETAILS);
                },
                padding: kPadding16.all,
                color: AppColors.cardColor,
                width: double.infinity,
                child: Column(
                  children: [
                    MyListTile(
                      leading: CircleAvatar(
                        backgroundColor: AppColors.brand,
                        radius: 20.r,
                      ),
                      title: CustomText.boldParagraph('The groom house'),
                      verticalSpacing: kPadding4.h,
                      subtitle: CustomText.small12(
                        '0346 54 34 567',
                        color: AppColors.textColor2,
                      ),
                      trailing: Padding(
                        padding: kPadding8.right,
                        child: Icon(
                          CupertinoIcons.arrow_right,
                          color: AppColors.brand,
                        ),
                      ),
                    ),
                    12.verticalSpace,
                    ReviewsProductsCount(),
                  ],
                ),
              ),
              24.verticalSpace,
              CustomText.boldParagraph('Related Products'),
              20.verticalSpace,
              RelatedProductSection(),
              20.verticalSpace,
            ],
          ),
        ),
      ),
      bottomNavigationBar: Hero(
        tag: 'bottomNavigationBar',
        child: MyContainer(
          radius: 0,
          border: BorderSide(color: AppColors.lightGrey, width: 1),
          padding: kPadding24.all,
          child: RoundedButton.filledMedium(
            Row(
              children: [
                CustomText.boldParagraph('Chat Now', color: AppColors.white),
                8.horizontalSpace,
                Icon(CupertinoIcons.chevron_right, color: AppColors.white),
              ],
            ),
            onTap: () {
              Get.toNamed(Routes.CHECK_OUT);
            },
          ),
        ),
      ),
    );
  }

  MyContainer _buildDescriptionCard() {
    return MyContainer(
      padding: kPadding16.all,
      border: BorderSide(color: AppColors.black.withOpacity(0.1), width: 1),
      child: Column(
        spacing: 12.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText.boldHeading18('Description'),

          CustomText.small12(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
            'Sed do eiusmod tempor incididunt ut labore et dolore '
            'magna aliqua. Ut enim ad minim veniam, quis nostrud '
            'exercitation ullamco laboris nisi ut aliquip ex ea '
            'commodo consequat. Duis aute irure dolor in reprehenderit '
            'in voluptate velit esse cillum dolore eu fugiat nulla '
            'pariatur. Excepteur sint occaecat cupidatat non proident, '
            'sunt in culpa qui officia deserunt mollit anim id est laborum.',
            color: AppColors.textColor2,
          ),
        ],
      ),
    );
  }

  MyContainer _buildDetailsCard() {
    return MyContainer(
      padding: kPadding16.all,
      border: BorderSide(color: AppColors.black.withOpacity(0.1), width: 1.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText.boldHeading18('Details'),
          _buildDetailsRow('Brand', 'Apple'),
          _buildDivider(),
          _buildDetailsRow('Condition', 'New'),
          _buildDivider(),
          _buildDetailsRow('Category', 'Electronics'),
        ],
      ),
    );
  }

  _buildDivider() {
    return Divider(color: AppColors.black.withOpacity(0.1), height: 1.w);
  }

  _buildDetailsRow(String title, String value) {
    return Padding(
      padding: EdgeInsets.only(
        top: kPadding20.h,
        bottom: kPadding12.h,
        right: kPadding8.w,
        left: kPadding8.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText.small12(title, color: AppColors.textColor2),
          CustomText.smallBold12(value),
        ],
      ),
    );
  }
}
