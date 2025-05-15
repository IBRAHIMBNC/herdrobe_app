import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:herdrobe_app/app/constants/paddings.dart';
import 'package:herdrobe_app/app/data/extensions/double.dart';
import 'package:herdrobe_app/app/data/models/product.dart';
import 'package:herdrobe_app/app/widgets/custom_text.dart';
import 'package:herdrobe_app/app/widgets/product_details_card.dart';

class ProductListings extends StatelessWidget {
  const ProductListings({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Padding(
        padding: kPadding24.hp,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText.mediumHeading('Listings', fontWeight: FontWeight.w600),
            16.verticalSpace,
            ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder:
                  (context, index) => ProductDetailsCard.listTile(
                    productModel: ProductModel.empty(),
                  ),
              separatorBuilder: (context, index) => 16.verticalSpace,
              itemCount: 7,
            ),
          ],
        ),
      ),
    );
  }
}
