import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:herdrobe_app/app/constants/paddings.dart';
import 'package:herdrobe_app/app/data/enums/user_type.dart';
import 'package:herdrobe_app/app/data/extensions/double.dart';
import 'package:herdrobe_app/app/utils/app_icons.dart';
import 'package:herdrobe_app/app/widgets/custom_tabbar.dart';
import 'package:herdrobe_app/app/widgets/custom_text.dart';
import 'package:herdrobe_app/app/widgets/custom_text_field.dart';

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: UserType.values.length - 1,
      child: Padding(
        padding: kPadding24.hp,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            12.verticalSpace,
            CustomText.paragraph('User Type'),
            8.verticalSpace,
            Builder(
              builder: (context) {
                return CustomTabbar(
                  isDisabled: true,
                  tabs: [
                    Tab(text: 'Buyer'),
                    Tab(text: 'Seller'),
                    Tab(text: 'Both'),
                  ],
                );
              },
            ),
            16.verticalSpace,
            CustomTextField(
              prefixIcon: AppIcons.phone,
              hinText: 'Phone',
              textInputAction: TextInputAction.next,
            ),
            16.verticalSpace,
            CustomTextField(
              prefixIcon: AppIcons.map,
              hinText: 'Location',
              textInputAction: TextInputAction.next,
            ),
            16.verticalSpace,
            CustomTextField(
              prefixIcon: AppIcons.cnic,
              hinText: 'CNIC (Optional)',
            ),
          ],
        ),
      ),
    );
  }
}
