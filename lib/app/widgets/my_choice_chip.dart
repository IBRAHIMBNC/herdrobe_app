import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:herdrobe_app/app/constants/paddings.dart';
import 'package:herdrobe_app/app/utils/app_colors.dart';
import 'package:herdrobe_app/app/widgets/custom_text.dart';
import 'package:herdrobe_app/app/widgets/my_container.dart';

class MyChoiceChip extends StatelessWidget {
  const MyChoiceChip({
    super.key,
    required this.text,
    required this.value,
    this.onChanged,
    this.isDisable = false,
    this.gap = kPadding8,
  });
  final String text;
  final bool value;
  final Function(bool?)? onChanged;
  final bool isDisable;
  final double gap;

  Color get backgroundColor => value ? AppColors.brand : AppColors.textColor2;

  @override
  Widget build(BuildContext context) {
    return MyContainer(
      onTap:
          isDisable
              ? null
              : () {
                onChanged!(value);
              },
      padding: const EdgeInsets.symmetric(
        horizontal: kPadding20,
        vertical: kPadding8,
      ),
      margin: EdgeInsets.only(right: gap),
      color: value ? AppColors.brand.withOpacity(0.1) : AppColors.cardColor,
      radius: 8.r,
      border: BorderSide(
        color: value ? AppColors.brand : Colors.transparent,
        width: 1,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomText.small12(
            text,
            color: value ? AppColors.brand : AppColors.textColor1,
          ),
        ],
      ),
    );
  }
}
