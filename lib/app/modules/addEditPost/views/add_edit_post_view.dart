import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:herdrobe_app/app/constants/paddings.dart';
import 'package:herdrobe_app/app/data/enums/product_size.dart';
import 'package:herdrobe_app/app/data/enums/products_category.dart';
import 'package:herdrobe_app/app/data/enums/rent_period.dart';
import 'package:herdrobe_app/app/data/extensions/double.dart';
import 'package:herdrobe_app/app/data/extensions/enum.dart';
import 'package:herdrobe_app/app/utils/app_colors.dart';
import 'package:herdrobe_app/app/utils/app_icons.dart';
import 'package:herdrobe_app/app/utils/auth_validators.dart';
import 'package:herdrobe_app/app/utils/loading_overlay.dart';
import 'package:herdrobe_app/app/widgets/%20my_drop_down.dart';
import 'package:herdrobe_app/app/widgets/address_details_card.dart';
import 'package:herdrobe_app/app/widgets/bottom_sheets/confirmation_sheet.dart';
import 'package:herdrobe_app/app/widgets/custom_tabbar.dart';
import 'package:herdrobe_app/app/widgets/custom_text.dart';
import 'package:herdrobe_app/app/widgets/custom_text_field.dart';
import 'package:herdrobe_app/app/widgets/my_appbar.dart';
import 'package:herdrobe_app/app/widgets/my_container.dart';
import 'package:herdrobe_app/app/widgets/my_rounded_button.dart';

import '../controllers/add_edit_post_controller.dart';

class AddEditPostView extends GetView<AddEditPostController> {
  const AddEditPostView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddEditPostController>(
      builder:
          (controller) => DefaultTabController(
            length: PostType.values.length,
            child: Scaffold(
              appBar: MyAppBar(title: 'Post Your Ad'),
              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: kPadding24.w,
                    vertical: kPadding16.h,
                  ),
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      spacing: 16.h,
                      children: [
                        CustomTabbar(
                          tabs:
                              PostType.values
                                  .map(
                                    (type) => Tab(text: type.capitalizeFirst),
                                  )
                                  .toList(),
                          onTabChanged: controller.onTypeChanged,
                        ),
                        MyContainer(
                          radius: 10.r,
                          padding: kPadding8.all,
                          border: BorderSide(
                            color: Colors.grey.shade300,
                            width: 1,
                          ),
                          child: Row(
                            children: [
                              MyContainer(
                                color: AppColors.brand,
                                radius: 8.r,
                                padding: EdgeInsets.symmetric(
                                  horizontal: kPadding20.w,
                                  vertical: kPadding12.h,
                                ),
                                child: CustomText(
                                  'Upload Photos',
                                  color: AppColors.white,
                                ),
                              ),
                              16.horizontalSpace,
                              CustomText(
                                'No photos selected',
                                color: AppColors.textColor2,
                              ),
                            ],
                          ),
                        ),
                        CustomTextField(
                          controller: controller.titleCont,
                          hinText: 'Product Name',
                          labelText: 'Name',
                          validator: AuthValidators.required,
                        ),
                        CustomTextField(
                          controller: controller.descriptionCont,
                          hinText: 'About Product',
                          labelText: 'Description',
                          validator: AuthValidators.required,
                          lines: 4,
                        ),
                        if (controller.type != PostType.swap)
                          Row(
                            children: [
                              Expanded(
                                child: CustomTextField(
                                  controller: controller.priceCont,
                                  hinText: 'Rs. 0.0',
                                  labelText: 'Price',
                                  validator: AuthValidators.required,
                                ),
                              ),
                              if (controller.type == PostType.rent) ...[
                                8.horizontalSpace,
                                CustomText.mediumHeading('/'),
                                8.horizontalSpace,
                                MyDropDownButton(
                                  width: 120.w,
                                  value: controller.rentType.capitalizeFirst,
                                  items:
                                      RentPeriod.values
                                          .map((type) => type.capitalizeFirst)
                                          .toList(),
                                  onChanged: (p0) {
                                    controller.rentType = RentPeriod.fromString(
                                      p0.toLowerCase(),
                                    );
                                    print(controller.rentType);
                                  },
                                  bgColor: AppColors.cardColor,
                                ),
                              ],
                            ],
                          ),

                        MyDropDownButton(
                          width: double.infinity,
                          items:
                              ProductSize.values
                                  .map((size) => size.name)
                                  .toList(),
                          hint: 'Select Size',
                          onChanged: (p0) {},
                        ),
                        MyDropDownButton(
                          width: double.infinity,
                          items:
                              ProductsCategory.values
                                  .map((size) => size.capitalizeFirst)
                                  .toList(),
                          hint: 'Category',
                          onChanged: (p0) {},
                        ),

                        CustomTextField(
                          controller: controller.contactCont,
                          hinText: '03XX XXXXXX',
                          labelText: 'Contact No.',
                          validator: AuthValidators.required,
                        ),
                        MyContainer(
                          border: BorderSide(
                            color: AppColors.black.withOpacity(0.1),
                            width: 1,
                          ),
                          child: AddressDetailsCard(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              bottomNavigationBar: MyContainer(
                radius: 0,
                border: BorderSide(color: AppColors.lightGrey, width: 1),
                padding: EdgeInsets.symmetric(
                  horizontal: kPadding24.w,
                  vertical: kPadding24.h,
                ),
                child: RoundedButton.filledMedium(
                  Row(
                    children: [
                      CustomText.boldParagraph(
                        'Post Now',
                        color: AppColors.white,
                      ),
                      8.horizontalSpace,
                      Icon(
                        CupertinoIcons.chevron_right,
                        color: AppColors.white,
                      ),
                    ],
                  ),
                  onTap: () {
                    Get.bottomSheet(
                      ConfirmationSheet(
                        imagePath: AppIcons.alert,
                        titlePadding: kPadding12.top,
                        title: 'Post Your Ad',
                        message:
                            'Are you sure you want to post this ad? It will be visible to all users.',
                        confirmBtnText: 'Confirm',
                        cancelBtnText: 'Go Back',
                        onConfirmTap: () {
                          controller.addPost();
                          // isAppLoadin = false;
                          Get.back();
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
    );
  }
}
