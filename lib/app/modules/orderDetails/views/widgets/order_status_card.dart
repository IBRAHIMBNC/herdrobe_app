import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:herdrobe_app/app/constants/paddings.dart';
import 'package:herdrobe_app/app/utils/app_colors.dart';
import 'package:herdrobe_app/app/widgets/custom_text.dart';
import 'package:herdrobe_app/app/widgets/my_list_tile.dart';
import 'package:intl/intl.dart';

class OrderStatusCard extends StatelessWidget {
  const OrderStatusCard({
    super.key,
    required this.title,
    this.date,
    required this.icon,
    this.isEnabled = false,
    this.isLast = false,
  });
  final String title;
  final DateTime? date;
  final String icon;
  final bool isEnabled;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyListTile(
          title: CustomText.boldParagraph(title),
          leading: CircleAvatar(
            radius: 12.r,
            backgroundColor: isEnabled ? AppColors.brand : AppColors.lightGrey,
            child: Icon(Icons.done, size: 15.sp),
          ),
          subtitle:
              date != null
                  ? CustomText.small12(
                    DateFormat('MMM dd, yyyy').format(date!),
                    color: AppColors.grey,
                  )
                  : null,
          trailing: SvgPicture.asset(
            icon,
            height: 25.sp,
            color: isEnabled ? AppColors.brand : AppColors.lightGrey,
          ),
        ),
        if (!isEnabled) 4.horizontalSpace,
        if (!isLast)
          _buildDivider(isEnabled ? AppColors.brand : AppColors.lightGrey),
        4.horizontalSpace,
      ],
    );
  }

  Container _buildDivider([Color? color]) {
    return Container(
      height: 35.h,
      padding: EdgeInsets.symmetric(horizontal: kPadding4.w),
      child: VerticalDivider(color: color ?? AppColors.brand, thickness: 2),
    );
  }
}
