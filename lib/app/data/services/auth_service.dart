// import 'dart:io';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get/get.dart';
// import 'package:herdrobe_app/app/data/enums/firebase_exceptions.dart';
// import 'package:herdrobe_app/app/data/models/user.dart';
// import 'package:herdrobe_app/app/data/services/db_service.dart';
// import 'package:herdrobe_app/app/data/services/logger_service.dart';

import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';

class AuthService extends GetxService {
  final bool isAdmin = false;
  //   AppUser? currentUser;
  //   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  //   final _databaseService = Get.find<DbService>();

  //   User? get firebaseUser => _firebaseAuth.currentUser;
  //   bool get isLoggedIn => firebaseUser != null;

  init() async {
    // if (firebaseUser != null) {
    //   try {
    //     currentUser = await _databaseService.fetchUserData(firebaseUser!);
    //   } catch (e) {
    //     logError('Error fetching user data: $e');
    //   }
    // }
  }

  //   @override
  //   void onInit() {
  //     init();
  //     super.onInit();
  //   }

  //   Future<void> signOut() async {
  //     // _databaseService.updateFCMToken(currentUser!.uid, null);
  //     currentUser = null;
  //     return _firebaseAuth.signOut();
  //   }

  //   Future<bool> createUserWithEmailAndPassword({
  //     required AppUser appUser,
  //     required File? imageFile,
  //     required String password,
  //     bool sendVerificationMail = false,
  //   }) async {
  //     User? user;
  //     try {
  //       String? imageUrl;
  //       if (imageFile != null) {
  //         imageUrl = await _databaseService.uploadProfileImage(file: imageFile);
  //       }

  //       UserCredential userCredential = await _firebaseAuth
  //           .createUserWithEmailAndPassword(
  //             email: appUser.email,
  //             password: password,
  //           );

  //       user = userCredential.user;
  //       appUser = appUser.copyWith(uid: user!.uid, photoUrl: imageUrl);
  //       _databaseService.addUser(appUser);
  //       //TODO: add user to firestore
  //       // await user.updateDisplayName(ksUserType);
  //       // await user.reload();
  //       user = _firebaseAuth.currentUser;
  //       if (sendVerificationMail) {
  //         await user?.sendEmailVerification();
  //       }
  //       return true;
  //     } on FirebaseAuthException catch (e) {
  //       final exception = FirebaseAuthErrorCode.fromCode(e.code);
  //       logError(exception?.msg ?? e.toString());
  //     } catch (e) {
  //       logError('$e');
  //       return false;
  //     }
  //     return false;
  //   }

  //   Future<bool> signInWithEmailAndPassword({
  //     required String email,
  //     required String password,
  //     bool checkIfEmailIsVerified = false,
  //   }) async {
  //     User? user;
  //     try {
  //       UserCredential userCredential = await _firebaseAuth
  //           .signInWithEmailAndPassword(email: email, password: password);
  //       user = userCredential.user;

  //       logInfo(" User SignIn Successful");
  //       currentUser = await _databaseService.fetchUserData(user!);
  //       // updateFcmToken();

  //       return true;
  //     } on FirebaseAuthException catch (e) {
  //       final exception = FirebaseAuthErrorCode.fromCode(e.code);
  //       logError(exception?.msg ?? e.toString());
  //     } catch (e) {
  //       logError('$e');
  //       return false;
  //     }
  //     return false;
  //   }

  //   ///Sends a verification email to the current user
  //   Future<void> sendEmailVerification() async {
  //     User? user = _firebaseAuth.currentUser;
  //     user?.sendEmailVerification().catchError((e) {
  //       final exception = FirebaseAuthErrorCode.fromCode(e.code);
  //       logError(exception?.msg ?? e.toString());
  //     });
  //   }

  //   /// Checks if the email of current user is verified
  //   bool get isEmailVerified {
  //     User? user = _firebaseAuth.currentUser;
  //     return user?.emailVerified ?? false;
  //   }

  //   Future<bool> resetPassword(String email) async {
  //     try {
  //       await _firebaseAuth.sendPasswordResetEmail(email: email);
  //       return true;
  //     } on FirebaseAuthException catch (e) {
  //       final exception = FirebaseAuthErrorCode.fromCode(e.code);
  //       logError(exception?.msg ?? e.toString());
  //       return false;
  //     }
  //   }

  //   Future<bool> deleteAccount(String password) async {
  //     var currentUser = _firebaseAuth.currentUser;
  //     if (currentUser != null) {
  //       final credential = EmailAuthProvider.credential(
  //         email: currentUser.email!,
  //         password: password.trim(),
  //       );
  //       try {
  //         await currentUser.reauthenticateWithCredential(credential);
  //       } catch (err) {
  //         logError('Reauthentication failed: $err');
  //         return false;
  //       }
  //       _databaseService.deleteUser(currentUser.uid);
  //       currentUser.delete();
  //       return true;
  //     }
  //     return false;
  //   }
  //
  //   Future<bool> changePassword(
  //     String currentPassword,
  //     String newPassword,
  //   ) async {
  //     try {
  //       final credential = EmailAuthProvider.credential(
  //         email: currentUser!.email,
  //         password: currentPassword,
  //       );
  //       await firebaseUser!.reauthenticateWithCredential(credential).catchError((
  //         err,
  //       ) {
  //         throw err;
  //       });
  //       await firebaseUser!.updatePassword(newPassword);
  //       return true;
  //     } on FirebaseAuthException catch (error) {
  //       final exception = FirebaseAuthErrorCode.fromCode(error.code);
  //       logError(exception?.msg ?? error.toString());
  //     }

  //     return false;
  //   }
}
