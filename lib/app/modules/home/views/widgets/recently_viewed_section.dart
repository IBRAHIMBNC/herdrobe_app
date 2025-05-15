import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:herdrobe_app/app/constants/paddings.dart';
import 'package:herdrobe_app/app/data/extensions/double.dart';
import 'package:herdrobe_app/app/data/models/product.dart';
import 'package:herdrobe_app/app/widgets/custom_text.dart';
import 'package:herdrobe_app/app/widgets/product_details_card.dart';

class RecentViewedSection extends StatelessWidget {
  const RecentViewedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kPadding24.left,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText.boldParagraph('Recently Viewed'),
          16.verticalSpace,
          Container(
            height: 190.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              separatorBuilder: (context, index) => kPadding16.horizontalSpace,
              itemBuilder: (context, index) {
                return ProductDetailsCard(productModel: ProductModel.empty());
              },
            ),
          ),
        ],
      ),
    );
  }
}
