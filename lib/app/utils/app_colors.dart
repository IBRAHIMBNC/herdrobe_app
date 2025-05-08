import 'package:flutter/widgets.dart';

class AppColors {
  const AppColors._();

  static const Color brand = Color(0xffEF8220);
  static const Color white = Color(0xffffffff);
  static const Color black = Color(0xff000000);
  static const Color black30 = Color(0x4D000000);
  static const Color black20 = Color(0x33000000);
  static const Color black10 = Color(0x1A000000);
  static const Color black5 = Color(0x0D000000);

  static const Color textColor1 = Color(0xff393A44);
  static const Color textColor2 = Color(0xff828386);
  static const Color grey = Color(0xffD2D4DA);
  static const Color lightGrey = Color(0xffD9D9D9);
  static const Color textField = Color(0xffF8F8F8);
  static const Color background = white;
  static const Color successColor = Color(0xff4FAD2E);
  static const Color errorColor = Color(0xffE13434);
  static const Color cardColor = textField;
  static const Color mulledWine = Color(0xff624C79);

  static const Color _gradientColor1 = Color(0xffEF8220);
  static const Color _gradientColor2 = Color(0xffEF6820);

  static const LinearGradient appBarGradient = LinearGradient(
    colors: [_gradientColor2, _gradientColor1],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const Color blue = Color(0xff278AE5);
  static const Color darkBlue = Color(0xff1F27EF);
}
