import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:herdrobe_app/app/constants/paddings.dart';
import 'package:herdrobe_app/app/routes/app_pages.dart';
import 'package:herdrobe_app/app/utils/app_colors.dart';
import 'package:herdrobe_app/app/utils/app_icons.dart';
import 'package:herdrobe_app/app/utils/my_utils.dart';
import 'package:herdrobe_app/app/widgets/circle_button.dart';
import 'package:herdrobe_app/app/widgets/custom_text.dart';
import 'package:herdrobe_app/app/widgets/my_container.dart';

class ProductDetailsCard extends StatelessWidget {
  const ProductDetailsCard({super.key, this.isFavorite = false});
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
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
          MyContainer(
            radius: 0,
            height: 130.h,
            alignment: Alignment.topRight,
            padding: EdgeInsets.all(kPadding8.sp),
            backgroundImage: DecorationImage(
              image: CachedNetworkImageProvider(MyUtils.getTempLink()),
              fit: BoxFit.cover,
            ),
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
