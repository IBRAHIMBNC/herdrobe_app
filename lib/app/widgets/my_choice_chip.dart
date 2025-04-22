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
        horizontal: kPadding16,
        vertical: kPadding8,
      ),
      margin: EdgeInsets.only(right: gap),
      color: backgroundColor,
      radius: 50.r,
      border: BorderSide(color: backgroundColor, width: 1),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [CustomText.small12(text, color: AppColors.white)],
      ),
    );
  }
}
