import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:herdrobe_app/app/constants/paddings.dart';
import 'package:herdrobe_app/app/widgets/product_details_card.dart';

class ProductResultListing extends StatelessWidget {
  const ProductResultListing({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(vertical: kPadding16.h),
      itemBuilder: (context, index) => ProductDetailsCard.listTile(),
      separatorBuilder: (context, index) => 16.verticalSpace,
      itemCount: 10,
    );
  }
}
