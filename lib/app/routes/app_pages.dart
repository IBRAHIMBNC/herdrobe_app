import 'package:get/get.dart';

import '../modules/FAQs/bindings/f_a_qs_binding.dart';
import '../modules/FAQs/views/f_a_qs_view.dart';
import '../modules/account/bindings/account_binding.dart';
import '../modules/account/views/account_view.dart';
import '../modules/addEditPost/bindings/add_edit_post_binding.dart';
import '../modules/addEditPost/views/add_edit_post_view.dart';
import '../modules/adminDashboard/bindings/admin_dashboard_binding.dart';
import '../modules/adminDashboard/views/admin_dashboard_view.dart';
import '../modules/adminNavigation/bindings/admin_navigation_binding.dart';
import '../modules/adminNavigation/views/admin_navigation_view.dart';
import '../modules/auth/forgotPassword/bindings/forgot_password_binding.dart';
import '../modules/auth/forgotPassword/views/forgot_password_view.dart';
import '../modules/auth/login/bindings/login_binding.dart';
import '../modules/auth/login/views/login_view.dart';
import '../modules/auth/signUp/bindings/sign_up_binding.dart';
import '../modules/auth/signUp/views/sign_up_view.dart';
import '../modules/changePassword/bindings/change_password_binding.dart';
import '../modules/changePassword/views/change_password_view.dart';
import '../modules/checkOut/bindings/check_out_binding.dart';
import '../modules/checkOut/views/check_out_view.dart';
import '../modules/deleteAccount/bindings/delete_account_binding.dart';
import '../modules/deleteAccount/views/delete_account_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/navigation/bindings/navigation_binding.dart';
import '../modules/navigation/views/navigation_view.dart';
import '../modules/notification/bindings/notification_binding.dart';
import '../modules/notification/views/notification_view.dart';
import '../modules/orderDetails/bindings/order_details_binding.dart';
import '../modules/orderDetails/views/order_details_view.dart';
import '../modules/orders/bindings/orders_binding.dart';
import '../modules/orders/views/orders_view.dart';
import '../modules/pickLocationInMap/bindings/pick_location_in_map_binding.dart';
import '../modules/pickLocationInMap/views/pick_location_in_map_view.dart';
import '../modules/privacyPolicy/bindings/privacy_policy_binding.dart';
import '../modules/privacyPolicy/views/privacy_policy_view.dart';
import '../modules/productDetails/bindings/product_details_binding.dart';
import '../modules/productDetails/views/product_details_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/profileCompletion/bindings/profile_completion_binding.dart';
import '../modules/profileCompletion/views/profile_completion_view.dart';
import '../modules/searchProduct/bindings/search_product_binding.dart';
import '../modules/searchProduct/views/search_product_view.dart';
import '../modules/sellerDetails/bindings/seller_details_binding.dart';
import '../modules/sellerDetails/views/seller_details_view.dart';
import '../modules/welcome/bindings/welcome_binding.dart';
import '../modules/welcome/views/welcome_view.dart';
import '../modules/whishlist/bindings/whishlist_binding.dart';
import '../modules/whishlist/views/whishlist_view.dart';
import '../modules/yourPost/bindings/your_post_binding.dart';
import '../modules/yourPost/views/your_post_view.dart';

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
    GetPage(
      name: _Paths.SELLER_DETAILS,
      page: () => const SellerDetailsView(),
      binding: SellerDetailsBinding(),
    ),
    GetPage(
      name: _Paths.CHECK_OUT,
      page: () => const CheckOutView(),
      binding: CheckOutBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => const NotificationView(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: _Paths.ORDERS,
      page: () => const OrdersView(),
      binding: OrdersBinding(),
    ),
    GetPage(
      name: _Paths.ORDER_DETAILS,
      page: () => const OrderDetailsView(),
      binding: OrderDetailsBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.ACCOUNT,
      page: () => const AccountView(),
      binding: AccountBinding(),
    ),
    GetPage(
      name: _Paths.CHANGE_PASSWORD,
      page: () => const ChangePasswordView(),
      binding: ChangePasswordBinding(),
    ),
    GetPage(
      name: _Paths.DELETE_ACCOUNT,
      page: () => const DeleteAccountView(),
      binding: DeleteAccountBinding(),
    ),
    GetPage(
      name: _Paths.WHISHLIST,
      page: () => const WhishlistView(),
      binding: WhishlistBinding(),
    ),
    GetPage(
      name: _Paths.YOUR_POST,
      page: () => const YourPostView(),
      binding: YourPostBinding(),
    ),
    GetPage(
      name: _Paths.ADD_EDIT_POST,
      page: () => const AddEditPostView(),
      binding: AddEditPostBinding(),
    ),
    GetPage(
      name: _Paths.PICK_LOCATION_IN_MAP,
      page: () => const PickLocationInMapView(),
      binding: PickLocationInMapBinding(),
    ),
    GetPage(
      name: _Paths.F_A_QS,
      page: () => const FAQsView(),
      binding: FAQsBinding(),
    ),
    GetPage(
      name: _Paths.PRIVACY_POLICY,
      page: () => const PrivacyPolicyView(),
      binding: PrivacyPolicyBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_DASHBOARD,
      page: () => const AdminDashboardView(),
      binding: AdminDashboardBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_NAVIGATION,
      page: () => const AdminNavigationView(),
      binding: AdminNavigationBinding(),
    ),
  ];
}
