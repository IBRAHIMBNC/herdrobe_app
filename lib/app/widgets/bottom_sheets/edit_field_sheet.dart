import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:herdrobe_app/app/utils/auth_validators.dart';
import 'package:herdrobe_app/app/utils/my_utils.dart';
import 'package:herdrobe_app/app/widgets/custom_text.dart';
import 'package:herdrobe_app/app/widgets/custom_text_field.dart';
import 'package:herdrobe_app/app/widgets/generic_bottom_sheet.dart';
import 'package:herdrobe_app/app/widgets/my_rounded_button.dart';

class EditFieldSheet extends StatelessWidget {
  const EditFieldSheet({
    super.key,
    this.initialValue,
    this.title,
    this.hintText,
  });
  final String? initialValue;
  final String? title;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    String? value;
    return GenericBottomSheet(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText.smallHeading16(title ?? 'Edit Field'),
          16.verticalSpace,
          CustomTextField(
            controller: TextEditingController(text: initialValue),
            hinText: hintText ?? '',
            textInputAction: TextInputAction.done,
            onChanged: (val) {
              value = val?.trim();
            },
            validator: AuthValidators.username,
          ),
          20.verticalSpace,
          RoundedButton(
            'Update',
            onTap: () {
              Get.back<String?>(result: value);
            },
          ),
        ],
      ),
    );
  }
}
