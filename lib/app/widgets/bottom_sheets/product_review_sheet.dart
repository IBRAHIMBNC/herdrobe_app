import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:herdrobe_app/app/utils/app_colors.dart';
import 'package:herdrobe_app/app/widgets/custom_text.dart';
import 'package:herdrobe_app/app/widgets/custom_text_field.dart';
import 'package:herdrobe_app/app/widgets/generic_bottom_sheet.dart';
import 'package:herdrobe_app/app/widgets/my_rounded_button.dart';
import 'package:herdrobe_app/app/widgets/rating_stars.dart';

class GiveProductReviewSheet extends StatelessWidget {
  const GiveProductReviewSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return GenericBottomSheet(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RatingStars(
            rating: 3.5,
            size: 50.sp,
            onChanged:
                (false
                    ? null
                    : (val) {
                      // viewModel.rating = val.toInt();
                    }),
          ),

          16.verticalSpace,
          CustomText.bigHeading('How was the service'),
          12.verticalSpace,
          CustomText.paragraph(
            'Your opinion is very helpful for us. Help us be better by giving us an honest score below',
            textAlign: TextAlign.center,
            color: AppColors.textColor2,
          ),
          16.verticalSpace,

          Align(
            alignment: Alignment.centerLeft,
            child: CustomText.small12(
              'Please Share Your experience',
              color: AppColors.textColor2,
            ),
          ),
          8.verticalSpace,
          CustomTextField(
            readOnly: false,
            // controller: viewModel.reviewCont,
            hinText: 'Write here...',
            lines: 4,
          ),
          16.verticalSpace,
          if (true)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: RoundedButton(
                    'Maybe Later',
                    radius: 40.r,
                    fontColor: AppColors.textColor1,
                    backgroundColor: AppColors.cardColor,
                    // onTap: () => completer!(SheetResponse(confirmed: false)),
                  ),
                ),
                12.horizontalSpace,
                Expanded(
                  child: RoundedButton(
                    'Submit Review',
                    radius: 40.r,
                    backgroundColor: AppColors.brand,
                    // onTap: () => viewModel.giveReview(completer!),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
