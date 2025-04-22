import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:herdrobe_app/app/constants/paddings.dart';
import 'package:herdrobe_app/app/extensions/double.dart';
import 'package:herdrobe_app/app/utils/app_colors.dart';
import 'package:herdrobe_app/app/utils/app_icons.dart';
import 'package:herdrobe_app/app/utils/my_utils.dart';
import 'package:herdrobe_app/app/widgets/circle_button.dart';
import 'package:herdrobe_app/app/widgets/custom_text.dart';
import 'package:herdrobe_app/app/widgets/my_container.dart';
import 'package:herdrobe_app/app/widgets/product_details_card.dart';

class NearYouSection extends StatelessWidget {
  const NearYouSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kPadding24.left,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText.boldParagraph('Near You'),
          16.verticalSpace,
          Container(
            height: 190.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              separatorBuilder: (context, index) => kPadding16.horizontalSpace,
              itemBuilder: (context, index) {
                return ProductDetailsCard();
              },
            ),
          ),
        ],
      ),
    );
  }
}
