import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:herdrobe_app/app/constants/strings.dart';
import 'package:herdrobe_app/app/utils/app_colors.dart';
import 'package:herdrobe_app/app/utils/app_text_styles.dart';
import 'package:herdrobe_app/app/utils/rounded_button_styles.dart';

import 'app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // debugRepaintRainbowEnabled = true;
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
      statusBarBrightness: Brightness.light, // For iOS (dark icons)
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const double designWidth = 393;
    const double designHeight = 852;
    return ScreenUtilInit(
      designSize: Size(designWidth, designHeight),
      minTextAdapt: true,
      builder: (_, child) {
        return GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: GetMaterialApp(
            title: "HERDROBE",
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              radioTheme: RadioThemeData(
                visualDensity: VisualDensity.compact,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                overlayColor: WidgetStatePropertyAll(Colors.amber),
                fillColor: WidgetStateProperty.resolveWith<Color>((states) {
                  if (states.contains(WidgetState.disabled)) {
                    return AppColors.grey;
                  } else if (states.contains(WidgetState.selected)) {
                    return AppColors.brand;
                  }
                  return Colors.grey;
                }),
              ),
              useMaterial3: true,
              fontFamily: kcFontFamily,
              textTheme: TextTheme(labelLarge: AppTextStyles.largeHeading32),
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButtonStyles.filledStyle,
              ),
              scaffoldBackgroundColor: AppColors.background,
              colorScheme: ColorScheme.fromSwatch().copyWith(
                surfaceTint: Colors.transparent,
              ),
            ),
            initialRoute: Routes.LOGIN,
            getPages: AppPages.routes,
          ),
        );
      },
    );
  }
}
