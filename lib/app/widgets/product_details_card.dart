import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:herdrobe_app/app/constants/paddings.dart';
import 'package:herdrobe_app/app/data/extensions/double.dart';
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
  const ProductDetailsCard({super.key, this.isFavorite = false})
    : _isListTile = false;
  final bool isFavorite;
  final bool _isListTile;

  ProductDetailsCard.listTile({super.key, this.isFavorite = false})
    : _isListTile = true;

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
      border: BorderSide(width: 1, color: AppColors.black.withOpacity(0.1)),
      radius: 15.r,
      child: MyListTile(
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
        trailing: CircleButton(
          icon: AppIcons.heart,
          iconColor: AppColors.black,
          backgroundColor: AppColors.cardColor,
          radius: 14.r,
        ),
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
            child: Container(
              alignment: Alignment.topRight,
              color: Colors.transparent,
              padding: kPadding8.all,
              child: CircleButton(
                icon: SvgPicture.asset(
                  isFavorite ? AppIcons.heartFilled : AppIcons.heart,
                  height: 13.h,
                  width: 13.w,
                  color: isFavorite ? AppColors.brand : AppColors.black,
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
