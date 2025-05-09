import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:herdrobe_app/app/constants/paddings.dart';
import 'package:herdrobe_app/app/data/extensions/double.dart';
import 'package:herdrobe_app/app/data/extensions/enum.dart';
import 'package:herdrobe_app/app/utils/app_colors.dart';
import 'package:herdrobe_app/app/utils/app_text_styles.dart';
import 'package:herdrobe_app/app/widgets/custom_text.dart';
import 'package:herdrobe_app/app/widgets/my_container.dart';

class SelectableContainers<T extends Enum> extends StatelessWidget {
  const SelectableContainers({
    super.key,
    required this.sections,
    required this.currentValue,
    this.onChanged,
  });

  final List<T> sections;
  final T currentValue;
  final Function(T value)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:
          sections
              .map(
                (section) => MyContainer(
                  alignment: Alignment.centerLeft,
                  width: double.infinity,
                  onTap: () {
                    if (onChanged != null) {
                      onChanged!(section);
                    }
                  },
                  radius: 8.r,
                  color:
                      section == currentValue
                          ? AppColors.brand
                          : Colors.transparent,
                  padding: kPadding12.all,
                  child: CustomText(
                    section.capitalizeFirst,
                    style: AppTextStyles.paragraph14.copyWith(
                      color:
                          section == currentValue
                              ? AppColors.white
                              : AppColors.textColor2,
                      fontWeight:
                          section == currentValue
                              ? FontWeight.w600
                              : FontWeight.normal,
                    ),
                  ),
                ),
              )
              .toList(),
    );
  }
}
