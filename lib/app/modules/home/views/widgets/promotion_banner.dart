import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/state_manager.dart';
import 'package:herdrobe_app/app/modules/home/controllers/home_controller.dart';
import 'package:herdrobe_app/app/utils/app_colors.dart';
import 'package:herdrobe_app/app/widgets/my_container.dart';

class PromotionBanner extends GetView<HomeController> {
  const PromotionBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16.h),
        CarouselSlider(
          options: CarouselOptions(
            height: 180.h,
            viewportFraction: 0.85,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 5),
            autoPlayAnimationDuration: Duration(milliseconds: 600),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              controller.onBannerChanged(index);
            },
            scrollDirection: Axis.horizontal,
          ),
          items:
              controller.banners.map((banner) {
                return MyContainer(
                  backgroundImage: DecorationImage(
                    image: CachedNetworkImageProvider(banner),
                    fit: BoxFit.cover,
                  ),
                );
              }).toList(),
        ),
        SizedBox(height: 10.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
              List.generate(
                controller.banners.length,
                (index) => index + 1,
              ).map((i) {
                return Obx(
                  () => MyContainer(
                    width: 8.w,
                    height: 8.h,
                    margin: EdgeInsets.symmetric(horizontal: 4.w),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          controller.currentBannerIndex.value == i - 1
                              ? AppColors.brand
                              : AppColors.lightGrey,
                    ),
                  ),
                );
              }).toList(),
        ),
      ],
    );
  }
}
