import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:herdrobe_app/app/constants/paddings.dart';
import 'package:herdrobe_app/app/utils/app_colors.dart';
import 'package:herdrobe_app/app/utils/app_icons.dart';
import 'package:herdrobe_app/app/utils/my_utils.dart';
import 'package:herdrobe_app/app/widgets/circle_button.dart';
import 'package:herdrobe_app/app/widgets/custom_text.dart';
import 'package:herdrobe_app/app/widgets/my_card.dart';
import 'package:herdrobe_app/app/widgets/my_container.dart';

class ProductResultListing extends StatelessWidget {
  const ProductResultListing({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => _buildItem(),
      separatorBuilder: (context, index) => 16.verticalSpace,
      itemCount: 10,
    );
  }

  Widget _buildItem() => MyContainer(
    onTap: () {},
    padding: EdgeInsets.symmetric(
      horizontal: kPadding8.w,
      vertical: kPadding8.h,
    ),
    border: BorderSide(width: 1, color: AppColors.black.withOpacity(0.1)),
    radius: 15.r,
    child: Expanded(
      child: MyCard(
        color: AppColors.white,
        leading: MyContainer(
          width: 100.w,
          radius: 10.r,
          height: 85.h,
          backgroundImage: DecorationImage(
            image: MyUtils.buildImageProvider(MyUtils.getTempLink()),
            fit: BoxFit.cover,
          ),
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
    ),
  );
}
