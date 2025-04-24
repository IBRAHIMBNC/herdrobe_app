import 'package:get/get.dart';

import '../modules/auth/forgotPassword/bindings/forgot_password_binding.dart';
import '../modules/auth/forgotPassword/views/forgot_password_view.dart';
import '../modules/auth/login/bindings/login_binding.dart';
import '../modules/auth/login/views/login_view.dart';
import '../modules/auth/signUp/bindings/sign_up_binding.dart';
import '../modules/auth/signUp/views/sign_up_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/navigation/bindings/navigation_binding.dart';
import '../modules/navigation/views/navigation_view.dart';
import '../modules/productDetails/bindings/product_details_binding.dart';
import '../modules/productDetails/views/product_details_view.dart';
import '../modules/profileCompletion/bindings/profile_completion_binding.dart';
import '../modules/profileCompletion/views/profile_completion_view.dart';
import '../modules/searchProduct/bindings/search_product_binding.dart';
import '../modules/searchProduct/views/search_product_view.dart';
import '../modules/welcome/bindings/welcome_binding.dart';
import '../modules/welcome/views/welcome_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => const SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => const ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_COMPLETION,
      page: () => const ProfileCompletionView(),
      binding: ProfileCompletionBinding(),
    ),
    GetPage(
      name: _Paths.WELCOME,
      page: () => const WelcomeView(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: _Paths.NAVIGATION,
      page: () => const NavigationView(),
      binding: NavigationBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH_PRODUCT,
      page: () => const SearchProductView(),
      binding: SearchProductBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_DETAILS,
      page: () => const ProductDetailsView(),
      binding: ProductDetailsBinding(),
    ),
  ];
}
