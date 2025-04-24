import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:herdrobe_app/app/constants/paddings.dart';
import 'package:herdrobe_app/app/utils/app_colors.dart';
import 'package:herdrobe_app/app/widgets/my_container.dart';

class MyBackButton extends StatelessWidget {
  const MyBackButton({super.key, this.onPressed, this.padding});
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onPressed ?? () {},
      child: MyContainer(
        padding: padding ?? EdgeInsets.zero,
        radius: 10.r,
        margin: EdgeInsets.symmetric(
          horizontal: kPadding16.w,
          vertical: kPadding8.h,
        ),
        alignment: Alignment.center,
        color: AppColors.textField,
        // child: SvgPicture.asset(
        //   AppIcons.backIcon,
        //   height: 14.sp,
        //   color: AppColors.textColor1,
        // ),
      ),
    );
  }
}
