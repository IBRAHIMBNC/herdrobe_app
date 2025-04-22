import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:herdrobe_app/app/constants/paddings.dart';
import 'package:herdrobe_app/app/extensions/double.dart';
import 'package:herdrobe_app/app/utils/app_colors.dart';
import 'package:herdrobe_app/app/widgets/my_container.dart';

class GeneralBottomSheet extends StatefulWidget {
  const GeneralBottomSheet({super.key, this.body});
  final Widget? body;

  @override
  _GeneralBottomSheetState createState() => _GeneralBottomSheetState();
}

class _GeneralBottomSheetState extends State<GeneralBottomSheet>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = BottomSheet.createAnimationController(this);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      backgroundColor: Colors.transparent,
      elevation: 0,
      onClosing: () {
        print('Bottom sheet closed');
      },
      animationController: _animationController,
      builder: (context) {
        return BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 2,
            sigmaY: 2,
            tileMode: TileMode.decal,
          ),
          child: MyContainer(
            color: AppColors.white,
            onTap: () {
              Navigator.pop(context);
            },
            radius: BorderRadius.only(
              topLeft: Radius.circular(24.r),
              topRight: Radius.circular(24.r),
            ),
            width: double.infinity,
            padding: kPadding24.all,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                MyContainer(
                  height: 4.h,
                  width: 32.w,
                  radius: 20.r,
                  color: AppColors.mulledWine.withOpacity(0.2),
                ),
                kPadding24.verticalSpace,
                widget.body ?? const SizedBox(),
              ],
            ),
          ),
        );
      },
    );
  }
}
