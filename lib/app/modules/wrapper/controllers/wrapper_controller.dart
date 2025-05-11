import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:herdrobe_app/app/data/services/app_state_service.dart';
import 'package:herdrobe_app/app/data/services/auth_service.dart';
import 'package:herdrobe_app/app/data/services/db_service.dart';
import 'package:herdrobe_app/app/utils/loading_overlay.dart';
import 'package:herdrobe_app/main.dart';

class WrapperController extends GetxController {
  final AuthService _authService = Get.find<AuthService>();
  final DbService _databaseService = Get.find<DbService>();
  final AppStateService _appStateService = Get.find<AppStateService>();
  bool isLoading = false;

  bool get isLoggedIn => _authService.isLoggedIn;

  String? get displayName => _authService.firebaseUser?.displayName;

  WrapperViewModel() {
    init();
  }

  /// Subscription to the user stream for authentication state changes.
  // late final StreamSubscription<User?> userStreamSubscription;

  /// Provides a stream of authentication state changes.
  // Stream<User?> get authStateChanges =>
  //     FirebaseAuth.instance.authStateChanges();

  /// Initializes the ViewModel by listening to authentication state changes.
  init() async {
    if (isLoggedIn) {
      _authService.currentUser =
          (await _databaseService.fetchUserData(_authService.firebaseUser!)) ??
          _authService.currentUser;
      infoLog.i('User fetched: ${_authService.currentUser?.toMap()}');
      // _appStateService.init();
      isAppLoading = false;
    }
    // userStreamSubscription = authStateChanges.listen((user) async {
    //   if (user != null) {
    //     isLoading = true;
    //     _authService.currentUser =
    //         (await _databaseService.fetchUserData(
    //           _authService.firebaseUser!,
    //         )) ??
    //         _authService.currentUser;
    //     infoLog.i('User fetched: ${_authService.currentUser?.toMap()}');
    //     // _appStateService.init();
    //     isLoading = false;

    //     // Initialize the chat service with the current user details.
    //     // await AppTexChat.instance
    //     //     .initChat(
    //     //       currentUser: ChatUserModel(
    //     //         uid: _authService.appUser!.uid,
    //     //         profileUrl: _authService.appUser!.imageUrl,
    //     //         name: _authService.appUser!.fullName,
    //     //         fcmToken: _authService.appUser!.fcmToken,
    //     //       ),
    //     //     )
    //     //     .then((value) {
    //     //       log.i('Chat initialized');
    //     //     });
    //   } else {
    //     // _appStateService.dispose();
    //   }
    // });
  }

  @override
  void onInit() {
    init();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
