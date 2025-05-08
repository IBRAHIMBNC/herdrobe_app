// import 'dart:io';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
// import 'package:herdrobe_app/app/data/models/order.dart';
// import 'package:herdrobe_app/app/data/models/user.dart';
// import 'package:herdrobe_app/app/data/services/auth_service.dart';
// import 'package:herdrobe_app/app/data/services/logger_service.dart';

// class DbService extends GetxService {
//   final CollectionReference usersReference = FirebaseFirestore.instance
//       .collection('Users');

//   final CollectionReference productsReference = FirebaseFirestore.instance
//       .collection('Products');

//   final orderRef = FirebaseFirestore.instance.collection('Orders');

//   String? get currentUserId {
//     final authService = Get.find<AuthService>();
//     final user = authService.currentUser;
//     return user?.uid;
//   }

//   String get generateDocId {
//     return productsReference.doc().id;
//   }

//   CollectionReference get getCartReference {
//     final authService = Get.find<AuthService>();
//     final user = authService.currentUser;
//     return FirebaseFirestore.instance
//         .collection('Carts')
//         .doc(user?.uid)
//         .collection('Items');
//   }

//   //=========================================
//   // Add and Update User Data in Firestore
//   //=========================================

//   Future<void> addUser(AppUser user) async {
//     await usersReference.doc(user.uid).set(user.toMap());
//   }

//   Future<void> updateUser(AppUser user, {bool isUpdateUserOnly = false}) async {
//     DocumentReference userRef = usersReference.doc(user.uid);
//     DocumentSnapshot userSnapshot = await userRef.get();

//     if (userSnapshot.exists && !isUpdateUserOnly) {
//       await userRef.update(user.toMap());
//     } else {
//       await userRef.update(user.toMap());
//     }
//   }

//   Future<AppUser?> fetchUserData(User user) async {
//     final doc = await usersReference.doc(user.uid).get();
//     if (!doc.exists) {
//       return null;
//     }
//     final appUser = AppUser.fromMap(doc.data() as Map<String, dynamic>);

//     return appUser;
//   }

//   Future<void> deleteUser(String userId) async {
//     await usersReference.doc(userId).delete().then((value) {
//       logInfo('userDataDeleted');
//     });
//   }

//   //=========================================
//   // Upload File to Firebase Storage
//   //=========================================
//   Future<String> _uploadPostImageToFireStore({
//     required File file,
//     required String fileName,
//     required String path,
//   }) async {
//     try {
//       // Validate file
//       if (!file.existsSync()) {
//         throw Exception('File does not exist');
//       }

//       final imgExtension = file.path.split('.').last;
//       if (imgExtension.isEmpty) {
//         throw Exception('Invalid file extension');
//       }

//       final ref = FirebaseStorage.instance
//           .ref()
//           .child(path)
//           .child(fileName + '.' + imgExtension);

//       // Check if the file already exists and delete it
//       try {
//         await ref.getDownloadURL();
//         await ref.delete();
//       } catch (e) {
//         // File does not exist, proceed without deletion
//       }

//       // Upload the file
//       await ref.putFile(
//         file,
//         SettableMetadata(contentType: 'image/$imgExtension'),
//       );

//       // Return the download URL
//       return await ref.getDownloadURL();
//     } on FirebaseException catch (e) {
//       logError('Firebase Storage error: ${e.message}');
//       throw Exception('Failed to upload image: ${e.message}');
//     } catch (e) {
//       logError('Unexpected error: $e');
//       throw Exception('An unexpected error occurred: $e');
//     }
//   }

//   deleteFileByUrl(String path) async {
//     try {
//       FirebaseStorage storage = FirebaseStorage.instance;
//       Reference firebaseStorageRef = storage.refFromURL(path);
//       await firebaseStorageRef.delete();
//     } catch (e) {
//       logError('Error Deleting File: $e');
//     }
//   }

//   Future<String?> uploadProfileImage({required File file}) async {
//     try {
//       final String path = 'Profiles';
//       return await _uploadPostImageToFireStore(
//         file: file,
//         fileName: currentUserId!,
//         path: path,
//       );
//     } catch (e) {
//       logError('Error uploading profile image: $e');
//       return null;
//     }
//   }
// }
