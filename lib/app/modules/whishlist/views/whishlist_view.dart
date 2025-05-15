import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:herdrobe_app/app/constants/paddings.dart';
import 'package:herdrobe_app/app/data/extensions/double.dart';
import 'package:herdrobe_app/app/data/models/product.dart';
import 'package:herdrobe_app/app/widgets/my_appbar.dart';
import 'package:herdrobe_app/app/widgets/product_details_card.dart';

import '../controllers/whishlist_controller.dart';

class WhishlistView extends GetView<WhishlistController> {
  const WhishlistView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Whishlist'),
      body: Padding(
        padding: kPadding24.hp,
        child: Column(
          children: [
            16.verticalSpace,
            ProductDetailsCard.listTile(
              productModel: ProductModel.empty(),
              isFavorite: true,
            ),
            16.verticalSpace,
            ProductDetailsCard.listTile(
              productModel: ProductModel.empty(),
              isFavorite: true,
            ),
          ],
        ),
      ),
    );
  }
}
