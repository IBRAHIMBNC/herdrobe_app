import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:herdrobe_app/app/constants/paddings.dart';
import 'package:herdrobe_app/app/utils/app_colors.dart';
import 'package:herdrobe_app/app/utils/my_utils.dart';
import 'package:herdrobe_app/app/widgets/custom_image.dart';
import 'package:herdrobe_app/app/widgets/custom_text.dart';
import 'package:herdrobe_app/app/widgets/my_container.dart';
import 'package:herdrobe_app/app/widgets/my_list_tile.dart';

class AddressDetailsCard extends StatelessWidget {
  const AddressDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return MyListTile(
      radius: 12.r,
      padding: EdgeInsets.symmetric(
        horizontal: kPadding16.w,
        vertical: kPadding12.h,
      ),
      leading: CustomImage(
        MyUtils.getTempLink(),
        width: 100.w,
        radius: 10.r,
        height: 82.h,
      ),
      title: CustomText.smallHeading16('Annie general store'),
      verticalSpacing: kPadding8.h,
      subtitle: CustomText.small12('Peshawar', color: AppColors.textColor2),
      trailing: Icon(CupertinoIcons.chevron_right, size: 20.r),
    );
  }
}
