import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:herdrobe_app/app/utils/app_colors.dart';
import 'package:herdrobe_app/app/utils/app_text_styles.dart';
import 'package:pinput/pinput.dart';

class OTPField extends StatelessWidget {
  const OTPField({super.key, this.onCompleted});

  final Function(String otp)? onCompleted;

  @override
  Widget build(BuildContext context) {
    return Pinput(
      // focusNode: focusNode,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      isCursorAnimationEnabled: true,
      showCursor: true,
      autofocus: true,
      closeKeyboardWhenCompleted: false,
      length: 4,
      // errorText: model.otpErrorText,
      onCompleted: (String value) async {
        onCompleted?.call(value);
      },
      onChanged: (String value) {
        // model.otpErrorText = null;
      },
      errorTextStyle: AppTextStyles.small12.copyWith(
        color: AppColors.errorColor,
      ),
      submittedPinTheme: pinTheme(borderColor: Colors.transparent),
      focusedPinTheme: pinTheme(borderColor: AppColors.brand),
      errorPinTheme: pinTheme(),
      defaultPinTheme: pinTheme(borderColor: Color(0xffEEEEEE)),
      disabledPinTheme: pinTheme(),
      // controller: controller.otpController,
    );
  }

  PinTheme pinTheme({
    TextStyle? textStyle,
    Color backgroundColor = AppColors.textField,
    Color borderColor = AppColors.textField,
    Radius borderRadius = const Radius.circular(12),
  }) {
    return PinTheme(
      width: 76.w,
      height: 76.h,
      textStyle: AppTextStyles.boldHeading18,
      margin: EdgeInsetsDirectional.only(end: 14.w),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(color: borderColor, width: 1.65),
        borderRadius: BorderRadius.circular(12.r),
      ),
    );
  }
}
