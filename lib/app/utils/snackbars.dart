import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:herdrobe_app/app/data/extensions/double.dart';
import 'package:herdrobe_app/app/utils/app_colors.dart';
import 'package:herdrobe_app/app/widgets/circle_button.dart';
import 'package:herdrobe_app/app/widgets/custom_text.dart';

showErrorSnackBar({String? title, String? message}) {
  return _showSnackBar(
    title: title,
    message: message,
    backgroundColor: AppColors.errorColor,
  );
}

showSuccessSnackBar({String? title, String? message}) {
  return _showSnackBar(
    title: title,
    message: message,
    backgroundColor: AppColors.successColor,
  );
}

_showSnackBar({String? title, String? message, Color? backgroundColor}) {
  return ScaffoldMessenger.of(Get.context!).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.fixed,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null)
            CustomText.boldParagraph(title, color: AppColors.white),
          Row(
            children: [
              Expanded(
                child: CustomText.small12(
                  message ?? 'Something went wrong',
                  color: AppColors.white,
                ),
              ),
              IconButton(
                icon: Icon(Icons.close, color: AppColors.white),
                onPressed: () {
                  ScaffoldMessenger.of(Get.context!).hideCurrentSnackBar();
                },
              ),
            ],
          ),
        ],
      ),
      backgroundColor: backgroundColor ?? AppColors.errorColor,
      duration: const Duration(seconds: 3),
    ),
  );
}
