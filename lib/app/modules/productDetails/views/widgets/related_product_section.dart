import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:herdrobe_app/app/constants/paddings.dart';
import 'package:herdrobe_app/app/widgets/product_details_card.dart';

class RelatedProductSection extends StatelessWidget {
  const RelatedProductSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
    );
  }
}
