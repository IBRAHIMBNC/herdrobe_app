import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:herdrobe_app/app/constants/paddings.dart';
import 'package:herdrobe_app/app/data/extensions/double.dart';
import 'package:herdrobe_app/app/data/models/cart_item.dart';
import 'package:herdrobe_app/app/routes/app_pages.dart';
import 'package:herdrobe_app/app/utils/app_colors.dart';
import 'package:herdrobe_app/app/utils/app_icons.dart';
import 'package:herdrobe_app/app/utils/my_utils.dart';
import 'package:herdrobe_app/app/widgets/circle_button.dart';
import 'package:herdrobe_app/app/widgets/custom_image.dart';
import 'package:herdrobe_app/app/widgets/custom_text.dart';
import 'package:herdrobe_app/app/widgets/my_container.dart';
import 'package:herdrobe_app/app/widgets/my_list_tile.dart';

class ProductDetailsCard extends StatelessWidget {
  const ProductDetailsCard({
    super.key,
    this.isFavorite = false,
    this.productModel,
  }) : _isListTile = false,
       _showBorder = true;
  final bool? isFavorite;
  final bool _isListTile;
  final bool _showBorder;
  final ProductModel? productModel;

  ProductDetailsCard.listTile({
    super.key,
    this.isFavorite,
    bool showBorder = true,
    this.productModel,
  }) : _isListTile = true,
       _showBorder = showBorder;

  @override
  Widget build(BuildContext context) {
    if (_isListTile) return _buildListTileCard();
    return _buildGridCard();
  }

  MyContainer _buildListTileCard() {
    return MyContainer(
      onTap: () {},
      padding: EdgeInsets.symmetric(
        horizontal: kPadding8.w,
        vertical: kPadding8.h,
      ),
      border:
          _showBorder
              ? BorderSide(width: 1, color: AppColors.black.withOpacity(0.1))
              : null,
      radius: 15.r,
      child: Stack(
        fit: StackFit.loose,
        children: [
          MyListTile(
            color: AppColors.white,
            leading: CustomImage(
              MyUtils.getTempLink(),
              width: 100.w,
              radius: 10.r,
              height: 85.h,
            ),
            title: MyContainer(
              padding: EdgeInsets.symmetric(
                horizontal: kPadding8.w,
                vertical: kPadding4.h,
              ),
              color: AppColors.cardColor,
              child: CustomText.smaller('Rent', color: AppColors.textColor1),
            ),
            // spacing: kPadding12.w,

            // leading: CircleAvatar(
            //     backgroundImage:
            //         MyUtils.buildImageProvider(seller.imageUrl)),
            subtitle: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 4.h,
              children: [
                CustomText.smallHeading16('Rs 4,000'),
                CustomText.paragraph('walima maxi'),
                CustomText.smaller(
                  'Abdullah Town, Lahore | 2 days ago ',
                  color: AppColors.textColor2,
                ),
              ],
            ),
            padding: EdgeInsets.zero,

            crossAxisAlignment: CrossAxisAlignment.start,
          ),
          if (isFavorite != null)
            Align(
              alignment: Alignment.topRight,
              child: CircleButton(
                icon:
                    isFavorite == false ? AppIcons.heart : AppIcons.heartFilled,
                iconColor:
                    isFavorite == false ? AppColors.black : AppColors.brand,
                backgroundColor: AppColors.cardColor,
                radius: 14.r,
              ),
            ),
        ],
      ),
    );
  }

  MyContainer _buildGridCard() {
    return MyContainer(
      onTap: () {
        Get.toNamed(Routes.PRODUCT_DETAILS);
      },
      padding: EdgeInsets.zero,
      radius: 0,

      width: 165.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImage(
            MyUtils.getTempLink(),
            radius: 0,
            height: 130.h,
            width: double.infinity,
            child:
                isFavorite == null
                    ? null
                    : Container(
                      alignment: Alignment.topRight,
                      color: Colors.transparent,
                      padding: kPadding8.all,
                      child: CircleButton(
                        icon: SvgPicture.asset(
                          isFavorite == true
                              ? AppIcons.heartFilled
                              : AppIcons.heart,
                          height: 13.h,
                          width: 13.w,
                          color:
                              isFavorite == true
                                  ? AppColors.brand
                                  : AppColors.black,
                        ),
                        radius: 12.r,
                      ),
                    ),
          ),
          4.verticalSpace,
          Row(
            children: [
              Expanded(child: CustomText.smallBold12('Rs 450,000')),
              CustomText.small12('2 days ago'),
            ],
          ),
          4.verticalSpace,
          CustomText.small12('walima maxi'),
          4.verticalSpace,
          CustomText.smaller(
            'Abdullah Town, Lahore',
            fontSize: 8,
            color: AppColors.textColor2,
          ),
        ],
      ),
    );
  }
}
