import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:herdrobe_app/app/constants/paddings.dart';
import 'package:herdrobe_app/app/data/enums/rent_period.dart';
import 'package:herdrobe_app/app/data/extensions/enum.dart';
import 'package:herdrobe_app/app/modules/addEditPost/views/widgets/UploadPhotos_widget.dart';
import 'package:herdrobe_app/app/utils/app_colors.dart';
import 'package:herdrobe_app/app/utils/auth_validators.dart';
import 'package:herdrobe_app/app/widgets/%20my_drop_down.dart';
import 'package:herdrobe_app/app/widgets/address_details_card.dart';
import 'package:herdrobe_app/app/widgets/custom_tabbar.dart';
import 'package:herdrobe_app/app/widgets/custom_text.dart';
import 'package:herdrobe_app/app/widgets/custom_text_field.dart';
import 'package:herdrobe_app/app/widgets/generic_bottom_sheet.dart';
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
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                        UploadPhotos(),
                        CustomTextField(
                          controller: controller.titleCont,
                          hinText: 'Product Name',
                          labelText: 'Name',
                          validator: AuthValidators.required,
                          textInputAction: TextInputAction.next,
                        ),
                        CustomTextField(
                          autoValidationMode: AutovalidateMode.onUnfocus,
                          controller: controller.descriptionCont,
                          hinText: 'About Product',
                          labelText: 'Description',
                          // validator: AuthValidators.required,
                          lines: 4,
                          textInputAction: TextInputAction.newline,
                          keyboardType: TextInputType.multiline,
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

                        CustomTextField(
                          controller: controller.sizeCont,
                          hinText: 'Sizes',
                          readOnly: true,
                          // validator: AuthValidators.required,
                          onTap: () => controller.showSizeSelectionSheet(),
                          suffixWidget: Icon(
                            CupertinoIcons.chevron_down,
                            color: AppColors.black.withOpacity(0.5),
                            size: 16.sp,
                          ),
                        ),

                        CustomTextField(
                          controller: controller.categoryCont,
                          hinText: 'Categories',
                          readOnly: true,
                          validator: AuthValidators.required,
                          onTap: () => controller.showCategorySelectionSheet(),
                          suffixWidget: Icon(
                            CupertinoIcons.chevron_down,
                            color: AppColors.black.withOpacity(0.5),
                            size: 16.sp,
                          ),
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
                        controller.isEditProduct ? 'Update Product' : 'Post Ad',
                        color: AppColors.white,
                      ),
                      8.horizontalSpace,
                      Icon(
                        CupertinoIcons.chevron_right,
                        color: AppColors.white,
                      ),
                    ],
                  ),
                  onTap: () => controller.addPost(),
                ),
              ),
            ),
          ),
    );
  }
}
