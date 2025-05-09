import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:herdrobe_app/app/modules/sellerDetails/views/widgets/my_sliver_app_bar.dart';
import 'package:herdrobe_app/app/modules/sellerDetails/views/widgets/personal_info.dart';
import 'package:herdrobe_app/app/modules/sellerDetails/views/widgets/prouct_listings.dart';
import '../controllers/seller_details_controller.dart';

class SellerDetailsView extends GetView<SellerDetailsController> {
  const SellerDetailsView({super.key});

  final bool isAdmin = false;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: NestedScrollView(
          physics:
              controller.currentIndex == 0
                  ? NeverScrollableScrollPhysics()
                  : null,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[MySliverAppBar()];
          },
          body: TabBarView(
            controller: controller.mainTabController,
            children: [PersonalInfo(), ProductListings()],
          ),
        ),
      ),
    );
  }
}
