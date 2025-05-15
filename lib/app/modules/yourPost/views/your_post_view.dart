import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:herdrobe_app/app/constants/paddings.dart';
import 'package:herdrobe_app/app/data/extensions/double.dart';
import 'package:herdrobe_app/app/widgets/custom_tabbar.dart';
import 'package:herdrobe_app/app/widgets/my_appbar.dart';
import 'package:herdrobe_app/app/widgets/product_details_card.dart';

import '../controllers/your_post_controller.dart';

class YourPostView extends GetView<YourPostController> {
  const YourPostView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<YourPostController>(
      builder:
          (controller) => DefaultTabController(
            length: PostStatus.values.length,
            child: Scaffold(
              appBar: MyAppBar(
                title: 'Your Post',
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(
                    65.h,
                  ), // Set the height of the TabBar
                  child: Padding(
                    padding: kPadding24.hp,
                    child: CustomTabbar(
                      tabs:
                          PostStatus.values
                              .map((e) => Tab(text: e.capitalName))
                              .toList(),
                    ),
                  ),
                ),
              ),
              body: ListView.separated(
                padding: kPadding24.all,
                itemBuilder: (context, index) {
                  return ProductDetailsCard.listTile(
                    productModel: controller.myProducts[index],
                  );
                },
                separatorBuilder: (context, index) => 16.verticalSpace,
                itemCount: controller.myProducts.length,
              ),
            ),
          ),
    );
  }
}

enum PostStatus {
  all,
  active,
  inactive,
  sold;

  String get capitalName => name.capitalizeFirst!;
}
