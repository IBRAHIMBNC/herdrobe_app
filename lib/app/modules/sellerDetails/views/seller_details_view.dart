import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:herdrobe_app/app/constants/paddings.dart';
import 'package:herdrobe_app/app/data/extensions/double.dart';
import 'package:herdrobe_app/app/modules/sellerDetails/views/widgets/my_sliver_app_bar.dart';

import 'package:herdrobe_app/app/widgets/custom_text.dart';
import 'package:herdrobe_app/app/widgets/product_details_card.dart';

import '../controllers/seller_details_controller.dart';

class SellerDetailsView extends GetView<SellerDetailsController> {
  const SellerDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Use CustomScrollView to enable sliver effects
      body: CustomScrollView(
        slivers: <Widget>[
          // Use SliverAppBar for the expandable/collapsible effect
          MySliverAppBar(),
          // The rest of your page content goes here, wrapped in Slivers
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: kPadding24.hp,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText.mediumHeading(
                      'Listings',
                      fontWeight: FontWeight.w600,
                    ),
                    16.verticalSpace,
                    ListView.separated(
                      shrinkWrap: true,
                      padding: 0.0.all,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder:
                          (context, index) => ProductDetailsCard.listTile(),
                      separatorBuilder: (context, index) => 16.verticalSpace,
                      itemCount: 7,
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
