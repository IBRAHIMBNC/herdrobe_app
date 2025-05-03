import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:herdrobe_app/app/constants/paddings.dart';
import 'package:herdrobe_app/app/utils/app_colors.dart';
import 'package:herdrobe_app/app/utils/app_icons.dart';
import 'package:herdrobe_app/app/utils/app_text_styles.dart';
import 'package:herdrobe_app/app/widgets/custom_text.dart';
import 'package:intl/intl.dart';

class CustomTextField extends StatefulWidget {
  final TextInputType keyboardType;
  final FocusNode? focusNode;
  final AutovalidateMode? autoValidationMode;
  final String hinText;
  final Color? bgColor;
  final bool isPassword;
  final double? borderRadius;
  final String? Function(String?)? validator;
  final Function(String? val)? onSave;
  final Size size;
  final String? suffixText;
  final int? minLines;
  final bool readOnly;
  final TextEditingController? controller;
  final int? lines;
  final bool obscureText;
  final Function(String? value)? onChanged;
  final String? prefixIcon;
  final Function()? onTap;
  final bool isUnderlineBorder;
  final Widget? suffixWidget;
  final Color? borderColor;
  final Widget? prefix;
  final EdgeInsetsGeometry? prefixIconPadding;
  final String? labelText;
  final TextInputAction textInputAction;
  final Function(String)? onFieldSubmitted;
  final String? errorText;
  final bool isDisabled;
  final double? verticalPadding;
  final EdgeInsetsGeometry? margin;
  final Color? fontColor;

  const CustomTextField({
    super.key,
    required this.hinText,
    this.isPassword = false,
    this.onSave,
    this.validator,
    this.bgColor,
    this.borderRadius = 15,
    this.size = const Size(95, 6),
    this.keyboardType = TextInputType.text,
    this.controller,
    this.autoValidationMode = AutovalidateMode.onUserInteraction,
    this.lines,
    this.onChanged,
    this.suffixText,
    this.onTap,
    this.minLines,
    this.readOnly = false,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixWidget,
    this.prefix,
    this.prefixIconPadding,
    this.isUnderlineBorder = false,
    this.borderColor,
    this.labelText,
    this.textInputAction = TextInputAction.done,
    this.onFieldSubmitted,
    this.errorText,
    this.isDisabled = false,
    this.verticalPadding,
    this.margin,
    this.fontColor,
    this.focusNode,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool isVisible;
  bool showErrorMessage = false;
  late FocusNode _focusNode;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();

    isVisible = widget.isPassword;
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_handleFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_handleFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _handleFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    final lightGreyColor = AppColors.textColor2;
    final defaultTextFieldColor = AppColors.textField;
    final errorColor = AppColors.errorColor;
    final defaultTextColor = AppColors.textColor1;
    final defaultBorderColor = Colors.transparent;
    final iconPadding = EdgeInsets.only(
      right: kPadding16.w,
      left: kPadding4.w,
      bottom: kPadding12.h,
      top: kPadding12.h,
    );

    return TextFormField(
      focusNode: _focusNode,
      minLines: widget.minLines,
      onTap: widget.isDisabled ? null : widget.onTap,
      textInputAction: widget.textInputAction,
      onFieldSubmitted: widget.onFieldSubmitted,
      onChanged: (value) => widget.onChanged?.call(value),
      readOnly: widget.readOnly,
      maxLines: widget.lines ?? 1,
      style: AppTextStyles.paragraph14.copyWith(
        color: widget.fontColor ?? defaultTextColor,
      ),
      autovalidateMode: widget.autoValidationMode,
      controller: widget.controller,
      validator: widget.validator,
      onSaved: widget.onSave,
      keyboardType: widget.keyboardType,
      obscureText: isVisible,
      cursorColor: lightGreyColor,
      inputFormatters: [
        if (widget.keyboardType == TextInputType.number)
          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
        if (widget.keyboardType == TextInputType.number)
          CurrencyInputFormatter(),
      ],

      decoration: InputDecoration(
        errorText: showErrorMessage ? widget.errorText : null,
        contentPadding: EdgeInsets.symmetric(
          horizontal: kPadding20.w,
          vertical: widget.verticalPadding ?? 18.h,
        ),
        filled: true,
        fillColor: widget.bgColor ?? defaultTextFieldColor,
        hintStyle: AppTextStyles.paragraph14.copyWith(
          color: AppColors.textColor2,
        ),
        hintText: widget.hinText,
        errorStyle: AppTextStyles.paragraph14.copyWith(
          color: errorColor,
          fontSize: 12.sp,
        ),
        constraints: BoxConstraints(minHeight: widget.size.height.h),
        alignLabelWithHint: true,
        suffixText: widget.suffixText,
        // label: widget.labelText == null ? null : Text(widget.labelText!),
        // labelStyle: AppTextStyles.paragraph14.copyWith(
        //   color: AppColors.textColor2,
        // ),
        labelText: widget.labelText,
        labelStyle: AppTextStyles.paragraph14.copyWith(
          color: AppColors.textColor2,
        ),

        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius!),
          borderSide: const BorderSide(color: Colors.red),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius!),
          borderSide: const BorderSide(color: Colors.red),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius!),
          borderSide: BorderSide(
            color: widget.borderColor ?? defaultBorderColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius!),
          borderSide: const BorderSide(color: AppColors.brand),
        ),
        prefixIcon:
            widget.prefixIcon == null
                ? null
                : Padding(
                  padding:
                      widget.prefixIconPadding ??
                      EdgeInsets.only(
                        left: kPadding16.w,
                        right: kPadding4.w,
                        bottom: kPadding12.h,
                        top: kPadding12.h,
                      ),
                  child: SvgPicture.asset(
                    color: _isFocused ? AppColors.brand : AppColors.textColor2,
                    widget.prefixIcon.toString(),
                  ),
                ),
        suffixIcon:
            widget.isPassword
                ? InkWell(
                  onTap: () {
                    setState(() {
                      isVisible = !isVisible;
                    });
                  },
                  child: Padding(
                    padding: iconPadding,
                    child: SvgPicture.asset(
                      !isVisible ? AppIcons.eyeOff : AppIcons.eyeOn,
                      color: _isFocused ? AppColors.brand : lightGreyColor,
                    ),
                  ),
                )
                : widget.suffixWidget,
      ),
    );
  }
}

class CurrencyInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    double value = double.parse(newValue.text);

    final formatter = NumberFormat.decimalPattern();

    String newText = formatter.format(value);

    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
