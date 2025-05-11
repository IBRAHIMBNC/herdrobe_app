import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:herdrobe_app/app/constants/strings.dart';
import 'package:herdrobe_app/app/data/services/admin_sercice.dart';
import 'package:herdrobe_app/app/data/services/app_state_service.dart';
import 'package:herdrobe_app/app/data/services/auth_service.dart';
import 'package:herdrobe_app/app/data/services/db_service.dart';
import 'package:herdrobe_app/app/data/services/product_service.dart';
import 'package:herdrobe_app/app/utils/app_colors.dart';
import 'package:herdrobe_app/app/utils/app_text_styles.dart';
import 'package:herdrobe_app/app/utils/rounded_button_styles.dart';
import 'package:herdrobe_app/firebase_options.dart';
import 'package:roggle/roggle.dart';

import 'app/routes/app_pages.dart';

final errorLog = Roggle(level: Level.error);
final infoLog = Roggle(level: Level.info);
final debugLog = Roggle(level: Level.debug);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // debugRepaintRainbowEnabled = true;
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
      statusBarBrightness: Brightness.light, // For iOS (dark icons)
    ),
  );

  await initServices();
  runApp(MyApp());
}

Future<void> initServices() async {
  debugLog.i('All services started...');
  await Get.put(DbService());
  await Get.put(AuthService());
  await Get.put(AppStateService());
  await Get.put(ProductService());
  await Get.put(AdminSercice());
  debugLog.i('All services initialized...');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const double designWidth = 393;
    const double designHeight = 852;
    FirebaseAuth.instance.signOut();
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
            initialRoute: AppPages.INITIAL,
            getPages: AppPages.routes,
          ),
        );
      },
    );
  }
}
